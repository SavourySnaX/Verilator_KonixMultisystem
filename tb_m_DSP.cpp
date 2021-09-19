#include <stdlib.h>
#include "Vm_DSP.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_DSP *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CCLK=1;
    tb->DQCLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CCLK=0;
    tb->eval();
    trace->dump(ticks*10+2);
    tb->DQCLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_DSP *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetPD(Vm_DSP *tb, uint16_t value)
{
    tb->inPD_0 = (value>>0)&1;
    tb->inPD_1 = (value>>1)&1;
    tb->inPD_2 = (value>>2)&1;
    tb->inPD_3 = (value>>3)&1;
    tb->inPD_4 = (value>>4)&1;
    tb->inPD_5 = (value>>5)&1;
    tb->inPD_6 = (value>>6)&1;
    tb->inPD_7 = (value>>7)&1;
    tb->inPD_8 = (value>>8)&1;
    tb->inPD_9 = (value>>9)&1;
    tb->inPD_10 = (value>>10)&1;
    tb->inPD_11 = (value>>11)&1;
    tb->inPD_12 = (value>>12)&1;
    tb->inPD_13 = (value>>13)&1;
    tb->inPD_14 = (value>>14)&1;
    tb->inPD_15 = (value>>15)&1;
}

void SetDD(Vm_DSP *tb, uint8_t value)
{
    tb->inDD_0 = (value>>0)&1;
    tb->inDD_1 = (value>>1)&1;
    tb->inDD_2 = (value>>2)&1;
    tb->inDD_3 = (value>>3)&1;
    tb->inDD_4 = (value>>4)&1;
    tb->inDD_5 = (value>>5)&1;
    tb->inDD_6 = (value>>6)&1;
    tb->inDD_7 = (value>>7)&1;
    tb->inDD_8 = (value>>8)&1;
    tb->inDD_9 = (value>>9)&1;
    tb->inDD_10 = (value>>10)&1;
    tb->inDD_11 = (value>>11)&1;
    tb->inDD_12 = (value>>12)&1;
    tb->inDD_13 = (value>>13)&1;
    tb->inDD_14 = (value>>14)&1;
    tb->inDD_15 = (value>>15)&1;
}

void SetD(Vm_DSP *tb, uint8_t value)
{
    tb->inD_0 = (value>>0)&1;
    tb->inD_1 = (value>>1)&1;
    tb->inD_2 = (value>>2)&1;
    tb->inD_3 = (value>>3)&1;
    tb->inD_4 = (value>>4)&1;
    tb->inD_5 = (value>>5)&1;
    tb->inD_6 = (value>>6)&1;
    tb->inD_7 = (value>>7)&1;
    tb->inD_8 = (value>>8)&1;
    tb->inD_9 = (value>>9)&1;
    tb->inD_10 = (value>>10)&1;
    tb->inD_11 = (value>>11)&1;
    tb->inD_12 = (value>>12)&1;
    tb->inD_13 = (value>>13)&1;
    tb->inD_14 = (value>>14)&1;
    tb->inD_15 = (value>>15)&1;
}

void SetA(Vm_DSP *tb, uint32_t value)
{
    tb->inA_0 = (value>>0)&1;
    tb->inA_1 = (value>>1)&1;
    tb->inA_2 = (value>>2)&1;
    tb->inA_3 = (value>>3)&1;
    tb->inA_4 = (value>>4)&1;
    tb->inA_5 = (value>>5)&1;
    tb->inA_6 = (value>>6)&1;
    tb->inA_7 = (value>>7)&1;
    tb->inA_8 = (value>>8)&1;
    tb->inA_9 = (value>>9)&1;
    tb->inA_10 = (value>>10)&1;
    tb->inA_11 = (value>>11)&1;
    tb->inA_12 = (value>>12)&1;
    tb->inA_13 = (value>>13)&1;
    tb->inA_14 = (value>>14)&1;
    tb->inA_15 = (value>>15)&1;
    tb->inA_16 = (value>>16)&1;
    tb->inA_17 = (value>>17)&1;
    tb->inA_18 = (value>>18)&1;
    tb->inA_19 = (value>>19)&1;
}

void SetAZ(Vm_DSP *tb, uint32_t value)
{
    tb->AZ_0 = (value>>0)&1;
    tb->AZ_1 = (value>>1)&1;
    tb->AZ_2 = (value>>2)&1;
    tb->AZ_3 = (value>>3)&1;
    tb->AZ_4 = (value>>4)&1;
    tb->AZ_5 = (value>>5)&1;
    tb->AZ_6 = (value>>6)&1;
    tb->AZ_7 = (value>>7)&1;
    tb->AZ_8 = (value>>8)&1;
    tb->AZ_9 = (value>>9)&1;
    tb->AZ_10 = (value>>10)&1;
    tb->AZ_11 = (value>>11)&1;
    tb->AZ_12 = (value>>12)&1;
    tb->AZ_13 = (value>>13)&1;
    tb->AZ_14 = (value>>14)&1;
    tb->AZ_15 = (value>>15)&1;
}

void SetMZ(Vm_DSP *tb, uint64_t value)
{
    tb->MZ_0 = (value>>0)&1;
    tb->MZ_1 = (value>>1)&1;
    tb->MZ_2 = (value>>2)&1;
    tb->MZ_3 = (value>>3)&1;
    tb->MZ_4 = (value>>4)&1;
    tb->MZ_5 = (value>>5)&1;
    tb->MZ_6 = (value>>6)&1;
    tb->MZ_7 = (value>>7)&1;
    tb->MZ_8 = (value>>8)&1;
    tb->MZ_9 = (value>>9)&1;
    tb->MZ_10 = (value>>10)&1;
    tb->MZ_11 = (value>>11)&1;
    tb->MZ_12 = (value>>12)&1;
    tb->MZ_13 = (value>>13)&1;
    tb->MZ_14 = (value>>14)&1;
    tb->MZ_15 = (value>>15)&1;
    tb->MZ_16 = (value>>16)&1;
    tb->MZ_17 = (value>>17)&1;
    tb->MZ_18 = (value>>18)&1;
    tb->MZ_19 = (value>>19)&1;
    tb->MZ_20 = (value>>20)&1;
    tb->MZ_21 = (value>>21)&1;
    tb->MZ_22 = (value>>22)&1;
    tb->MZ_23 = (value>>23)&1;
    tb->MZ_24 = (value>>24)&1;
    tb->MZ_25 = (value>>25)&1;
    tb->MZ_26 = (value>>26)&1;
    tb->MZ_27 = (value>>27)&1;
    tb->MZ_28 = (value>>28)&1;
    tb->MZ_29 = (value>>29)&1;
    tb->MZ_30 = (value>>30)&1;
    tb->MZ_31 = (value>>31)&1;
    tb->MZ_32 = (value>>32)&1;
    tb->MZ_33 = (value>>33)&1;
    tb->MZ_34 = (value>>34)&1;
    tb->MZ_35 = (value>>35)&1;
    tb->MZ_36 = (value>>36)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_DSP *tb = new Vm_DSP;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL=0;
    tb->DSPBAKL=1;
    tb->DCSL=1;
    tb->WAITL=1;
    tb->IOML=1;
    tb->RDL=1;
    tb->DWE=0;
    tb->COUTL=1;
    tb->INPUT=0;

    SetA(tb,0);
    SetD(tb,0);
    SetDD(tb,0);
    SetPD(tb,0);
    SetAZ(tb,0);
    SetMZ(tb,0);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // Attempt to start the DSP running
    SetA(tb, 0x41600);
    SetD(tb, 0x10);
    tb->DCSL=0;         // DSP is selected
    tb->DWE=1;

    ticks = doNTicks(tb,trace,ticks,1);

    tb->DWE=0;



    for (int a=0x41000;a<0x42000;a++)
    {
        SetA(tb,a);
        ticks = doNTicks(tb,trace,ticks,10);
    }


	trace->close();

	exit(EXIT_SUCCESS);
}












