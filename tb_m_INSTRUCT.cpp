#include <stdlib.h>
#include "Vm_INSTRUCT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_INSTRUCT *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XCK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->XCK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_INSTRUCT *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetPD(Vm_INSTRUCT *tb, uint16_t value)
{
    tb->PD_9 = (value>>9)&1;
    tb->PD_10 = (value>>10)&1;
    tb->PD_11 = (value>>11)&1;
    tb->PD_12 = (value>>12)&1;
    tb->PD_13 = (value>>13)&1;
    tb->PD_14 = (value>>14)&1;
    tb->PD_15 = (value>>15)&1;
}

void SetDA(Vm_INSTRUCT *tb, uint8_t value)
{
    tb->DA_0 = (value>>0)&1;
    tb->DA_1 = (value>>1)&1;
    tb->DA_2 = (value>>2)&1;
    tb->DA_3 = (value>>3)&1;
    tb->DAL_0 = (~(value>>0))&1;
    tb->DAL_1 = (~(value>>1))&1;
    tb->DAL_2 = (~(value>>2))&1;
    tb->DAL_3 = (~(value>>3))&1;
}


int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_INSTRUCT *tb = new Vm_INSTRUCT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->REGS=0;
    tb->RUN=0;
    tb->RUNANT=0;
    tb->RESETL=0;
    tb->CARRY=0;
    tb->TRURD=0;

    SetPD(tb,0x00);
    SetDA(tb,0x00);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RUNANT=1;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->RUN=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}














