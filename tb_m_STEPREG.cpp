#include <stdlib.h>
#include "Vm_STEPREG.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetID(Vm_STEPREG *tb, uint8_t value)
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

int DoNTicks(Vm_STEPREG *tb, VerilatedVcdC *trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
		trace->dump(ticks*10);
		tb->eval();
		trace->flush();

		ticks++;
    }

    return ticks;
}


int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_STEPREG *tb = new Vm_STEPREG;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb, 0x95);
    tb->LDMODL=1;
    tb->LDSTPL=1;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);


	trace->close();

	exit(EXIT_SUCCESS);
}




