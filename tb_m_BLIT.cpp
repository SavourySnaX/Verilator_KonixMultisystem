#include <stdlib.h>
#include "Vm_BLIT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_BLIT *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CCLK = 1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CCLK = 0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_BLIT *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

// A BUS (BI)
void SetA(Vm_BLIT *tb, uint32_t value)
{
    tb->A_0=value&1;
    tb->A_1=(value>>1)&1;
    tb->A_2=(value>>2)&1;
    tb->A_3=(value>>3)&1;
    tb->A_4=(value>>4)&1;
    tb->A_5=(value>>5)&1;
    tb->A_6=(value>>6)&1;
    tb->A_7=(value>>7)&1;
    tb->A_8=(value>>8)&1;
    tb->A_9=(value>>9)&1;
    tb->A_10=(value>>10)&1;
    tb->A_11=(value>>11)&1;
    tb->A_12=(value>>12)&1;
    tb->A_13=(value>>13)&1;
    tb->A_14=(value>>14)&1;
    tb->A_15=(value>>15)&1;
    tb->A_16=(value>>16)&1;
    tb->A_17=(value>>17)&1;
    tb->A_18=(value>>18)&1;
    tb->A_19=(value>>19)&1;
}

// D BUS (BI)
void SetD(Vm_BLIT *tb, uint16_t value)
{
    tb->D_0=value&1;
    tb->D_1=(value>>1)&1;
    tb->D_2=(value>>2)&1;
    tb->D_3=(value>>3)&1;
    tb->D_4=(value>>4)&1;
    tb->D_5=(value>>5)&1;
    tb->D_6=(value>>6)&1;
    tb->D_7=(value>>7)&1;
    tb->D_8=(value>>8)&1;
    tb->D_9=(value>>9)&1;
    tb->D_10=(value>>10)&1;
    tb->D_11=(value>>11)&1;
    tb->D_12=(value>>12)&1;
    tb->D_13=(value>>13)&1;
    tb->D_14=(value>>14)&1;
    tb->D_15=(value>>15)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_BLIT *tb = new Vm_BLIT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetA(tb, 0);
    SetD(tb, 0);

    tb->RESETL=0;
    tb->HLDAL=1;
    tb->DSPBRQL=1;
    tb->INTL=1;
    tb->IORDL=1;
    tb->IOWRL=1;
    tb->BCSL=0;     // select blitter
    tb->WAITL=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // Lets attempt to write a blitter operation...

    // BLITTER write address are
    // 0x30-0x32 BLITTER PC
    // 0x33 BLITTER CMD
    // 0x34 BLITTER CONTROL
    // 0x3F test mode register write

    // BLITTER read address are
    // 0x30-0x32 BLITTER DEST
    // 0x33-0x35 BLITTER SRC
    // 0x36 BLITTER STATUS
    // 0x37 Inner count
    // 0x38 Outer count
    // ^^ mirrored to other address ->0x3F


    SetA(tb, 0x30);
    SetD(tb, 0x45);     // Blitter program @ 0x12345
    tb->IOWRL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    

	trace->close();

	exit(EXIT_SUCCESS);
}

