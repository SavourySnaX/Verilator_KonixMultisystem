#include <stdlib.h>
#include "Vm_konix.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#define VIDEO_OUT   1
#define TRACE_ON    1

#define FRAME_START 0
#define FRAME_STOP  2

int xtalCnt=0;
int xtal=0;

void tick(Vm_konix *tb, VerilatedVcdC* trace, int ticks)
{
    tb->clk_sys=1;
#if TRACE_ON
    trace->dump(ticks*10-2);
#endif
    tb->eval();
#if TRACE_ON
    trace->dump(ticks*10);
#endif
    tb->clk_sys=0;
    tb->eval();
#if TRACE_ON
    trace->dump(ticks*10+5);
    trace->flush();
#endif
    xtalCnt++;
    if (xtalCnt>5)
    {
        tb->XTAL = (~tb->XTAL)&1;
        xtalCnt=0;
    }
}

int doNTicks(Vm_konix *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

#define NEW_VIDEO 0

#if NEW_VIDEO

int lastVidClk=2;

int syncSeen=0;

uint8_t frameBuffer[]

int ProcessVideo(Vm_konix *tb)
{
#if VIDEO_OUT

    if (lastVidClk==1) && (tb->clk_sys==0)
    {
        if (tb->CE_PIXEL==1)
        {
            if (syncSeen)
            {
                if (tb->VGA)
            }
        }
        if (syncSeen==0)
        {
            //
        }
    }
    lastVidClk=tb->clk_sys;
#endif
}

#else

int videoLastVSync=2;
int videoLastHSync=2;
int lastChroma=2;

int waitingForFrameStart=1;

int HCnt=0;
int lineNum=0;

int virtFrameNum=0;
char filename[128];

int ProcessVideo(Vm_konix *tb)
{
#if VIDEO_OUT
    if ( ((lastChroma==1) && (tb->CE_PIXEL==0)) || ((lastChroma==0) && (tb->CE_PIXEL==1)) )
    {
        // can now look at other signals

        if (waitingForFrameStart)
        {
            if ((videoLastVSync==1) && (tb->VGA_VS==0))
            {
                waitingForFrameStart=0;
                virtFrameNum++;
                printf("Found Frame Start %d\n", virtFrameNum);
                if (virtFrameNum==FRAME_STOP)
                    return 1;
                sprintf(filename, "pics/PIXELS%03d.data", virtFrameNum);
                remove(filename);
            }
        }
        else
        {
            if ((videoLastVSync==0) && (tb->VGA_VS==1))
            {
                printf("Resetting for new frame\n");
                waitingForFrameStart=1;
                HCnt=0;
                lineNum=0;
            }
            else
            {
                // we will miss the first line with this logic, ho hum
                if ((videoLastHSync==1) && (tb->VGA_HS==0))
                {
                    HCnt=0;
                    lineNum++;
                }

                if (lineNum>0 && HCnt<562)
                {
                    // output pixel
                    int red = tb->VGA_R;
                    int green = tb->VGA_G;
                    int blue = tb->VGA_B;
                    
                    //printf("PIXEL @ %d,%d: %d:%d:%d\n", HCnt, lineNum, red<<4, green<<4, blue<<4);

                    FILE* hack = fopen(filename,"ab"); 

                    uint8_t r,g,b;
                    r=red;
                    g=green;
                    b=blue;

                    fwrite(&r,1,1,hack);
                    fwrite(&g,1,1,hack);
                    fwrite(&b,1,1,hack);

                    fclose(hack);
                }
            }
        }

        videoLastVSync=tb->VGA_VS;
        videoLastHSync=tb->VGA_HS;

        HCnt++;
    }
    lastChroma=tb->CE_PIXEL;
#endif
    return 0;
}
#endif


int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_konix *tb = new Vm_konix;

	VerilatedVcdC *trace = new VerilatedVcdC;

#if TRACE_ON
	tb->trace(trace, 99);
	trace->open(TRACE_FILE);
#endif

    tb->XTAL=0;
    tb->reset=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,1000);

    tb->reset=0;

    while (true)
    {
        if (ProcessVideo(tb))
            break;
        ticks = doNTicks(tb, trace, ticks, 1);
    }
#if TRACE_ON
	trace->close();
#endif

	exit(EXIT_SUCCESS);
}





