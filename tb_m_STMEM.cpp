#include <stdlib.h>
#include "Vm_STMEM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_STMEM *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_STMEM *tb, VerilatedVcdC* trace, int ticks, int n)
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

	Vm_STMEM *tb = new Vm_STMEM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->ACKINT=0;
    tb->COMCRQ=0;
    tb->IDSTWR=0;
    tb->INCRQ=0;
    tb->INHIB=0;
    tb->PARCRQ=0;
    tb->RESET=0;
    tb->RES_0=0;
    tb->RES_1=0;
    tb->WAITL=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}








