#include <stdlib.h>
#include "Vm_COMP.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetICNT(Vm_COMP *tb, uint8_t value)
{
    tb->ICNT_0=value&1;
    tb->ICNT_1=(value>>1)&1;
    tb->ICNT_2=(value>>2)&1;
}

void SetID(Vm_COMP *tb, uint8_t value)
{
    tb->ID_0=value&1;
    tb->ID_1=(value>>1)&1;
    tb->ID_2=(value>>2)&1;
    tb->ID_3=(value>>3)&1;
}

void SetSRCD(Vm_COMP *tb, uint8_t value)
{
    tb->SRCD_0=value&1;
    tb->SRCD_1=(value>>1)&1;
    tb->SRCD_2=(value>>2)&1;
    tb->SRCD_3=(value>>3)&1;
    tb->SRCD_4=(value>>4)&1;
    tb->SRCD_5=(value>>5)&1;
    tb->SRCD_6=(value>>6)&1;
    tb->SRCD_7=(value>>7)&1;
}

void SetDSTD(Vm_COMP *tb, uint8_t value)
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

void SetPATD(Vm_COMP *tb, uint8_t value)
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

int DoNTicks(Vm_COMP *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_COMP *tb = new Vm_COMP;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetICNT(tb, 0);
    SetID(tb, 0);
    SetSRCD(tb, 0xFF);
    SetDSTD(tb, 0xAA);
    SetPATD(tb, 0x55);

    tb->RES_0=1;        // From state machine   lores?  - when 1 causes byte compare between pat and src/dst (depending on srccmp/dstcmp)
    tb->LDCMPL=1;       // transition to 0 causes the comparison type to be latched (ID_0/ID_1/ID_2/ID_3 == EQU/NE/GREATER/CMPPLN) 
    tb->LDMODL=1;       // latches bit compare (which presumably means we compare with bit number in ICNT?)
    tb->DAM1L=1;
    tb->SRCCMP=0;
    tb->DSTCMP=0;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);

    // Load the comparitor....
    SetID(tb,1);    // CMPEQ
    tb->LDCMPL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDCMPL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->DSTCMP=1;

    ticks = DoNTicks(tb,trace,ticks,10);
    for (int a=0;a<256;a++)
    {
        SetDSTD(tb, a);
        ticks = DoNTicks(tb,trace,ticks,10);
    }

    SetID(tb,2);    // CMPNE
    tb->LDCMPL=0;
    ticks = DoNTicks(tb,trace,ticks,10);
    tb->LDCMPL=1;
    ticks = DoNTicks(tb,trace,ticks,10);

    tb->DSTCMP=1;

    ticks = DoNTicks(tb,trace,ticks,10);
    for (int a=0;a<256;a++)
    {
        SetDSTD(tb, a);
        ticks = DoNTicks(tb,trace,ticks,10);
    }



	trace->close();

	exit(EXIT_SUCCESS);
}

