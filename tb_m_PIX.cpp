#include <stdlib.h>
#include "Vm_PIX.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_PIX *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_PIX *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

// ?
void SetWD(Vm_PIX *tb, uint8_t value)
{
    tb->WD_0=value&1;
    tb->WD_1=(value>>1)&1;
    tb->WD_2=(value>>2)&1;
    tb->WD_3=(value>>3)&1;
    tb->WD_4=(value>>4)&1;
    tb->WD_5=(value>>5)&1;
    tb->WD_6=(value>>6)&1;
    tb->WD_7=(value>>7)&1;
}

// Presumably the video mode...
void SetMODE(Vm_PIX *tb, uint8_t value)
{
    tb->MODE_0=value&1;
    tb->MODE_1=(value>>1)&1;
}

// Horizontal counter bottom 4 bits?
void SetHC(Vm_PIX *tb, uint8_t value)
{
    tb->HC_0=value&1;
    tb->HC_1=(value>>1)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_PIX *tb = new Vm_PIX;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    SetMODE(tb,0);
    SetWD(tb,0);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    for (int a=0;a<512;a++)
    {
        SetHC(tb,a);
        ticks = doNTicks(tb,trace,ticks,1);
        ticks = doNTicks(tb,trace,ticks,10);
    }
	trace->close();

	exit(EXIT_SUCCESS);
}






