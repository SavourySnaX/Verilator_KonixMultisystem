#include <stdlib.h>
#include "VIODEC.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(VIODEC *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(VIODEC *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetA(VIODEC *tb, uint8_t value)
{
    tb->A_0=value&1;
    tb->A_1=(value>>1)&1;
    tb->A_2=(value>>2)&1;
    tb->A_3=(value>>3)&1;
    tb->A_4=(value>>4)&1;
    tb->A_5=(value>>5)&1;
    tb->A_6=(value>>6)&1;
    tb->A_7=(value>>7)&1;
}

int GetLPL(VIODEC *tb)
{
    uint8_t lpl=0;
    lpl|=tb->LPL_3<<3;
    lpl|=tb->LPL_2<<2;
    lpl|=tb->LPL_1<<1;
    lpl|=tb->LPL_0<<0;
    return lpl;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	VIODEC *tb = new VIODEC;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    tb->IOML=1;
	tb->VRD=0;
	tb->VWR=0;
    SetA(tb,0xFF);     // outside of register ranges

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);
    if (GetLPL(tb)!=0xF)
        printf("LPL should not be assert");

    tb->IOML=0; // Select io
    tb->VRD=1;  // read
    SetA(tb,0x00);
    ticks = doNTicks(tb,trace,ticks,1);
    if (GetLPL(tb)!=0xE)
        printf("LPL0 (HLPL) is not 0");
    SetA(tb,0x01);
    ticks = doNTicks(tb,trace,ticks,1);
    if (GetLPL(tb)!=0xD)
        printf("LPL1 (HLPH) is not 0");
    SetA(tb,0x02);
    ticks = doNTicks(tb,trace,ticks,1);
    if (GetLPL(tb)!=0xB)
        printf("LPL2 (VLPL) is not 0");
    SetA(tb,0x03);
    ticks = doNTicks(tb,trace,ticks,1);
    if (GetLPL(tb)!=0x7)
        printf("LPL3 (VLPH) is not 0");
    SetA(tb,0x04);
    ticks = doNTicks(tb,trace,ticks,1);
    if (GetLPL(tb)!=0xF)
        printf("LPL should not be asserted");
    if (tb->STATL!=0)
        printf("STATL should be asserted");
    SetA(tb,0x05);
    ticks = doNTicks(tb,trace,ticks,1);
    if (tb->STATL!=0)
        printf("STATL should be asserted");

    // Remaining possible io register decodes
    for (int a=0x06;a<=0xFF;a++)
    {
        SetA(tb,a);
        ticks = doNTicks(tb,trace,ticks,1);
    }

    // Do write pass
    tb->VWR=1;
    tb->VRD=0;
    for (int a=0x00;a<=0xFF;a++)
    {
        SetA(tb,a);
        ticks = doNTicks(tb,trace,ticks,1);
    }


	trace->close();

	exit(EXIT_SUCCESS);
}

