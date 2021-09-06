#include <stdlib.h>
#include "Vm_SRCDATA.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetID(Vm_SRCDATA *tb, uint16_t value)
{
    tb->ID_0=value&1;
    tb->ID_1=(value>>1)&1;
    tb->ID_2=(value>>2)&1;
    tb->ID_3=(value>>3)&1;
    tb->ID_4=(value>>4)&1;
    tb->ID_5=(value>>5)&1;
    tb->ID_6=(value>>6)&1;
    tb->ID_7=(value>>7)&1;
    tb->ID_8=(value>>8)&1;
    tb->ID_9=(value>>9)&1;
    tb->ID_10=(value>>10)&1;
    tb->ID_11=(value>>11)&1;
    tb->ID_12=(value>>12)&1;
    tb->ID_13=(value>>13)&1;
    tb->ID_14=(value>>14)&1;
    tb->ID_15=(value>>15)&1;
}

uint16_t GetSRCD(Vm_SRCDATA *tb)
{
    uint32_t result=tb->SRCD_15;
    result<<=1; result|=tb->SRCD_14;
    result<<=1; result|=tb->SRCD_13;
    result<<=1; result|=tb->SRCD_12;
    result<<=1; result|=tb->SRCD_11;
    result<<=1; result|=tb->SRCD_10;
    result<<=1; result|=tb->SRCD_9;
    result<<=1; result|=tb->SRCD_8;
    result<<=1; result|=tb->SRCD_7;
    result<<=1; result|=tb->SRCD_6;
    result<<=1; result|=tb->SRCD_5;
    result<<=1; result|=tb->SRCD_4;
    result<<=1; result|=tb->SRCD_3;
    result<<=1; result|=tb->SRCD_2;
    result<<=1; result|=tb->SRCD_1;
    result<<=1; result|=tb->SRCD_0;

    return result;
}

int DoNTicks(Vm_SRCDATA *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_SRCDATA *tb = new Vm_SRCDATA;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb, 0);
    tb->LDSRCL = 1;
    tb->SRCLTOH = 0;
    tb->SSWAP = 0;

	int aFewClocks = 2000;
	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    SetID(tb, 0xA55A);
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->LDSRCL=0;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->LDSRCL=1;
    ticks = DoNTicks(tb,trace,ticks,9);

    SetID(tb, 0x1234);
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->SSWAP=1;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->SSWAP=0;
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->SRCLTOH=1;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->SRCLTOH=0;
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->SRCLTOH=1;
    tb->LDSRCL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->SRCLTOH=0;
    tb->LDSRCL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}

