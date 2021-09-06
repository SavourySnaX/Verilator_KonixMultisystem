#include <stdlib.h>
#include "Vm_PATDATA.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetID(Vm_PATDATA *tb, uint8_t value)
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

uint16_t GetPATD(Vm_PATDATA *tb)
{
    uint32_t result=tb->PATD_7;
    result<<=1; result|=tb->PATD_6;
    result<<=1; result|=tb->PATD_5;
    result<<=1; result|=tb->PATD_4;
    result<<=1; result|=tb->PATD_3;
    result<<=1; result|=tb->PATD_2;
    result<<=1; result|=tb->PATD_1;
    result<<=1; result|=tb->PATD_0;

    return result;
}

int DoNTicks(Vm_PATDATA *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_PATDATA *tb = new Vm_PATDATA;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb, 0);
    tb->LDPATL = 1;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    SetID(tb, 0x9A);
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->LDPATL=0;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->LDPATL=1;
    ticks = DoNTicks(tb,trace,ticks,9);

    SetID(tb, 0x12);
    ticks = DoNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}



