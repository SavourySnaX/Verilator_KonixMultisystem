#include <stdlib.h>
#include "Vm_DRAM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_DRAM *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_DRAM *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetDD(Vm_DRAM *tb, uint16_t value)
{
    tb->inDD_0 = (value>>0)&1;
    tb->inDD_1 = (value>>1)&1;
    tb->inDD_2 = (value>>2)&1;
    tb->inDD_3 = (value>>3)&1;
    tb->inDD_4 = (value>>4)&1;
    tb->inDD_5 = (value>>5)&1;
    tb->inDD_6 = (value>>6)&1;
    tb->inDD_7 = (value>>7)&1;
    tb->inDD_8 = (value>>8)&1;
    tb->inDD_9 = (value>>9)&1;
    tb->inDD_10 = (value>>10)&1;
    tb->inDD_11 = (value>>11)&1;
    tb->inDD_12 = (value>>12)&1;
    tb->inDD_13 = (value>>13)&1;
    tb->inDD_14 = (value>>14)&1;
    tb->inDD_15 = (value>>15)&1;
}

void SetDA(Vm_DRAM *tb, uint16_t value)
{
    tb->DA_0 = (value>>0)&1;
    tb->DA_1 = (value>>1)&1;
    tb->DA_2 = (value>>2)&1;
    tb->DA_3 = (value>>3)&1;
    tb->DA_4 = (value>>4)&1;
    tb->DA_5 = (value>>5)&1;
    tb->DA_6 = (value>>6)&1;
    tb->DA_7 = (value>>7)&1;
    tb->DA_8 = (value>>8)&1;

    tb->DAL_4 = (~(value>>4))&1;
    tb->DAL_5 = (~(value>>5))&1;
    tb->DAL_6 = (~(value>>6))&1;
    tb->DAL_8 = (~(value>>8))&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_DRAM *tb = new Vm_DRAM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->READL=1;
    tb->WRITEL=1;
    tb->TRARDL=1;
    tb->IXRDL=1;
    tb->DAC=0;
    tb->DMA1RDL=1;
    tb->MZ2RDL=1;
    tb->PCRDL=1;
    tb->MODRDL=1;
    tb->GPRDL=1;
    tb->GPWRL=1;
    tb->RESETL=0;
    tb->INPUT=0;
    SetDD(tb,0x00);
    SetDA(tb,0x00);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->READL=0;
    for (int a=0;a<0x200;a++)
    {
        SetDA(tb, a);
        ticks = doNTicks(tb,trace,ticks,10);
    }

	trace->close();

	exit(EXIT_SUCCESS);
}












