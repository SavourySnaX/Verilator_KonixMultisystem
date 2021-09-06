#include <stdlib.h>
#include "Vm_DATA.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetICNT(Vm_DATA *tb, uint8_t value)
{
    tb->ICNT_0=value&1;
    tb->ICNT_1=(value>>1)&1;
    tb->ICNT_2=(value>>2)&1;
}

void SetID(Vm_DATA *tb, uint16_t value)
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

int DoNTicks(Vm_DATA *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_DATA *tb = new Vm_DATA;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");


    SetICNT(tb, 0);     // Bit select for BIT comparator mode
    SetID(tb, 0);       // DATA BITS (SRC,DST,PAT,LFU,COMP)

    tb->RES_0=1;        // From state machine   lores?  - when 1 causes byte compare between pat and src/dst (depending on srccmp/dstcmp)
    tb->LDCMPL=1;       // transition to 0 causes the lfu type to be latched
    tb->LDMODL=1;       // pattern or src select
    tb->LDDSTL=1;
    tb->LDSRCL=1;
    tb->LDPATL=1;
    tb->DAM1L=1;
    tb->DATOEL=0;       // Always enable data out for now
    tb->SRCCMP=0;
    tb->DSTCMP=0;
    tb->SSWAP=0;
    tb->SRCLTOH=0;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    // Load SRC
    SetID(tb,0x1234);
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDSRCL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDSRCL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    // Load PAT
    SetID(tb,0xAAAA);
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDPATL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDPATL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    // Load DST
    SetID(tb,0x5555);
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDDSTL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDDSTL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    // Load COMP and LFU bits   - will be comparing pattern with pattern here because neither srcmp nor dstcmp selected
    SetID(tb,0x11);
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDCMPL=0;
    tb->LDMODL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDCMPL=1;
    tb->LDMODL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->SRCCMP=1;                           // now comparing src with pat
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->DSTCMP=1;                           // now comparing dst with src
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->SRCCMP=0;                           // now comparing dst with pat
    ticks = DoNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}



