#include <stdlib.h>
#include "Vm_ADDBSEL.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetSTEP(Vm_ADDBSEL *tb, uint8_t value)
{
    tb->STEP_0=value&1;
    tb->STEP_1=(value>>1)&1;
    tb->STEP_2=(value>>2)&1;
    tb->STEP_3=(value>>3)&1;
    tb->STEP_4=(value>>4)&1;
    tb->STEP_5=(value>>5)&1;
    tb->STEP_6=(value>>6)&1;
    tb->STEP_7=(value>>7)&1;
}

int DoNTicks(Vm_ADDBSEL *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_ADDBSEL *tb = new Vm_ADDBSEL;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetSTEP(tb, 1);
    tb->ADSTP=0;
    tb->CARRYOUT=0;
    tb->SRCENF=0;
    tb->DSIGN=0;
    tb->DWRAP=0;
    tb->LINDR=0;
    tb->RES_0=tb->RES_1=0;
    tb->STEPM1=0;
    tb->SSIGN=0;
    tb->SWRAP=0;
    tb->UPDPCL=0;
    tb->UPDSRCL=0;
    tb->YFRAC=0;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);


	exit(EXIT_SUCCESS);
}






