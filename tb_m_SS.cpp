#include <stdlib.h>
#include "Vm_SS.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#define TEST_VIDEO  0
#define AUDIO_OUT   1
#define VIDEO_OUT   1
#define TRACE_ON    1

#define FRAME_START 0
#define FRAME_STOP  4

int lastPCLK = 2;
bool gTrace=false;

int hold=0;
int tState=0;
int nextT1Write=0;
int writeState=0;
int writeIO=0;
uint32_t writeAddress=0;
uint8_t writeValue=0;

void SetXAD(Vm_SS *tb, uint8_t value);
void SetXA(Vm_SS *tb, uint8_t value);
void SetXD(Vm_SS *tb, uint8_t value);
void SetJOY(Vm_SS *tb, uint8_t value);
void SetXAS(Vm_SS *tb, uint8_t value);
void SetXAI(Vm_SS *tb, uint8_t value);
uint8_t GetXAD(Vm_SS *tb);
uint8_t GetXD(Vm_SS *tb);

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

int interruptAckNeeded=0;
int interruptAckCnt=0;

// Ideal cpu...
void TickRisingCpu(Vm_SS* tb)
{
    if ((hold == 1) || (tb->XRESET == 1))
        return;

    switch (tState)
    {
        case 0: // T1
            tb->XINTA=0;
            if (nextT1Write)
            {
                nextT1Write=0;
                writeState=1;
            }
            if (writeState)
            {
                tb->XIOM=writeIO;
                SetXAD(tb, writeAddress);
                SetXA(tb, writeAddress>>8);
                SetXAS(tb, writeAddress>>16);
            }
            else
            {
                // Simulate a nop or something
                tb->XIOM=0;
                uint32_t nopAddres=0x88888;
                SetXAD(tb, nopAddres);
                SetXA(tb, nopAddres>>8);
                SetXAS(tb, nopAddres>>16);
            }
            break;
        case 1: // T2
            if (interruptAckCnt>0)
            {
                interruptAckCnt--;
                tb->XINTA=1;
            }
            tb->XALE=0;
            if (writeState)
            {
                SetXAD(tb, writeValue);
                SetXAS(tb, 3);      // Data
                tb->XWRL=0;
            }
            else
            {
                SetXAD(tb, 0x90);
                SetXAS(tb, 2);      // CODE
            }
            break;
        case 2: // T3
            if (writeIO==0)
            {
                RAM[writeAddress]=writeValue;   // lazy mirror to RAM
            }
            break;
        case 3: // T4
            tb->XRDL=1;
            tb->XWRL=1;
            break;
    }
}

void TickFallingCpu(Vm_SS* tb)
{
    if (tb->XRESET == 1)
        return;
    if (hold && tb->XHOLD)
        return;

    switch (tState)
    {
        case 0: // T1
            tb->XALE=1;
            if (writeState)
            {
            }
            else
            {
            }
            break;
        case 1: // T2
            if (writeState)
            {
            }
            else
            {
                tb->XRDL=1;
            }
            break;
        case 2: // T3
            break;
        case 3: // T4
            hold=tb->XHOLD;
            break;
    }

    if (hold==0)
    {
        tState++;
        if (tState==4)
        {
            tState=0;
            writeState=0;
        }
    }
}

uint32_t FetchSlipstreamRamAddress(Vm_SS *tb)
{
    uint32_t address = 0;
    address<<=1; address|=(~tb->XCSL_0)&1;
    address<<=1; address|=(~tb->XCSL_1)&1;
    address<<=1; address|=tb->XA_17&1;
    address<<=1; address|=tb->XA_16&1;
    address<<=1; address|=tb->outXA_15&1;
    address<<=1; address|=tb->outXA_14&1;
    address<<=1; address|=tb->outXA_13&1;
    address<<=1; address|=tb->outXA_12&1;
    address<<=1; address|=tb->outXA_11&1;
    address<<=1; address|=tb->outXA_10&1;
    address<<=1; address|=tb->outXA_9&1;
    address<<=1; address|=tb->outXA_8&1;
    address<<=1; address|=tb->XA_7&1;
    address<<=1; address|=tb->XA_6&1;
    address<<=1; address|=tb->XA_5&1;
    address<<=1; address|=tb->XA_4&1;
    address<<=1; address|=tb->XA_3&1;
    address<<=1; address|=tb->XA_2&1;
    address<<=1; address|=tb->XA_1&1;
    address<<=1; address|=tb->XA_0&1;

    if ((tb->enXA_8!=1)||(tb->enXA_9!=1)||(tb->enXA_10!=1)||(tb->enXA_11!=1)||(tb->enXA_12!=1)||(tb->enXA_13!=1)||(tb->enXA_14!=1)||(tb->enXA_15!=1))
    {
        printf("BUS ERROR - attempting to use output address in non driven state\n");
        exit(1);
    }

    return address;
}

int lastInt=2;
int lastXOEL=2;
uint32_t latchedAddressRead;

void BusProcessorEmulation(Vm_SS *tb)
{
    if (tb->XPCLK==1 && lastPCLK==0)
    {
        // Rising Cycle
        TickRisingCpu(tb);
    }
    if (tb->XPCLK==0 && lastPCLK==1)
    {
        // Falling Cycle
        TickFallingCpu(tb);
    }
    lastPCLK=tb->XPCLK;
    tb->XHLDA=hold;

    if ((lastXOEL==1) && (tb->XOEL==0))
    {
        latchedAddressRead = FetchSlipstreamRamAddress(tb);
        //printf("latchedAddress : %08X\n",latchedAddressRead);
    }
    lastXOEL=tb->XOEL; 

    // If processor is held, and output enable
    if ((tb->XHLDA) && (tb->XOEL==0))
    {
        uint32_t ramAddress=latchedAddressRead;//FetchRamAddress(tb);
        if (gTrace)
        {
 //           printf("RAM FETCH : %08X\n",ramAddress);
        }
        if (ramAddress>1024*1024)
        {
            printf("RAM FETCH ERROR, out of range : %08X\n",ramAddress);
            exit(1);
        }

        if ((tb->XSCEL_0==1) && (tb->XSCEL_1==1))
        {
            // Regular slipstream fetch (DRAM was 4bit, so presumably this only ever fetched a byte?)
            //printf("Slipstream General Reading from : %08X with %02X, %02X\n", ramAddress, RAM[ramAddress+0], RAM[ramAddress+1]);
            SetXAD(tb,RAM[ramAddress+0]);
            SetXD(tb, RAM[ramAddress+1]);
        }
        else
        {
            // Only 128K video ram available
            if (tb->XSCEL_0!=tb->XSCEL_1)
            {
                printf("Unexpected Screen Chip Selection state\n");
                exit(1);
            }
            if ((ramAddress&1) == 1)
            {
                printf("WARNING - ODD ACCESS TO WORD RAM...\n");
            }
            ramAddress &= 0x3FFFF;  // always word fetch ? - todo validate
            SetXAD(tb,RAM[ramAddress+0]);
            SetXD(tb, RAM[ramAddress+1]);
        }
    }
    if ((tb->XHLDA) && (tb->XWEL==0))
    {
        uint32_t ramAddress=FetchSlipstreamRamAddress(tb);
        if (gTrace)
        {
            //printf("RAM WRITE : %08X <-    %02X   %02X\n",ramAddress, GetXAD(tb), GetXD(tb));
        }
        if (ramAddress>1024*1024)
        {
            printf("RAM WRITE ERROR, out of range : %08X\n",ramAddress);
            exit(1);
        }
        if ((tb->XSCEL_0==1) && (tb->XSCEL_1==1))
        {
            // Regular slipstream write (DRAM was 4bit, so presumably this only ever wrote a byte?)
            //printf("Slipstream General Write to : %08X with %02X\n", ramAddress, GetXAD(tb));
            RAM[ramAddress]=GetXAD(tb);
        }
        else
        {
            // Only 128K video ram available
            if (tb->XSCEL_0!=tb->XSCEL_1)
            {
                printf("Unexpected Screen Chip Selection state\n");
                exit(1);
            }
            if ((ramAddress&1) == 1)
            {
                printf("WARNING - ODD ACCESS TO WORD RAM...\n");
            }
            ramAddress &= 0x3FFFF;  // always word fetch ? - todo validate
            RAM[ramAddress+0]=GetXAD(tb);
            RAM[ramAddress+1]=GetXD(tb);
        }
    }
    

    if ((lastInt==0) && (tb->XINTR==1) && (tb->XRESET==0)) // Supposed to be level triggerred... 
    {
        interruptAckNeeded=1;
        interruptAckCnt=2;
    }
    lastInt=tb->XINTR;


    //tb->XINTA = tb->XINTR;
    //if ((tb->XINTR==0))
    //{
        //interruptAckNeeded=1;
    //}
}


void tick(Vm_SS *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XXTAL=1;
#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10-2);
    }
#endif
    BusProcessorEmulation(tb);
    tb->eval();
#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10);
    }
#endif
    tb->XXTAL=0;
    BusProcessorEmulation(tb);
    tb->eval();

#if TRACE_ON
    if (gTrace)
    {
        trace->dump(ticks*10+5);
        trace->flush();
    }
#endif
}

int doNTicks(Vm_SS *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetXAD(Vm_SS *tb, uint8_t value)
{
    tb->inXAD_0 = (value>>0)&1;
    tb->inXAD_1 = (value>>1)&1;
    tb->inXAD_2 = (value>>2)&1;
    tb->inXAD_3 = (value>>3)&1;
    tb->inXAD_4 = (value>>4)&1;
    tb->inXAD_5 = (value>>5)&1;
    tb->inXAD_6 = (value>>6)&1;
    tb->inXAD_7 = (value>>7)&1;
}

uint8_t GetXAD(Vm_SS *tb)
{
    uint8_t value = 0;
    value <<=1; value |= tb->outXAD_7&1;
    value <<=1; value |= tb->outXAD_6&1;
    value <<=1; value |= tb->outXAD_5&1;
    value <<=1; value |= tb->outXAD_4&1;
    value <<=1; value |= tb->outXAD_3&1;
    value <<=1; value |= tb->outXAD_2&1;
    value <<=1; value |= tb->outXAD_1&1;
    value <<=1; value |= tb->outXAD_0&1;

    if ((tb->enXAD_0!=1)||(tb->enXAD_1!=1)||(tb->enXAD_2!=1)||(tb->enXAD_3!=1)||(tb->enXAD_4!=1)||(tb->enXAD_5!=1)||(tb->enXAD_6!=1)||(tb->enXAD_7!=1))
    {
        printf("BUS ERROR - attempting to use output address in non driven state\n");
        exit(1);
    }

    return value;
}

uint8_t GetXD(Vm_SS *tb)
{
    uint8_t value = 0;
    value <<=1; value |= tb->outXD_15&1;
    value <<=1; value |= tb->outXD_14&1;
    value <<=1; value |= tb->outXD_13&1;
    value <<=1; value |= tb->outXD_12&1;
    value <<=1; value |= tb->outXD_11&1;
    value <<=1; value |= tb->outXD_10&1;
    value <<=1; value |= tb->outXD_9&1;
    value <<=1; value |= tb->outXD_8&1;
    
    if ((tb->enXD_8!=1)||(tb->enXD_9!=1)||(tb->enXD_10!=1)||(tb->enXD_11!=1)||(tb->enXD_12!=1)||(tb->enXD_13!=1)||(tb->enXD_14!=1)||(tb->enXD_15!=1))
    {
        printf("BUS ERROR - attempting to use output address in non driven state\n");
        exit(1);
    }

    return value;
}


void SetXA(Vm_SS *tb, uint8_t value)
{
    tb->inXA_8 = (value>>0)&1;
    tb->inXA_9 = (value>>1)&1;
    tb->inXA_10 = (value>>2)&1;
    tb->inXA_11 = (value>>3)&1;
    tb->inXA_12 = (value>>4)&1;
    tb->inXA_13 = (value>>5)&1;
    tb->inXA_14 = (value>>6)&1;
    tb->inXA_15 = (value>>7)&1;
}


void SetXD(Vm_SS *tb, uint8_t value)
{
    tb->inXD_8 = (value>>0)&1;
    tb->inXD_9 = (value>>1)&1;
    tb->inXD_10 = (value>>2)&1;
    tb->inXD_11 = (value>>3)&1;
    tb->inXD_12 = (value>>4)&1;
    tb->inXD_13 = (value>>5)&1;
    tb->inXD_14 = (value>>6)&1;
    tb->inXD_15 = (value>>7)&1;
}

void SetJOY(Vm_SS *tb, uint8_t value)
{
    tb->inXJOYL_0 = (value>>0)&1;
    tb->inXJOYL_1 = (value>>1)&1;
    tb->inXJOYL_2 = (value>>2)&1;
}

void SetXAS(Vm_SS *tb, uint8_t value)
{
    tb->XAS_16 = (value>>0)&1;
    tb->XAS_17 = (value>>1)&1;
    tb->XAS_18 = (value>>2)&1;
    tb->XAS_19 = (value>>3)&1;
}

void SetXAI(Vm_SS *tb, uint8_t value)
{
    tb->XAI_0 = (value>>0)&1;
    tb->XAI_1 = (value>>1)&1;
    tb->XAI_2 = (value>>2)&1;
}

uint8_t PAL[256*2];

void LoadPAL()
{
    FILE* myDump=fopen("/home/snax/Work/Slipstream/build/PALRAM.BIN","rb");
    for(int a=0;a<256*2;a++)
    {
        uint8_t byte;
        fread(&byte,1,1,myDump);
        PAL[a]=byte;
    }
    fclose(myDump);
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
int ProcessVideo(Vm_SS *tb)
{
#if VIDEO_OUT
    if ( ((lastChroma==1) && (tb->XCHROMA==0)) || ((lastChroma==0) && (tb->XCHROMA==1)) )
    {
        // can now look at other signals

        if (waitingForFrameStart)
        {
            if ((videoLastVSync==0) && (tb->outXVSYNCL==1))
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
            if ((videoLastVSync==1) && (tb->outXVSYNCL==0))
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
                if ((videoLastHSync==0) && (tb->outXHSYNCL==1))
                {
                    HCnt=0;
                    lineNum++;
                }

                if (lineNum>0 && HCnt<562)
                {
                    // output pixel
                    int red = (tb->XR_3<<3)|(tb->XR_2<<2)|(tb->XR_1<<1)|(tb->XR_0);
                    int green = (tb->XG_3<<3)|(tb->XG_2<<2)|(tb->XG_1<<1)|(tb->XG_0);
                    int blue = (tb->XB_3<<3)|(tb->XB_2<<2)|(tb->XB_1<<1)|(tb->XB_0);
                    
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

        videoLastVSync=tb->outXVSYNCL;
        videoLastHSync=tb->outXHSYNCL;

        HCnt++;
    }
    lastChroma=tb->XCHROMA;
#endif
    return 0;
}

int lastDCLK=2;

void ProcessAudio(Vm_SS *tb)
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

const char* DSP_TranslateInstruction(uint16_t addr,uint16_t pWord)
{
    static char staticBuffer[65536];
	uint16_t pAddr=(pWord&0x1FF);		// bottom 9 bits 
	uint16_t pOpcode=(pWord&0xF800)>>11;		// top 5 bits?
	uint8_t isConditional=(pWord&0x0400)>>10;
	uint8_t isIndexed=(pWord&0x0200)>>9;

	// Quick test

	switch (pOpcode)
	{
		case 0:
			sprintf(staticBuffer, "%s MOV (%04X%s),MZ0\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 1:
			sprintf(staticBuffer, "%s MOV (%04X%s),MZ1\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 2:
			sprintf(staticBuffer, "%s MOV MZ0,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 3:
			sprintf(staticBuffer, "%s MOV MZ1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 4:
			sprintf(staticBuffer, "%s CCF\n",isConditional?"IF C THEN":"");
			break;
		case 5:
			sprintf(staticBuffer, "%s MOV DMA0,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 6:
			sprintf(staticBuffer, "%s MOV DMA1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 7:
			sprintf(staticBuffer, "%s MOV DMD,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 8:
			sprintf(staticBuffer, "%s MOV (%04X%s),DMD\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 9:
			sprintf(staticBuffer, "%s MAC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 10:
			sprintf(staticBuffer, "%s MOV MODE,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 11:
			sprintf(staticBuffer, "%s MOV IX,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 12:
			sprintf(staticBuffer, "%s MOV (%04X%s),PC\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 13:
			sprintf(staticBuffer, "%s MOV X,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 14:
			sprintf(staticBuffer, "%s MOV (%04X%s),X\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 15:
			sprintf(staticBuffer, "%s MULT (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 16:
			sprintf(staticBuffer, "%s ADD (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 17:
			sprintf(staticBuffer, "%s SUB (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 18:
			sprintf(staticBuffer, "%s AND (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 19:
			sprintf(staticBuffer, "%s OR (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 20:
			sprintf(staticBuffer, "%s ADC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 21:
			sprintf(staticBuffer, "%s SBC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 22:
			sprintf(staticBuffer, "%s MOV (%04X%s),AZ\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 23:
			sprintf(staticBuffer, "%s MOV AZ,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 24:
			sprintf(staticBuffer, "%s MOV (%04X%s),Z2\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 25:
			sprintf(staticBuffer, "%s MOV DAC1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 26:
			sprintf(staticBuffer, "%s MOV DAC2,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 27:
			sprintf(staticBuffer, "%s MOV DAC12,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 28:
			sprintf(staticBuffer, "%s GAI (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 29:
			sprintf(staticBuffer, "%s MOV PC,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 30:
			sprintf(staticBuffer, "%s NOP\n",isConditional?"IF C THEN":"");
			break;
		case 31:
			sprintf(staticBuffer, "%s INTRUDE\n",isConditional?"IF C THEN":"");
			break;
	}

    return staticBuffer;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_SS *tb = new Vm_SS;

	VerilatedVcdC *trace = new VerilatedVcdC;

#if TRACE_ON
	tb->trace(trace, 99);
	trace->open("trace.vcd");
#endif

    SetXAD(tb,0);
    SetXA(tb,0);
    SetXD(tb,0);
    tb->inXVSYNCL=1;
    tb->inXHSYNCL=1;
    SetJOY(tb,0x3);         // SLOW, PSRAM, PAL
    tb->inXDSP_IO=0;
    SetXAS(tb,0);       // Look up processor status's
    tb->XRESET=1;
    tb->XIOM=0;
    tb->XALE=0;
    tb->XINTA=0;
    tb->XHLDA=0;
    SetXAI(tb,0xFF);
    tb->XLPL=1;
    tb->XTESTPIN=0;
    tb->XRDL=1;
    tb->XWRL=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->XRESET=0;
    ticks = doNTicks(tb,trace,ticks,10);

    remove("leftl.raw");
    remove("lefth.raw");
    remove("rightl.raw");
    remove("righth.raw");

#if TEST_VIDEO
    LoadRAM();
    LoadPAL();

    int registerWrites[13*2] = {
        0x0D, 0xEB,    // BORDERL  // D3B     reD grEen Blue
        0x0E, 0x0D,    // BORDERH
        0x02, 60,      // STARTL
        0x03, 0,       // STARTH
        0x11, 0x03,    // ENDL
        0x12, 0x01,    // ENDH
        0x13, 0x01,    // MEM
        0x0C, 0x01,    // MODE
        0x0F, 0x00,    // CMASK
        0x10, 0x00,    // PINDEX
        0x08, 0x00,    // SCROLLL
        0x09, 0x01,    // SCROLLM
        0x0A, 0x00,    // SCROLLH
    };
    int writeCounter =0;
    int paletteWriteCounter=0;

#else

    FILE* hw = fopen("/home/snax/LINES.DAT","r"); 

    int frameNum = -1;
    int address=0;
    int data=0;
    char dest='R';

    // fill initial ram from loading
    while (frameNum==-1)
    {
        fscanf(hw, "%08X%c%08X%02X\n", &frameNum, &dest, &address, &data);
        if (frameNum==0)
            break;
        if (dest=='P')
        {
            printf("ERRR\n");
        }
        RAM[address]=data;
    }

#endif

    if (FRAME_START == 0)
        gTrace=true;

    int lastFrameNum = frameNum;
    while (1)//ticks < 6*757*312)
    {
        if (ProcessVideo(tb)==1)
         break;
        ProcessAudio(tb);

        if (writeState==0 && nextT1Write == 0)
        {
#if TEST_VIDEO
        if (writeCounter<13)
        {
            if (writeState==0 && nextT1Write==0)
            {
                writeAddress = registerWrites[writeCounter*2 + 0];
                writeValue = registerWrites[writeCounter*2 + 1];
                nextT1Write=1;
                writeIO=1;
                writeCounter++;
                printf("Writing Register %d @%d  (%08X, %02X)\n",writeCounter, ticks,writeAddress, writeValue);
            }
        }
        else
        {
            if (paletteWriteCounter<512)
            {
                if (writeState==0 && nextT1Write==0)
                {
                    writeAddress = 0x40000 + paletteWriteCounter;
                    writeValue = PAL[paletteWriteCounter];
                    nextT1Write=1;
                    writeIO=0;
                    paletteWriteCounter++;
                    printf("Writing Palette %d @%d  (%08X, %02X)\n",paletteWriteCounter, ticks,writeAddress, writeValue);
                }
            }
        }
#else
            if (interruptAckNeeded)
            {
                if (interruptAckCnt == 0)
                {
                    writeAddress = 0x0B;
                    writeValue = 00; // doesn't matter its just an ACK
                    writeIO = 1;
                    nextT1Write = 1;
                    interruptAckNeeded = 0;
                }
            }
            else if (frameNum <= virtFrameNum)
            {
                // do it if possible
                writeAddress = address;
                writeValue=data;
                if (dest == 'R')
                    writeIO=0;
                else
                    writeIO=1;
//                if ((writeAddress<0x41000) || (writeAddress>0x42000))  // SKIP DSP 
                    nextT1Write=1;
            
                fscanf(hw, "%08X%c%08X%02X\n", &frameNum, &dest, &address, &data);
                if (lastFrameNum!=frameNum)
                {
                    printf("Now at data frame : %d\n",frameNum);
                    lastFrameNum=frameNum;
                }
            }
#endif
        }

        ticks = doNTicks(tb,trace,ticks, 1);
    }

#if TRACE_ON
	trace->close();
#endif

    printf("PRAM\n");
    for (int a=0;a<256;a++)
    {
        printf("%08X : %04X : %s\n", a, tb->m_SS__DOT__PROGRAM___DOT__mem[a], DSP_TranslateInstruction(a, tb->m_SS__DOT__PROGRAM___DOT__mem[a]));
    }

	exit(EXIT_SUCCESS);
}
