#include <stdlib.h>
#include "Vm_INNERCNT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_INNERCNT *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_INNERCNT *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetID(Vm_INNERCNT *tb, uint8_t value)
{
    tb->ID_0=value&1;
    tb->ID_1=(value>>1)&1;
    tb->ID_2=(value>>2)&1;
    tb->ID_3=(value>>3)&1;
    tb->ID_4=(value>>4)&1;
    tb->ID_5=(value>>5)&1;
    tb->ID_6=(value>>6)&1;
    tb->ID_7=(value>>7)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_INNERCNT *tb = new Vm_INNERCNT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb,2);
    tb->LDINRL=1;
    tb->LDMODL=1;
    tb->LDICNTL=1;
    tb->INCLKL=1;
    tb->RESET=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESET=0;
    ticks = doNTicks(tb,trace,ticks,10);

    // Load counter
    tb->LDINRL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->LDINRL=1;
    // Load counter
    tb->LDICNTL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->LDICNTL=1;

    // Tick cnt
    tb->INCLKL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->INCLKL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // Tick cnt
    tb->INCLKL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->INCLKL=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}










