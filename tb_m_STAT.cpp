#include <stdlib.h>
#include "Vm_STAT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_STAT *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XTALL=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->XTALL=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_STAT *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetD(Vm_STAT *tb, uint8_t value)
{
    tb->inD_0=value&1;
    tb->inD_1=(value>>1)&1;
    tb->inD_2=(value>>2)&1;
    tb->inD_3=(value>>3)&1;
    tb->inD_4=(value>>4)&1;
    tb->inD_5=(value>>5)&1;
    tb->inD_6=(value>>6)&1;
    tb->inD_7=(value>>7)&1;
}
void SetWD(Vm_STAT *tb, uint8_t value)
{
    tb->WD_0=value&1;
    tb->WD_1=(value>>1)&1;
    tb->WD_2=(value>>2)&1;
    tb->WD_3=(value>>3)&1;
    tb->WD_4=(value>>4)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_STAT *tb = new Vm_STAT;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    SetD(tb,0);
    SetWD(tb,0);
    tb->STATL=1;
    tb->DIAGL_0=1;
    tb->DIAG_1=0;
    tb->LCD=0;
    tb->LPSET=0;
    tb->PALL=0;     // PAL timings
    tb->PSRAML=1;   // Pseudo Static Ram -- unsure
    tb->FASTL=1;    // 6Mhz

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // read stat register
    tb->STATL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    
    tb->STATL=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // reset but now use fast and ntsc to change the bits returned by status
    tb->RESETL_0=0;
    tb->PALL=1;
    tb->FASTL=0;
    tb->PSRAML=0;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);
    
    // read stat register
    tb->STATL=0;
    ticks = doNTicks(tb,trace,ticks,10);
    
    tb->STATL=1;
    ticks = doNTicks(tb,trace,ticks,10);

	trace->close();

	exit(EXIT_SUCCESS);
}


