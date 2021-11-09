#include <stdlib.h>
#include "Vm_top.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#define TEST_VIDEO  0
#define AUDIO_OUT   0
#define VIDEO_OUT   1
#define TRACE_ON    0

#define FRAME_START 0
#define FRAME_STOP  5

int lastPCLK = 2;
bool gTrace=false;

#define SRAM_INSTALLED    (128*1024)
#define DRAM_INSTALLED    (256*1024)
#define ROM_INSTALLED     (256*1024)

int hold=0;
int tState=0;
int nextT1Write=0;
int writeState=0;
int writeIO=0;
uint32_t writeAddress=0;
uint8_t writeValue=0;

uint8_t SRAM[SRAM_INSTALLED];
uint8_t DRAM[DRAM_INSTALLED];
uint8_t ROM[ROM_INSTALLED];

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

#define SEGTOPHYS(seg,off)	( ((seg)<<4) + (off) )				// Convert Segment,offset pair to physical address
int HandleLoadSection(FILE* inFile)
{
	uint16_t	segment,offset;
	uint16_t	size;
	int		a=0;
	uint8_t		byte;

	if (2!=fread(&segment,1,2,inFile))
	{
		printf("Failed to read segment for LoadSection\n");
		exit(1);
	}
	if (2!=fread(&offset,1,2,inFile))
	{
		printf("Failed to read offset for LoadSection\n");
		exit(1);
	}
	fseek(inFile,2,SEEK_CUR);		// skip unknown
	if (2!=fread(&size,1,2,inFile))
	{
		printf("Failed to read size for LoadSection\n");
		exit(1);
	}

	printf("Found Section Load Memory : %04X:%04X   (%08X bytes)\n",segment,offset,size);

	for (a=0;a<size;a++)
	{
		if (1!=fread(&byte,1,1,inFile))
		{
			printf("Failed to read data from LoadSection\n");
			exit(1);
		}
        DRAM[(a+SEGTOPHYS(segment,offset))&(DRAM_INSTALLED-1)] = byte;
	}

	return 8+size;
}

int HandleExecuteSection(FILE* inFile)
{
	uint16_t	segment,offset;
	
	if (2!=fread(&segment,1,2,inFile))
	{
		printf("Failed to read segment for ExecuteSection\n");
		exit(1);
	}
	if (2!=fread(&offset,1,2,inFile))
	{
		printf("Failed to read offset for ExecuteSection\n");
		exit(1);
	}

    // Create FAR Call in RESET address
    ROM[0xFFFF0&(ROM_INSTALLED-1)]=0xEA;
    ROM[0xFFFF1&(ROM_INSTALLED-1)]=0x00;
    ROM[0xFFFF2&(ROM_INSTALLED-1)]=offset>>8;
    ROM[0xFFFF3&(ROM_INSTALLED-1)]=offset;
    ROM[0xFFFF4&(ROM_INSTALLED-1)]=segment>>8;
    ROM[0xFFFF5&(ROM_INSTALLED-1)]=segment;

	printf("Found Section Execute : %04X:%04X\n",segment,offset);

	return 4;
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
                size-=HandleLoadSection(p88);
                break;
            case 0xCA:
                size-=HandleExecuteSection(p88);
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

    LoadP88("/home/snax/ROMS/KONIX_LINE_TEST.P88");
    //LoadP88("/home/snax/ROMS/KONIX_TEST_RAM.P88");
    //LoadP88("/home/snax/Work/AOTMC89/aomc.p88");

#if TRACE_ON
	tb->trace(trace, 99);
	trace->open(TRACE_FILE);
#endif

    tb->RESET=1;
    tb->inRamData=0x9090;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESET=0;

    if (FRAME_START == 0)
        gTrace=true;
    while (1)//ticks < 757*312)
    {
        if (ProcessVideo(tb)==1)
         break;

        ticks = doNTicks(tb,trace,ticks, 1);

        if (tb->Write)
        {
            uint32_t screenAddress = tb->ABus&(SRAM_INSTALLED-1);
            if (tb->ABus<SRAM_INSTALLED)  // Screen Chips are Word accessed
            {
                SRAM[screenAddress]=tb->outRamData;
                if (tb->Word)
                    SRAM[screenAddress+1]=tb->outRamData>>8;
            }
            else if (tb->ABus>=0x80000 && tb->ABus<0x80000 + DRAM_INSTALLED)
            {
                DRAM[tb->ABus&(DRAM_INSTALLED-1)]=tb->outRamData;
            }
        }

        if (tb->Read)
        {
            uint32_t screenAddress = (tb->ABus&(SRAM_INSTALLED-1)&(~1));
            if (tb->ABus<SRAM_INSTALLED)  // Screen Chips are Word accessed
            {
                uint16_t fromRam = SRAM[screenAddress+1];
                fromRam<<=8;
                fromRam|=SRAM[screenAddress];
                tb->inRamData = fromRam;
            }
            else if (tb->ABus>=0x80000 && tb->ABus<0x80000 + DRAM_INSTALLED)
            {
                uint16_t fromRam = SRAM[screenAddress+1];
                fromRam<<=8;
                fromRam|=DRAM[tb->ABus&(DRAM_INSTALLED-1)];
                tb->inRamData = fromRam;
            }
            else if (tb->ABus>=0xC0000)
            {
                uint16_t fromRam = SRAM[screenAddress+1];
                fromRam<<=8;
                fromRam|=ROM[tb->ABus&(ROM_INSTALLED-1)];
                tb->inRamData = fromRam;
            }
        }
    }

#if TRACE_ON
	trace->close();
#endif

	exit(EXIT_SUCCESS);
}

