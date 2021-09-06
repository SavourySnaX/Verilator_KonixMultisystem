#include <stdlib.h>
#include "Vm_CMDREGS.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_CMDREGS *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_CMDREGS *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetID(Vm_CMDREGS *tb, uint8_t value)
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

	Vm_CMDREGS *tb = new Vm_CMDREGS;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb,0);
    tb->CMDWRL=1;
    tb->CONWRL=1;
    tb->ICNT_8=0;
    tb->LDMODL=1;
    tb->LDCMDL=1;
    tb->RESET=0;
    tb->STOP=0;
    tb->STRD=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}









