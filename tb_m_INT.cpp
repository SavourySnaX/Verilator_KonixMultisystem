#include <stdlib.h>
#include "Vm_INT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_INT *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_INT *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetD(Vm_INT *tb, uint8_t value)
{
    tb->D_0=value&1;
    tb->D_1=(value>>1)&1;
    tb->D_2=(value>>2)&1;
    tb->D_3=(value>>3)&1;
    tb->D_4=(value>>4)&1;
    tb->D_5=(value>>5)&1;
    tb->D_6=(value>>6)&1;
    tb->D_7=(value>>7)&1;
}

void SetWD(Vm_INT *tb, uint8_t value)
{
    tb->WD_0=value&1;
    tb->WD_1=(value>>1)&1;
    tb->WD_2=(value>>2)&1;
    tb->WD_3=(value>>3)&1;
}


int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_INT *tb = new Vm_INT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    SetD(tb,0);
    SetWD(tb,0);
    tb->VINT=0;
    tb->AIL_0=tb->AIL_1=tb->AIL_2=1;
    tb->INTAL=1;
    tb->ACK=0;
    tb->DIS=0;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->VINT=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->INTAL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    
    tb->INTAL=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}



