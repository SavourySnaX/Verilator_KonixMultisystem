#include <stdlib.h>
#include "Vm_DMA.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_DMA *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CLK=1;
    tb->DQCLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CLK=0;
    tb->eval();
    trace->dump(ticks*10+2);
    tb->DQCLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_DMA *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetD(Vm_DMA *tb, uint16_t value)
{
    tb->inD_0 = (value>>0)&1;
    tb->inD_1 = (value>>1)&1;
    tb->inD_2 = (value>>2)&1;
    tb->inD_3 = (value>>3)&1;
    tb->inD_4 = (value>>4)&1;
    tb->inD_5 = (value>>5)&1;
    tb->inD_6 = (value>>6)&1;
    tb->inD_7 = (value>>7)&1;
    tb->inD_8 = (value>>8)&1;
    tb->inD_9 = (value>>9)&1;
    tb->inD_10 = (value>>10)&1;
    tb->inD_11 = (value>>11)&1;
    tb->inD_12 = (value>>12)&1;
    tb->inD_13 = (value>>13)&1;
    tb->inD_14 = (value>>14)&1;
    tb->inD_15 = (value>>15)&1;
}

void SetDDB(Vm_DMA *tb, uint16_t value)
{
    tb->DDB_0 = (value>>0)&1;
    tb->DDB_1 = (value>>1)&1;
    tb->DDB_2 = (value>>2)&1;
    tb->DDB_3 = (value>>3)&1;
    tb->DDB_4 = (value>>4)&1;
    tb->DDB_5 = (value>>5)&1;
    tb->DDB_6 = (value>>6)&1;
    tb->DDB_7 = (value>>7)&1;
    tb->DDB_8 = (value>>8)&1;
    tb->DDB_9 = (value>>9)&1;
    tb->DDB_10 = (value>>10)&1;
    tb->DDB_11 = (value>>11)&1;
    tb->DDB_12 = (value>>12)&1;
    tb->DDB_13 = (value>>13)&1;
    tb->DDB_14 = (value>>14)&1;
    tb->DDB_15 = (value>>15)&1;
}

void SetA(Vm_DMA *tb, uint32_t value)
{
    tb->inA_0 = (value>>0)&1;
    tb->inA_1 = (value>>1)&1;
    tb->inA_2 = (value>>2)&1;
    tb->inA_3 = (value>>3)&1;
    tb->inA_4 = (value>>4)&1;
    tb->inA_5 = (value>>5)&1;
    tb->inA_6 = (value>>6)&1;
    tb->inA_7 = (value>>7)&1;
    tb->inA_8 = (value>>8)&1;
    tb->inA_9 = (value>>9)&1;
    tb->inA_10 = (value>>10)&1;
    tb->inA_11 = (value>>11)&1;
    tb->inA_12 = (value>>12)&1;
    tb->inA_13 = (value>>13)&1;
    tb->inA_14 = (value>>14)&1;
    tb->inA_15 = (value>>15)&1;
    tb->inA_16 = (value>>16)&1;
    tb->inA_17 = (value>>17)&1;
    tb->inA_18 = (value>>18)&1;
    tb->inA_19 = (value>>19)&1;
}



int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_DMA *tb = new Vm_DMA;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL=0;
    tb->DMA0WRL=1;
    tb->DMA0RDL=1;
    tb->DMA1WRL=1;
    tb->DMA1RDL=1;
    tb->DMDWRL=1;
    tb->DMDRDL=1;
    tb->DSPBAKL=1;
    tb->WAITL=1;
    tb->RUN=0;
    SetD(tb,0x00);
    SetA(tb,0x00);
    SetDDB(tb,0x00);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RUN=1;
    ticks = doNTicks(tb,trace,ticks,512);

	trace->close();

	exit(EXIT_SUCCESS);
}










