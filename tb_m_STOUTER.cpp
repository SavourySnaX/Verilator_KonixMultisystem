#include <stdlib.h>
#include "Vm_STOUTER.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_STOUTER *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_STOUTER *tb, VerilatedVcdC* trace, int ticks, int n)
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

	Vm_STOUTER *tb = new Vm_STOUTER;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->COMDN=0;
    tb->DSTUP=0;
    tb->IQUIET=0;
    tb->OUTER0L=1;
    tb->PARDN=0;
    tb->PARRD=0;
    tb->SRESET=0;
    tb->SRCUP=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}






