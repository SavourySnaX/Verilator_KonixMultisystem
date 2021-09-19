#include <stdlib.h>
#include "Vm_PRAM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_PRAM *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_PRAM *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetPD(Vm_PRAM *tb, uint16_t value)
{
    tb->inPD_0 = (value>>0)&1;
    tb->inPD_1 = (value>>1)&1;
    tb->inPD_2 = (value>>2)&1;
    tb->inPD_3 = (value>>3)&1;
    tb->inPD_4 = (value>>4)&1;
    tb->inPD_5 = (value>>5)&1;
    tb->inPD_6 = (value>>6)&1;
    tb->inPD_7 = (value>>7)&1;
    tb->inPD_8 = (value>>8)&1;
    tb->inPD_9 = (value>>9)&1;
    tb->inPD_10 = (value>>10)&1;
    tb->inPD_11 = (value>>11)&1;
    tb->inPD_12 = (value>>12)&1;
    tb->inPD_13 = (value>>13)&1;
    tb->inPD_14 = (value>>14)&1;
    tb->inPD_15 = (value>>15)&1;
}

void SetD(Vm_PRAM *tb, uint8_t value)
{
    tb->inD_0 = (value>>0)&1;
    tb->inD_1 = (value>>1)&1;
    tb->inD_2 = (value>>2)&1;
    tb->inD_3 = (value>>3)&1;
    tb->inD_4 = (value>>4)&1;
    tb->inD_5 = (value>>5)&1;
    tb->inD_6 = (value>>6)&1;
    tb->inD_7 = (value>>7)&1;
}

void SetA(Vm_PRAM *tb, uint32_t value)
{
    tb->A_0 = (value>>0)&1;
    tb->A_9 = (value>>9)&1;
    tb->A_10 = (value>>10)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_PRAM *tb = new Vm_PRAM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->DCSL=1;
    tb->RDL=1;
    tb->WRL=1;
    tb->RUN=0;
    SetD(tb,0x00);
    SetA(tb,0x00);
    SetPD(tb,0x00);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    SetA(tb, 0x000);    // Program Ram DSP Address
    SetPD(tb, 0xAABB);
    SetD(tb,0x55);
    tb->DCSL=0;             // DSP chip select?
    tb->WRL=0;
    ticks = doNTicks(tb,trace,ticks,10);

    for (int a=0;a<0x1000;a++)
    {
        SetA(tb, a);
        SetD(tb, a);
        ticks = doNTicks(tb,trace,ticks,10);
    }

	trace->close();

	exit(EXIT_SUCCESS);
}











