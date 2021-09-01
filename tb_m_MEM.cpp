#include <stdlib.h>
#include "Vm_MEM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

// 2 clocks...needed
//
// I think they should look like this : 
//
// CLK = 111000000111000000111
//DQLK = 111111000111111000111
//
// So for now 1 tick here is 3 clks in the above
//
//
// TODO check rest of design, only tested address decode so far
//
void tick(Vm_MEM *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CLK=1;
    tb->DQCLK=1;
    trace->dump(ticks*20-2);
    tb->eval();
    trace->dump(ticks*20);
    tb->CLK=0;
    tb->eval();
    trace->dump(ticks*20+10);
    tb->DQCLK=0;
    tb->eval();
    trace->dump(ticks*20+15);
    trace->flush();
}

int doNTicks(Vm_MEM *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetWD(Vm_MEM *tb, uint8_t value)
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

	Vm_MEM *tb = new Vm_MEM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    tb->BMREQ=0;
    tb->DMREQ=0;
    tb->HLDAL=1;
    tb->RDL=1;
    tb->WRL=1;
    tb->IOML=1;
    tb->A_0=0;
    tb->A_18=0;
    tb->A_19=0;
    tb->VBUSYL_0=tb->VBUSYL_1=1;
    tb->VCS=0;
    tb->VOE=0;
    tb->VCAS=0;
    tb->VRAS=0;
    SetWD(tb,0);
    tb->MEMLD=0;
    tb->PSUEDO=0;
    tb->BWORD=0;
    tb->DWORD=0;

    int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->A_18=1;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->A_18=0;
    tb->A_19=1;
    ticks = doNTicks(tb,trace,ticks,10);
    tb->A_18=1;
    tb->A_19=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}


