#include <stdlib.h>
#include "Vm_ADDRADD.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetADDA(Vm_ADDRADD *tb, uint32_t value)
{
    tb->ADDA_0=value&1;
    tb->ADDA_1=(value>>1)&1;
    tb->ADDA_2=(value>>2)&1;
    tb->ADDA_3=(value>>3)&1;
    tb->ADDA_4=(value>>4)&1;
    tb->ADDA_5=(value>>5)&1;
    tb->ADDA_6=(value>>6)&1;
    tb->ADDA_7=(value>>7)&1;
    tb->ADDA_8=(value>>8)&1;
    tb->ADDA_9=(value>>9)&1;
    tb->ADDA_10=(value>>10)&1;
    tb->ADDA_11=(value>>11)&1;
    tb->ADDA_12=(value>>12)&1;
    tb->ADDA_13=(value>>13)&1;
    tb->ADDA_14=(value>>14)&1;
    tb->ADDA_15=(value>>15)&1;
    tb->ADDA_16=(value>>16)&1;
    tb->ADDA_17=(value>>17)&1;
    tb->ADDA_18=(value>>18)&1;
    tb->ADDA_19=(value>>19)&1;
}

void SetADDB(Vm_ADDRADD *tb, uint16_t value)
{
    tb->ADDB_0=value&1;
    tb->ADDB_1=(value>>1)&1;
    tb->ADDB_2=(value>>2)&1;
    tb->ADDB_3=(value>>3)&1;
    tb->ADDB_4=(value>>4)&1;
    tb->ADDB_5=(value>>5)&1;
    tb->ADDB_6=(value>>6)&1;
    tb->ADDB_7=(value>>7)&1;
    tb->ADDB_8=(value>>8)&1;
}

int DoNTicks(Vm_ADDRADD *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_ADDRADD *tb = new Vm_ADDRADD;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetADDA(tb, 0x80000);
    SetADDB(tb, 0x80);

    tb->ADDAM1=0;
    tb->ADDBM1=0;
    tb->CARRYIN_0=tb->CARRYIN_1=0;
    tb->CINH6=tb->CINH7=tb->CINH15=0;
    tb->HISIGN=0;
    tb->VHISIGN=0;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);


	exit(EXIT_SUCCESS);
}






