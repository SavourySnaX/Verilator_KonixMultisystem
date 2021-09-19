#include <stdlib.h>
#include "Vm_PC.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_PC *tb, VerilatedVcdC* trace, int ticks)
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

int doNTicks(Vm_PC *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetDDB(Vm_PC *tb, uint8_t value)
{
    tb->DDB_0 = (value>>0)&1;
    tb->DDB_1 = (value>>1)&1;
    tb->DDB_2 = (value>>2)&1;
    tb->DDB_3 = (value>>3)&1;
    tb->DDB_4 = (value>>4)&1;
    tb->DDB_5 = (value>>5)&1;
    tb->DDB_6 = (value>>6)&1;
    tb->DDB_7 = (value>>7)&1;
}

void SetHA(Vm_PC *tb, uint8_t value)
{
    tb->HA_1 = (value>>0)&1;
    tb->HA_2 = (value>>1)&1;
    tb->HA_3 = (value>>2)&1;
    tb->HA_4 = (value>>3)&1;
    tb->HA_5 = (value>>4)&1;
    tb->HA_6 = (value>>5)&1;
    tb->HA_7 = (value>>6)&1;
    tb->HA_8 = (value>>7)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_PC *tb = new Vm_PC;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RUN=0;
    tb->RESETL=0;
    tb->PCRDL=1;
    tb->PCWRL=1;
    tb->HPCWRL=1;
    SetHA(tb,0x10*2);
    SetDDB(tb,0x55);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RUN=1;
    ticks = doNTicks(tb,trace,ticks,100);

    tb->PCRDL=0;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->PCRDL=1;
    tb->PCWRL=0;
    tb->HPCWRL=0;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->PCWRL=1;
    tb->HPCWRL=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}








