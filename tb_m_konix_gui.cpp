#include <stdlib.h>
#include <unordered_map>
#include <unordered_set>
#include <thread>

#include "Vm_konix.h"
#include "Vm_konix_m_konix.h"
#include "Vm_konix_m8088.h"
#include "Vm_konix_execution.h"
#include "Vm_konix_bus_interface.h"
#include "Vm_konix__Syms.h"

#include "verilated.h"
#include "verilated_vcd_c.h"

#include "imgui.h"
#include "imgui_impl_sdl.h"
#include "imgui_impl_opengl2.h"

#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>

std::unordered_map<unsigned int, std::string> symbolTable;
std::unordered_set<unsigned int> breakpoints;
int xtalCnt=0;
int xtal=0;
Vm_konix *tb;

void tick()
{
    tb->clk_sys=1;
    tb->eval();
    tb->clk_sys=0;
    tb->eval();
    xtalCnt++;
    if (xtalCnt>2)
    {
        tb->XTAL = (~tb->XTAL)&1;
        xtalCnt=0;
    }
}

int doNTicks(VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick();
    }
    return ticks+n;
}

int videoLastVSync=2;
int videoLastHSync=2;
int lastChroma=2;

int waitingForFrameStart=1;

int HCnt=0;
int lineNum=0;

int virtFrameNum=0;
char filename[128];

GLuint videoTexture;
unsigned char display[4*640*320];

int ProcessVideo()
{
    if ( (lastChroma==0) && (tb->CE_PIXEL==1) )
    {
        // can now look at other signals

        if (waitingForFrameStart)
        {
            if ((videoLastVSync==1) && (tb->VGA_VS==0))
            {
                waitingForFrameStart=0;
                virtFrameNum++;
                return 1;
            }
        }
        else
        {
            if ((videoLastVSync==0) && (tb->VGA_VS==1))
            {
                waitingForFrameStart=1;
                HCnt=0;
                lineNum=0;
                return 1;
            }
            else
            {
                // we will miss the first line with this logic, ho hum
                if ((videoLastHSync==1) && (tb->VGA_HS==0))
                {
                    HCnt=0;
                    lineNum++;
                }

                if (lineNum>0 && HCnt<640)
                {
                    // output pixel
                    int red = tb->VGA_R;
                    int green = tb->VGA_G;
                    int blue = tb->VGA_B;
                    
                    uint8_t r,g,b;
                    r=red;
                    g=green;
                    b=blue;

                    display[lineNum*640*4 + HCnt*4 + 0]=r;
                    display[lineNum*640*4 + HCnt*4 + 1]=g;
                    display[lineNum*640*4 + HCnt*4 + 2]=b;
                    display[lineNum*640*4 + HCnt*4 + 3]=0xFF;
                }
            }
        }

        videoLastVSync=tb->VGA_VS;
        videoLastHSync=tb->VGA_HS;

        HCnt++;
    }
    lastChroma=tb->CE_PIXEL;
    return 0;
}

void initGUI();
void endGUI();
int tickGUI();

volatile bool threadDone=false;

volatile int tickPause=1;
volatile int stopNextTick=0;
volatile int stopCpu=0;
volatile uint64_t ticks=0;
volatile int atLeastOneInstruction=0;
unsigned int bpReached=0;

void verilatorOnThread()
{
    while (!threadDone)
    {
        if (tickPause)
            continue;
        
        ProcessVideo();
        tick();
        ticks++;

        if ((breakpoints.find(tb->m_konix->Processor->eu->instructionAddress) != breakpoints.end()) && (bpReached==0))
        {
            bpReached=tb->m_konix->Processor->eu->instructionAddress;
            tickPause=1;
            continue;
        }
        if (tb->m_konix->Processor->eu->instructionAddress != bpReached)
            bpReached=0;

        if (stopNextTick)
        {
            tickPause=1;
            stopNextTick=0;
        }
        if (stopCpu)
        {
            if (atLeastOneInstruction)
                if (tb->m_konix->Processor->eu->executionState == 0x1FD)
                    {
                        // Run one more tick to ensure registers are synced
                        while (tb->m_konix->Processor->eu->readTop!=1)
                        {
                            ProcessVideo();
                            tick();
                        }
                        tickPause=1; 
                        stopCpu=0;
                    }
        }
        if (!atLeastOneInstruction)
        {
            if (tb->m_konix->Processor->eu->executionState != 0x1FD)
                atLeastOneInstruction=1;
        }
    }
}


void LoadSymbols(const char* filename)
{
    char line[1024];
    char symbol[256];
    std::string debugFile = filename;
    debugFile+=".dbg";
    FILE *p88 = fopen(debugFile.c_str(), "r");
    if (p88 == nullptr)
        return;

    while (fgets(line, sizeof(line),p88))
    {
        unsigned int address;
        int cnt=sscanf(line,"%d%s",&address,symbol);
        if (2==cnt)
        {
            symbolTable[address]=symbol;
        }

    }

    fclose(p88);
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	tb = new Vm_konix;

	VerilatedVcdC *trace = nullptr;

    tb->ioctl_wr=0;
    tb->ioctl_addr=0;
    tb->ioctl_download=0;
    tb->ioctl_index=0;
    tb->ioctl_dout=0;
    tb->joy1L=0xFF;
    tb->joy2L=0xFF;
    tb->XTAL=0;
    tb->reset=1;

    //breakpoints.insert(529000);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(trace,ticks,1000);

    tb->reset=0;

// Load P88 (so we don't need to bother with initialising memory files anymore)
    if (argc>1)
    {
        printf("LOADING P88 : %s\n",argv[1]);
        LoadSymbols(argv[1]);
        FILE *p88 = fopen(argv[1], "rb");
        fseek(p88,0,SEEK_END);
        long size = ftell(p88);
        fseek(p88,0,SEEK_SET);

        tb->ioctl_download=1;   // Start of download
        ticks = doNTicks(trace, ticks, 1);

        while (size!=0)
        {
            // Check for Wait Condition
            if (tb->ioctl_wait==0)
            {
                // Read a byte
                size -= fread(&tb->ioctl_dout,1,1,p88);
                tb->ioctl_wr=1;
        
                ticks = doNTicks(trace, ticks, 1);
                tb->ioctl_wr=0;
            }
            else
            {
                ticks = doNTicks(trace, ticks, 1);
            }
        }
        tb->ioctl_download=0;
    }

    initGUI();

    const int TICKS_REFRESH=100000;
    int refresh=0;

    glGenTextures(1, &videoTexture);
    glBindTexture(GL_TEXTURE_2D, videoTexture);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    std::thread thread(verilatorOnThread);

    while (true)
    {
        glPixelStorei(GL_UNPACK_ROW_LENGTH,0);
        glBindTexture(GL_TEXTURE_2D, videoTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 640, 320, 0, GL_RGBA, GL_UNSIGNED_BYTE, display);

        if (tickGUI())
            break;
    }

    threadDone=true;
    thread.join();

    endGUI();

	exit(EXIT_SUCCESS);
}

SDL_Window* window=nullptr;
SDL_GLContext gl_context=nullptr;

void initGUI()
{
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER | SDL_INIT_GAMECONTROLLER)!=0)
    {
        printf("Error: %s\n", SDL_GetError());
        exit(EXIT_FAILURE);
    }

    // Setup window
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
    SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);
    SDL_WindowFlags window_flags = (SDL_WindowFlags)(SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI);
    window = SDL_CreateWindow("KONIX MULTISYSTEM VERILATOR", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 1480, 720, window_flags);
    gl_context = SDL_GL_CreateContext(window);
    SDL_GL_MakeCurrent(window, gl_context);
    SDL_GL_SetSwapInterval(1); // Enable vsync

    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;       // Enable Keyboard Controls
    //io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad;      // Enable Gamepad Controls
    io.ConfigFlags |= ImGuiConfigFlags_DockingEnable;           // Enable Docking
    io.ConfigFlags |= ImGuiConfigFlags_ViewportsEnable;         // Enable Multi-Viewport / Platform Windows
    //io.ConfigViewportsNoAutoMerge = true;
    //io.ConfigViewportsNoTaskBarIcon = true;

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();
    //ImGui::StyleColorsClassic();

    // When viewports are enabled we tweak WindowRounding/WindowBg so platform windows can look identical to regular ones.
    ImGuiStyle& style = ImGui::GetStyle();
    if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable)
    {
        style.WindowRounding = 0.0f;
        style.Colors[ImGuiCol_WindowBg].w = 1.0f;
    }

    // Setup Platform/Renderer backends
    ImGui_ImplSDL2_InitForOpenGL(window, gl_context);
    ImGui_ImplOpenGL2_Init();
}

void endGUI()
{
    // Cleanup
    ImGui_ImplOpenGL2_Shutdown();
    ImGui_ImplSDL2_Shutdown();
    ImGui::DestroyContext();

    SDL_GL_DeleteContext(gl_context);
    SDL_DestroyWindow(window);
    SDL_Quit();
}

bool showDemo=true;
void RegistersView();
void DisassmView();
void ButtonBar();
void StatusBar();

int tickGUI()
{
    bool done=false;
    ImVec4 clear_color = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

    // Poll and handle events (inputs, window resize, etc.)
    // You can read the io.WantCaptureMouse, io.WantCaptureKeyboard flags to tell if dear imgui wants to use your inputs.
    // - When io.WantCaptureMouse is true, do not dispatch mouse input data to your main application, or clear/overwrite your copy of the mouse data.
    // - When io.WantCaptureKeyboard is true, do not dispatch keyboard input data to your main application, or clear/overwrite your copy of the keyboard data.
    // Generally you may always pass all inputs to dear imgui, and hide them from your application based on those two flags.
    SDL_Event event;
    while (SDL_PollEvent(&event))
    {
        ImGui_ImplSDL2_ProcessEvent(&event);
        if (event.type == SDL_QUIT)
            done = true;
        if (event.type == SDL_WINDOWEVENT && event.window.event == SDL_WINDOWEVENT_CLOSE && event.window.windowID == SDL_GetWindowID(window))
            done = true;
    }

    // Start the Dear ImGui frame
    ImGui_ImplOpenGL2_NewFrame();
    ImGui_ImplSDL2_NewFrame();
    ImGui::NewFrame();


    //// UI HERE
    ImGui::Begin("Virtual Frame Buffer");
    ImGui::Image((void*)(intptr_t)videoTexture, ImVec2(640,320));
    ImGui::End();

    RegistersView();
    DisassmView();
    ButtonBar();
    StatusBar();

    if (showDemo)
        ImGui::ShowDemoWindow(&showDemo);

    // Rendering
    ImGui::Render();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    glViewport(0, 0, (int)io.DisplaySize.x, (int)io.DisplaySize.y);
    glClearColor(clear_color.x * clear_color.w, clear_color.y * clear_color.w, clear_color.z * clear_color.w, clear_color.w);
    glClear(GL_COLOR_BUFFER_BIT);
    //glUseProgram(0); // You may want this if using this code in an OpenGL 3+ context where shaders may be bound
    ImGui_ImplOpenGL2_RenderDrawData(ImGui::GetDrawData());

    // Update and Render additional Platform Windows
    // (Platform functions may change the current OpenGL context, so we save/restore it to make it easier to paste this code elsewhere.
    //  For this specific demo app we could also call SDL_GL_MakeCurrent(window, gl_context) directly)
    if (io.ConfigFlags & ImGuiConfigFlags_ViewportsEnable)
    {
        SDL_Window* backup_current_window = SDL_GL_GetCurrentWindow();
        SDL_GLContext backup_current_context = SDL_GL_GetCurrentContext();
        ImGui::UpdatePlatformWindows();
        ImGui::RenderPlatformWindowsDefault();
        SDL_GL_MakeCurrent(backup_current_window, backup_current_context);
    }

    SDL_GL_SwapWindow(window);


    return done?1:0;
}

void TextWithColors( const char* fmt, ... );

void RegistersView()
{
    ImGui::Begin("8088 Registers");
    TextWithColors("{666666}AX : {}%04X | {666666}BX : {}%04X | {666666}CX : {}%04X | {666666}DX : {}%04X",tb->m_konix->Processor->eu->AX,tb->m_konix->Processor->eu->BX,tb->m_konix->Processor->eu->CX,tb->m_konix->Processor->eu->DX);
    TextWithColors("{666666}BP : {}%04X | {666666}SP : {}%04X | {666666}DI : {}%04X | {666666}SI : {}%04X",tb->m_konix->Processor->eu->BP,tb->m_konix->Processor->eu->SP,tb->m_konix->Processor->eu->DI,tb->m_konix->Processor->eu->SI);
    TextWithColors("{666666}CS : {}%04X | {666666}DS : {}%04X | {666666}ES : {}%04X | {666666}SS : {}%04X",tb->m_konix->Processor->biu->REGISTER_CS,tb->m_konix->Processor->biu->REGISTER_DS,tb->m_konix->Processor->biu->REGISTER_ES,tb->m_konix->Processor->biu->REGISTER_SS);
    TextWithColors("{666666}FLAGS : %04X    O  D  I  T  S  Z  -  A  -  P  -  C", tb->m_konix->Processor->eu->FLAGS);
    ImGui::Text("                %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s  %s\n",
                        tb->m_konix->Processor->eu->FLAGS & 0x800 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x400 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x200 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x100 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x080 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x040 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x020 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x010 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x008 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x004 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x002 ? "1" : "0",
                        tb->m_konix->Processor->eu->FLAGS & 0x001 ? "1" : "0");
    ImGui::End();
}

#include "debugger/disasm.c"

#define NUM_ROWS 10
bool selected[NUM_ROWS] = {0};

void DisassmView()
{
    char buffer[1024];
    char buffer2[256];

    int address = tb->m_konix->Processor->eu->instructionAddress;

    ImGui::Begin("8088 Disassembly");

    if (ImGui::BeginTable("Disassembly", 5, ImGuiTableFlags_Resizable))// | ImGuiTableFlags_NoSavedSettings | ImGuiTableFlags_Borders))
    {
        for (int a=0;a<NUM_ROWS;a++)
        {
            ImGui::TableNextRow();
            char symbolAddress[64];
            InStream s;
            s.bytesRead=0;
            s.curAddress=address;
            s.findSymbol=NULL;
            s.useAddress=1;
            Disassemble(&s,0);

            ImGui::TableNextColumn();
            snprintf(symbolAddress,sizeof(symbolAddress),"%05X",address);

            auto iter = breakpoints.find(address);
            if (iter!=breakpoints.end())
            {
                selected[a]=true;
            }
            else
            {
                selected[a]=false;
            }

            if (ImGui::Selectable(symbolAddress, &selected[a], ImGuiSelectableFlags_SpanAllColumns))
            {
                if (iter!=breakpoints.end())
                {
                    breakpoints.erase(iter);
                }
                else
                {
                    breakpoints.insert(address);
                }
            }
            ImGui::TableNextColumn();
            if (symbolTable.find(address)!=symbolTable.end())
            {
                TextWithColors("{66ff66}%s{}",symbolTable[address].c_str());
            }
            ImGui::TableNextColumn();
            strcpy(buffer,"");
            for (int b=0;b<s.bytesRead;b++)
            {
                snprintf(buffer2,sizeof(buffer2),"%02X ", PeekByte(address+b));
                strcat(buffer,buffer2);
            }
            for (int b=s.bytesRead;b<9;b++)
            {
                strcat(buffer,"   ");
            }
            TextWithColors("%s",buffer);
            ImGui::TableNextColumn();
            TextWithColors("%s",GetOutputBuffer());

            address+=s.bytesRead;
        }

        ImGui::EndTable();
    }

    ImGui::End();
}

const char* FetchSymbolValue(unsigned int value,int width)
{
    static char tBuffer[1024];
    static char aBuffer[32];
    if (width==8)
        sprintf(aBuffer,"%08X",value);
    if (width==4)
        sprintf(aBuffer,"%04X",value&0xFFFF);
    if (width==2)
        sprintf(aBuffer,"%02X",value&0xFF);

    if (symbolTable.find(value)!=symbolTable.end())
    {
        sprintf(tBuffer,"{66ff66}%s{999999}(%s){}", symbolTable[value].c_str(), aBuffer);
    }
    else
    {
        sprintf(tBuffer,"{999999}%s{}", aBuffer);
    }

    return tBuffer;
}

unsigned char PeekByte(unsigned int address)
{
    address&=0xFFFFF;
    // address is linear
    if (address>=0x80000 && address<=0xBFFFF)
    {
        return tb->m_konix->DRAM->memory[address-0x80000];
    }
    if (address>=0xFFFF0)
    {
        return tb->m_konix->ROM->memory[address-0xFFFF0];
    }
    return 0xFF;
}

void StatusBar()
{
    unsigned int HCounter=0, VCounter=0;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_9;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_8;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_7;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_6;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_5;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_4;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_3;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_2;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_1;
    HCounter<<=1; HCounter|=tb->m_konix->SlipStream->VID_->HCNT_->HC_0;

    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_8;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_7;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_6;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_5;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_4;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_3;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_2;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_1;
    VCounter<<=1; VCounter|=tb->m_konix->SlipStream->VID_->VCNT_->VC_0;


    ImGui::Begin("Status");
    ImGui::Text("Ticks %20ld | HOLD %d | HLDA %d | E %03X | VCNT %03X | HCNT %03X", ticks, tb->m_konix->Processor->HOLD, tb->m_konix->Processor->HOLDA, tb->m_konix->Processor->eu->executionState, VCounter, HCounter);
    ImGui::End();
}

void ButtonBar()
{
    ImGui::Begin("Button Bar");
    bool hwStep = ImGui::Button("Tick");
    ImGui::SameLine();
    bool cpuStep = ImGui::Button("Step");
    ImGui::SameLine();
    bool cpuPause = ImGui::Button("Pause");
    ImGui::SameLine();
    bool cpuPlay = ImGui::Button("Run");
    ImGui::End();

    if (hwStep)
    {
        stopNextTick=1;
        tickPause=0;
    }
    if (cpuStep)
    {
        stopCpu=1;
        atLeastOneInstruction=0;
        tickPause=0;
    }
    if (cpuPause)
    {
        tickPause=1;
    }
    if (cpuPlay)
    {
        tickPause=0;
    }
}


//// https://pastebin.com/NeUk4QX0

const char ColorMarkerStart = '{';
const char ColorMarkerEnd = '}';
 
bool ProcessInlineHexColor( const char* start, const char* end, ImVec4& color )
{
    const int hexCount = ( int )( end - start );
    if( hexCount == 6 || hexCount == 8 )
    {
        char hex[9];
        strncpy( hex, start, hexCount );
        hex[hexCount] = 0;
 
        unsigned int hexColor = 0;
        if( sscanf( hex, "%x", &hexColor ) > 0 )
        {
            color.x = static_cast< float >( ( hexColor & 0x00FF0000 ) >> 16 ) / 255.0f;
            color.y = static_cast< float >( ( hexColor & 0x0000FF00 ) >> 8  ) / 255.0f;
            color.z = static_cast< float >( ( hexColor & 0x000000FF )       ) / 255.0f;
            color.w = 1.0f;
 
            if( hexCount == 8 )
            {
                color.w = static_cast< float >( ( hexColor & 0xFF000000 ) >> 24 ) / 255.0f;
            }
 
            return true;
        }
    }
 
    return false;
}
 
void TextWithColors( const char* fmt, ... )
{
    char tempStr[4096];
 
    va_list argPtr;
    va_start( argPtr, fmt );
    vsnprintf( tempStr, sizeof( tempStr ), fmt, argPtr );
    va_end( argPtr );
    tempStr[sizeof( tempStr ) - 1] = '\0';
 
    bool pushedColorStyle = false;
    const char* textStart = tempStr;
    const char* textCur = tempStr;
    while( textCur < ( tempStr + sizeof( tempStr ) ) && *textCur != '\0' )
    {
        if( *textCur == ColorMarkerStart )
        {
            // Print accumulated text
            if( textCur != textStart )
            {
                ImGui::TextUnformatted( textStart, textCur );
                ImGui::SameLine( 0.0f, 0.0f );
            }
 
            // Process color code
            const char* colorStart = textCur + 1;
            do
            {
                ++textCur;
            }
            while( *textCur != '\0' && *textCur != ColorMarkerEnd );
 
            // Change color
            if( pushedColorStyle )
            {
                ImGui::PopStyleColor();
                pushedColorStyle = false;
            }
 
            ImVec4 textColor;
            if( ProcessInlineHexColor( colorStart, textCur, textColor ) )
            {
                ImGui::PushStyleColor( ImGuiCol_Text, textColor );
                pushedColorStyle = true;
            }
 
            textStart = textCur + 1;
        }
        else if( *textCur == '\n' )
        {
            // Print accumulated text an go to next line
            ImGui::TextUnformatted( textStart, textCur );
            textStart = textCur + 1;
        }
 
        ++textCur;
    }
 
    if( textCur != textStart )
    {
        ImGui::TextUnformatted( textStart, textCur );
    }
    else
    {
        ImGui::NewLine();
    }
 
    if( pushedColorStyle )
    {
        ImGui::PopStyleColor();
    }
}