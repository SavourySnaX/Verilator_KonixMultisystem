#include <stdlib.h>
#include "Vm_ADDAMUX.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetSAL(Vm_ADDAMUX *tb, uint32_t value)
{
    tb->SAL_0=value&1;
    tb->SAL_1=(value>>1)&1;
    tb->SAL_2=(value>>2)&1;
    tb->SAL_3=(value>>3)&1;
    tb->SAL_4=(value>>4)&1;
    tb->SAL_5=(value>>5)&1;
    tb->SAL_6=(value>>6)&1;
    tb->SAL_7=(value>>7)&1;
    tb->SAL_8=(value>>8)&1;
    tb->SAL_9=(value>>9)&1;
    tb->SAL_10=(value>>10)&1;
    tb->SAL_11=(value>>11)&1;
    tb->SAL_12=(value>>12)&1;
    tb->SAL_13=(value>>13)&1;
    tb->SAL_14=(value>>14)&1;
    tb->SAL_15=(value>>15)&1;
    tb->SAL_16=(value>>16)&1;
    tb->SAL_17=(value>>17)&1;
    tb->SAL_18=(value>>18)&1;
    tb->SAL_19=(value>>19)&1;
}

void SetDAL(Vm_ADDAMUX *tb, uint32_t value)
{
    tb->DAL_0=value&1;
    tb->DAL_1=(value>>1)&1;
    tb->DAL_2=(value>>2)&1;
    tb->DAL_3=(value>>3)&1;
    tb->DAL_4=(value>>4)&1;
    tb->DAL_5=(value>>5)&1;
    tb->DAL_6=(value>>6)&1;
    tb->DAL_7=(value>>7)&1;
    tb->DAL_8=(value>>8)&1;
    tb->DAL_9=(value>>9)&1;
    tb->DAL_10=(value>>10)&1;
    tb->DAL_11=(value>>11)&1;
    tb->DAL_12=(value>>12)&1;
    tb->DAL_13=(value>>13)&1;
    tb->DAL_14=(value>>14)&1;
    tb->DAL_15=(value>>15)&1;
    tb->DAL_16=(value>>16)&1;
    tb->DAL_17=(value>>17)&1;
    tb->DAL_18=(value>>18)&1;
    tb->DAL_19=(value>>19)&1;
}

void SetPCL(Vm_ADDAMUX *tb, uint32_t value)
{
    tb->PCL_0=value&1;
    tb->PCL_1=(value>>1)&1;
    tb->PCL_2=(value>>2)&1;
    tb->PCL_3=(value>>3)&1;
    tb->PCL_4=(value>>4)&1;
    tb->PCL_5=(value>>5)&1;
    tb->PCL_6=(value>>6)&1;
    tb->PCL_7=(value>>7)&1;
    tb->PCL_8=(value>>8)&1;
    tb->PCL_9=(value>>9)&1;
    tb->PCL_10=(value>>10)&1;
    tb->PCL_11=(value>>11)&1;
    tb->PCL_12=(value>>12)&1;
    tb->PCL_13=(value>>13)&1;
    tb->PCL_14=(value>>14)&1;
    tb->PCL_15=(value>>15)&1;
    tb->PCL_16=(value>>16)&1;
    tb->PCL_17=(value>>17)&1;
    tb->PCL_18=(value>>18)&1;
    tb->PCL_19=(value>>19)&1;
}

int DoNTicks(Vm_ADDAMUX *tb, VerilatedVcdC *trace, int ticks, int n)
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

	Vm_ADDAMUX *tb = new Vm_ADDAMUX;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetSAL(tb, 0x12345);
    SetDAL(tb, 0x6789A);
    SetPCL(tb, 0xBCDEF);

    tb->UPDSRCL=1;
    tb->UPDPCL=1;
    tb->SAM1L=1;
    tb->DAM1L=1;

	int ticks=1;

    ticks = DoNTicks(tb,trace,ticks,10);


	exit(EXIT_SUCCESS);
}





