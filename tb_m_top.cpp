#include <stdlib.h>
#include "Vm_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#define TEST_VIDEO  0
#define AUDIO_OUT   0
#define VIDEO_OUT   1
#define TRACE_ON    0

#define FRAME_START 0
#define FRAME_STOP  10

int lastPCLK = 2;
bool gTrace=false;

int hold=0;
int tState=0;
int nextT1Write=0;
int writeState=0;
int writeIO=0;
uint32_t writeAddress=0;
uint8_t writeValue=0;

void SetXAD(Vm_top *tb, uint8_t value);
void SetXA(Vm_top *tb, uint8_t value);
void SetXD(Vm_top *tb, uint8_t value);
void SetJOY(Vm_top *tb, uint8_t value);
void SetXAS(Vm_top *tb, uint8_t value);
void SetXAI(Vm_top *tb, uint8_t value);
uint8_t GetXAD(Vm_top *tb);
uint8_t GetXD(Vm_top *tb);

uint8_t RAM[1024*1024];

void LoadRAM()
{
    FILE* myDump=fopen("/home/snax/Work/Slipstream/build/VRAM.BIN","rb");
    for(int a=0;a<256*1024;a++)
    {
        uint8_t byte;
        fread(&byte,1,1,myDump);
        RAM[a]=byte;
    }
    fclose(myDump);
}

void tick(Vm_top *tb, VerilatedVcdC* trace, int ticks)
{
    tb->FCLK=1;
#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10-2);
    }
#endif
    tb->eval();
#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10);
    }
#endif
    tb->FCLK=0;
    tb->eval();

#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10+5);
        trace->flush();
    }
#endif
}

int doNTicks(Vm_top *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

int videoLastVSync=2;
int videoLastHSync=2;
int lastChroma=2;

int waitingForFrameStart=1;

int VCnt=0;

int HCnt=0;
int lineNum=0;

int virtFrameNum=0;
char filename[128];
int ProcessVideo(Vm_top *tb)
{
#if VIDEO_OUT
    if ( ((lastChroma==1) && (tb->Chroma==0)) || ((lastChroma==0) && (tb->Chroma==1)) )
    {
        // can now look at other signals

        if (waitingForFrameStart)
        {
            if ((videoLastVSync==0) && (tb->VSyncL==1))
            {
                VCnt++;
                if (VCnt==4)
                {
                    waitingForFrameStart=0;
                    virtFrameNum++;
                    printf("Found Frame Start %d\n", virtFrameNum);
                    if (virtFrameNum==FRAME_START)
                        gTrace=true;

                    if (virtFrameNum==FRAME_STOP)
                        return 1;
                    sprintf(filename, "pics/PIXELS%03d.data", virtFrameNum);
                    remove(filename);
                }
            }
        }
        else
        {
            if ((videoLastVSync==1) && (tb->VSyncL==0))
            {
                printf("Resetting for new frame\n");
                waitingForFrameStart=1;
                VCnt=0;
                HCnt=0;
                lineNum=0;
            }
            else
            {
                // we will miss the first line with this logic, ho hum
                if ((videoLastHSync==0) && (tb->HSyncL==1))
                {
                    HCnt=0;
                    lineNum++;
                }

                if (lineNum>0 && HCnt<562)
                {
                    // output pixel
                    int red = tb->Red;
                    int green = tb->Green;
                    int blue = tb->Blue;
                    
                    //printf("PIXEL @ %d,%d: %d:%d:%d\n", HCnt, lineNum, red<<4, green<<4, blue<<4);

                    FILE* hack = fopen(filename,"ab"); 

                    uint8_t r,g,b;
                    r=red<<4;
                    g=green<<4;
                    b=blue<<4;

                    fwrite(&r,1,1,hack);
                    fwrite(&g,1,1,hack);
                    fwrite(&b,1,1,hack);

                    fclose(hack);
                }
            }
        }

        videoLastVSync=tb->VSyncL;
        videoLastHSync=tb->HSyncL;

        HCnt++;
    }
    lastChroma=tb->Chroma;
#endif
    return 0;
}

int lastDCLK=2;

void ProcessAudio(Vm_top *tb)
{
#if AUDIO_OUT
    if ( ((lastDCLK==1) && (tb->DQCLK==0)) || ((lastDCLK==0) && (tb->DQCLK==1)) )
    {
        FILE* hack = fopen("leftl.raw","ab"); 
        int16_t v = tb->LEFTDAC;
        v>>=2;
        fwrite(&v,2,1,hack);
        fclose(hack);
        hack = fopen("rightl.raw","ab"); 
        v = tb->RIGHTDAC;
        v>>=2;
        fwrite(&v,2,1,hack);
        fclose(hack);
    }
    lastDCLK=tb->DQCLK;
#endif
}


void LoadP88(const char* path)
{
    FILE *p88 = fopen(path, "rb");
    fseek(p88,0,SEEK_END);
    long size = ftell(p88);
    fseek(p88,0,SEEK_SET);

    while (size)
    {
        unsigned char t;
        if (1!=fread(&t, 1,1, p88))
        {
            printf("FAILED TO READ SECTION\n");
            exit(1);
        }
        size--;

        switch (t)
        {
            case 0xFF:
                break;
            case 0xC8:
                // Load
                break;
            case 0xCA:
                // Exec
                break;
        }
    }
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_top *tb = new Vm_top;

	VerilatedVcdC *trace = new VerilatedVcdC;

#if TRACE_ON
	tb->trace(trace, 99);
	trace->open("trace.vcd");
#endif

    tb->RESET=1;
    tb->inRamData=0x9090;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESET=0;

    if (FRAME_START == 0)
        gTrace=true;
    const unsigned char ROM[8] = {0xb8, 0x00, 0x00, 0xE7, 0x0D, 0x40, 0xEB, 0xFB};
    while (1)//ticks < 3*757*312)
    {
        if (ProcessVideo(tb)==1)
         break;

        ticks = doNTicks(tb,trace,ticks, 1);

        tb->inRamData = ROM[tb->ABus&0x7];
    }

#if TRACE_ON
	trace->close();
#endif

	exit(EXIT_SUCCESS);
}

