#include <stdlib.h>
#include "Vm_ADDRESS.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_ADDRESS *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CLK=1;
    tb->DQCLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CLK=0;
    tb->eval();
    trace->dump(ticks*10+2);
    tb->DQCLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_ADDRESS *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetDDB(Vm_ADDRESS *tb, uint16_t value)
{
    tb->DDB_0 = (value>>0)&1;
    tb->DDB_1 = (value>>1)&1;
    tb->DDB_2 = (value>>2)&1;
    tb->DDB_3 = (value>>3)&1;
    tb->DDB_4 = (value>>4)&1;
    tb->DDB_5 = (value>>5)&1;
    tb->DDB_6 = (value>>6)&1;
    tb->DDB_7 = (value>>7)&1;
    tb->DDB_8 = (value>>8)&1;
}

void SetPD(Vm_ADDRESS *tb, uint16_t value)
{
    tb->PD_0 = (value>>0)&1;
    tb->PD_1 = (value>>1)&1;
    tb->PD_2 = (value>>2)&1;
    tb->PD_3 = (value>>3)&1;
    tb->PD_4 = (value>>4)&1;
    tb->PD_5 = (value>>5)&1;
    tb->PD_6 = (value>>6)&1;
    tb->PD_7 = (value>>7)&1;
    tb->PD_8 = (value>>8)&1;
}

void SetA(Vm_ADDRESS *tb, uint16_t value)
{
    tb->A_1 = (value>>1)&1;
    tb->A_2 = (value>>2)&1;
    tb->A_3 = (value>>3)&1;
    tb->A_4 = (value>>4)&1;
    tb->A_5 = (value>>5)&1;
    tb->A_6 = (value>>6)&1;
    tb->A_7 = (value>>7)&1;
    tb->A_8 = (value>>8)&1;
    tb->A_9 = (value>>9)&1;
}


int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_ADDRESS *tb = new Vm_ADDRESS;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->ASEL_0=1;
    tb->ASEL_1=1;
    tb->RESETL=0;
    tb->IXWRL=1;
    tb->IXRDL=1;
    tb->TRARDL=1;
    tb->INTRALDL=1;

    SetDDB(tb,0x00);
    SetPD(tb,0x00);
    SetA(tb,0x00);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);


	trace->close();

	exit(EXIT_SUCCESS);
}













