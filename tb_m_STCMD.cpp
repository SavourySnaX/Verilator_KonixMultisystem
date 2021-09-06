#include <stdlib.h>
#include "Vm_STCMD.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_STCMD *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CCLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CCLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_STCMD *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_STCMD *tb = new Vm_STCMD;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->CYCEND=0;
    tb->ICYCEND=0;
    tb->RDCMD=0;
    tb->RESET=0;
    tb->RUN=0;
    tb->SRESET=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}







