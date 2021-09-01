#include <stdlib.h>
#include "Vm_VCNT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_VCNT *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_VCNT *tb, VerilatedVcdC* trace, int ticks, int n)
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

	Vm_VCNT *tb = new Vm_VCNT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    tb->D=0;
    tb->WD=0;
    tb->Vm_VCNTv=0;
    tb->AIL=7;
    tb->INTAL=1;
    tb->ACK=0;
    tb->DIS=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->Vm_VCNTv=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->INTAL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    
    tb->INTAL=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}




