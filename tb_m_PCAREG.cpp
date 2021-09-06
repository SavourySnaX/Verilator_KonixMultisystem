#include <stdlib.h>
#include "Vm_PCAREG.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetADDQ(Vm_PCAREG *tb, uint32_t value)
{
    tb->ADDQ_0=value&1;
    tb->ADDQ_1=(value>>1)&1;
    tb->ADDQ_2=(value>>2)&1;
    tb->ADDQ_3=(value>>3)&1;
    tb->ADDQ_4=(value>>4)&1;
    tb->ADDQ_5=(value>>5)&1;
    tb->ADDQ_6=(value>>6)&1;
    tb->ADDQ_7=(value>>7)&1;
    tb->ADDQ_8=(value>>8)&1;
    tb->ADDQ_9=(value>>9)&1;
    tb->ADDQ_10=(value>>10)&1;
    tb->ADDQ_11=(value>>11)&1;
    tb->ADDQ_12=(value>>12)&1;
    tb->ADDQ_13=(value>>13)&1;
    tb->ADDQ_14=(value>>14)&1;
    tb->ADDQ_15=(value>>15)&1;
    tb->ADDQ_16=(value>>16)&1;
    tb->ADDQ_17=(value>>17)&1;
    tb->ADDQ_18=(value>>18)&1;
    tb->ADDQ_19=(value>>19)&1;
}

void SetID(Vm_PCAREG *tb, uint8_t value)
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

int DoNTicks(Vm_PCAREG *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_PCAREG *tb = new Vm_PCAREG;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetADDQ(tb,0x12345);
    SetID(tb, 0);
    tb->PCWRL_0=tb->PCWRL_1=tb->PCWRL_2=1;
    tb->RUN=0;
    tb->UPDPCL=1;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    // Load first byte of address
    SetID(tb, 0x88);
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_0=0;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_0=1;
    ticks = DoNTicks(tb,trace,ticks,8);
    // Load second byte of address
    SetID(tb, 0x44);
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_1=0;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_1=1;
    ticks = DoNTicks(tb,trace,ticks,8);
    // Load third byte of address
    SetID(tb, 0x22);
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_2=0;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->PCWRL_2=1;
    ticks = DoNTicks(tb,trace,ticks,8);

    // Load whole value from ADDQ
    tb->UPDPCL=0;
    tb->RUN=1;
    ticks = DoNTicks(tb,trace,ticks,1);
    tb->UPDPCL=1;
    ticks = DoNTicks(tb,trace,ticks,8);
	trace->close();

	exit(EXIT_SUCCESS);
}




