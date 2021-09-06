#include <stdlib.h>
#include "Vm_STINNER.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_STINNER *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_STINNER *tb, VerilatedVcdC* trace, int ticks, int n)
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

	Vm_STINNER *tb = new Vm_STINNER;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->BORROW=0;
    tb->COLST=0;
    tb->CYCEND=0;
    tb->CYCST=0;
    tb->DAM1L=1;
    tb->DSTEN=0;
    tb->ICYCEND=0;
    tb->ICYCST=0;
    tb->ILDPATL=0;
    tb->INHIB=0;
    tb->INLP=0;
    tb->INNER0=0;
    tb->IUPDDSTL=1;
    tb->IUPDSRCL=1;
    tb->LINDR=0;
    tb->RES_0=0;
    tb->RESET=0;
    tb->RESUME=0;
    tb->SAM1L=0;
    tb->SRCEN=0;
    tb->SRCENF=0;
    tb->SRESET=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}







