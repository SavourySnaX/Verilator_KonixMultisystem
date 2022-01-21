#include <stdlib.h>
#include "Vm_CLOCK.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_CLOCK *tb = new Vm_CLOCK;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open(TRACE_FILE);

	tb->VRD=1;
	tb->VWR=1;
	tb->NTSC=0;
	tb->TSTCLK=0;
	tb->LP=0;
	tb->FAST=0;

	int aFewClocks = 2000;
	int ticks=1;
	int mclk=0;
	while (!Verilated::gotFinish() && aFewClocks>0)
	{
		tb->MasterClock=1;
		if (ticks%8==0)
		{
			mclk=mclk?0:1;
			tb->MCK=mclk;
		}
		trace->dump(ticks*10-2);
		tb->eval();
		trace->dump(ticks*10);
		tb->MasterClock=0;
		tb->eval();
		trace->dump(ticks*10+5);
		trace->flush();
		aFewClocks--;

		ticks++;

		if (ticks>20)
		{
			tb->VRD=0;
			tb->VWR=0;
		}

		if (ticks>1000)
		{
			tb->NTSC=1;
			tb->FAST=1;
		}
	}

	trace->close();

	exit(EXIT_SUCCESS);
}
