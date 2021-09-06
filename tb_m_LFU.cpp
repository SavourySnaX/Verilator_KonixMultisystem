#include <stdlib.h>
#include "Vm_LFU.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetID(Vm_LFU *tb, uint8_t value)
{
    tb->ID_4=value&1;
    tb->ID_5=(value>>1)&1;
    tb->ID_6=(value>>2)&1;
    tb->ID_7=(value>>3)&1;
}

void SetSRCD(Vm_LFU *tb, uint16_t value)
{
    tb->SRCD_0=value&1;
    tb->SRCD_1=(value>>1)&1;
    tb->SRCD_2=(value>>2)&1;
    tb->SRCD_3=(value>>3)&1;
    tb->SRCD_4=(value>>4)&1;
    tb->SRCD_5=(value>>5)&1;
    tb->SRCD_6=(value>>6)&1;
    tb->SRCD_7=(value>>7)&1;
    tb->SRCD_8=(value>>8)&1;
    tb->SRCD_9=(value>>9)&1;
    tb->SRCD_10=(value>>10)&1;
    tb->SRCD_11=(value>>11)&1;
    tb->SRCD_12=(value>>12)&1;
    tb->SRCD_13=(value>>13)&1;
    tb->SRCD_14=(value>>14)&1;
    tb->SRCD_15=(value>>15)&1;
}

void SetDSTD(Vm_LFU *tb, uint8_t value)
{
    tb->DSTD_0=value&1;
    tb->DSTD_1=(value>>1)&1;
    tb->DSTD_2=(value>>2)&1;
    tb->DSTD_3=(value>>3)&1;
    tb->DSTD_4=(value>>4)&1;
    tb->DSTD_5=(value>>5)&1;
    tb->DSTD_6=(value>>6)&1;
    tb->DSTD_7=(value>>7)&1;
}

void SetPATD(Vm_LFU *tb, uint8_t value)
{
    tb->PATD_0=value&1;
    tb->PATD_1=(value>>1)&1;
    tb->PATD_2=(value>>2)&1;
    tb->PATD_3=(value>>3)&1;
    tb->PATD_4=(value>>4)&1;
    tb->PATD_5=(value>>5)&1;
    tb->PATD_6=(value>>6)&1;
    tb->PATD_7=(value>>7)&1;
}

int DoNTicks(Vm_LFU *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_LFU *tb = new Vm_LFU;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetID(tb, 0);       // LFU BITS
    SetSRCD(tb, 0x12FF);
    SetDSTD(tb, 0xAA);
    SetPATD(tb, 0x55);

    tb->RES_0=1;        // From state machine   lores?  - when 1 causes byte compare between pat and src/dst (depending on srccmp/dstcmp)
    tb->LDCMPL=1;       // transition to 0 causes the lfu type to be latched
    tb->LDMODL=1;       // pattern or src select
    tb->DAM1L=1;
    tb->DATOEL=1;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    // Load the LFU BITS....
    SetID(tb,1);
    tb->LDCMPL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDCMPL=1;
    ticks = DoNTicks(tb,trace,ticks,10);
    SetID(tb,2);
    for (int a=0;a<128;a++)
    {
        SetDSTD(tb, a);
        ticks = DoNTicks(tb,trace,ticks,10);
    }

    tb->DATOEL=0;    
    ticks = DoNTicks(tb,trace,ticks,10);
    for (int a=0;a<128;a++)
    {
        SetDSTD(tb, a);
        ticks = DoNTicks(tb,trace,ticks,10);
    }


	trace->close();

	exit(EXIT_SUCCESS);
}


