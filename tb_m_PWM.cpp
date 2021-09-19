#include <stdlib.h>
#include "Vm_PWM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_PWM *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XCK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->XCK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_PWM *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetD(Vm_PWM *tb, uint16_t value)
{
    tb->D_2 = (value>>2)&1;
    tb->D_3 = (value>>3)&1;
    tb->D_4 = (value>>4)&1;
    tb->D_5 = (value>>5)&1;
    tb->D_6 = (value>>6)&1;
    tb->D_7 = (value>>7)&1;
    tb->D_8 = (value>>8)&1;
    tb->D_9 = (value>>9)&1;
    tb->D_10 = (value>>10)&1;
    tb->D_11 = (value>>11)&1;
    tb->D_12 = (value>>12)&1;
    tb->D_13 = (value>>13)&1;
    tb->D_14 = (value>>14)&1;
    tb->D_15 = (value>>15)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_PWM *tb = new Vm_PWM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->DACWRL=1;
    SetD(tb,0x99);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->DACWRL=0;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->DACWRL=1;
    ticks = doNTicks(tb,trace,ticks,512);

	trace->close();

	exit(EXIT_SUCCESS);
}









