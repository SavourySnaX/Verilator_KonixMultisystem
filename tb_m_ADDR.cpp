#include <stdlib.h>
#include "Vm_ADDR.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int DoNTicks(Vm_ADDR *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_ADDR *tb = new Vm_ADDR;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");


	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);


	exit(EXIT_SUCCESS);
}







