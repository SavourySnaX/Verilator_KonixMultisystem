#include <stdlib.h>
#include "Vm_VTIM.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_VTIM *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->CLK=0;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_VTIM *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

// ?
void SetWD(Vm_VTIM *tb, uint8_t value)
{
    tb->WD_0=value&1;
    tb->WD_1=(value>>1)&1;
    tb->WD_2=(value>>2)&1;
    tb->WD_3=(value>>3)&1;
    tb->WD_4=(value>>4)&1;
    tb->WD_5=(value>>5)&1;
    tb->WD_6=(value>>6)&1;
    tb->WD_7=(value>>7)&1;
}

// Presumably the video mode...
void SetMODE(Vm_VTIM *tb, uint8_t value)
{
    tb->MODE_0=value&1;
    tb->MODE_1=(value>>1)&1;
}

// Bottom 3 bits of scroll (pixel shifter)
void SetSCRL(Vm_VTIM *tb, uint8_t value)
{
    tb->SCRL_0=value&1;
    tb->SCRL_1=(value>>1)&1;
    tb->SCRL_2=(value>>2)&1;
}

// Horizontal counter bottom 4 bits?
void SetHC(Vm_VTIM *tb, uint8_t value)
{
    tb->HC_0=value&1;
    tb->HC_1=(value>>1)&1;
    tb->HC_2=(value>>2)&1;
    tb->HC_3=(value>>3)&1;
}

/*
    input    VVACTIVE,                                                          //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HVACTIVE,                                                          //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    VSTART,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HD1,                                                               //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    PSUEDO,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HVHOLD,                                                            //[00019]    HVHOLD,NOWRAP;
    input    NOWRAP,              
*/

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_VTIM *tb = new Vm_VTIM;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;
    SetMODE(tb,0);
    SetSCRL(tb,0);
    SetWD(tb,0);

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);


    // Simulate line 0 - VACTIVE = 1, HACTIVE = 1 for some period,
    tb->VVACTIVE=1;
    tb->HVACTIVE=1;
    tb->VSTART=1;
    ticks = doNTicks(tb,trace,ticks,1);
    tb->VSTART=0;
    for (int a=0;a<512;a++)
    {
        SetHC(tb,a);
        if (a==1)
            tb->HD1 = 1;
        else 
            tb->HD1 = 0;
        ticks = doNTicks(tb,trace,ticks,1);
        ticks = doNTicks(tb,trace,ticks,10);
    }
	trace->close();

	exit(EXIT_SUCCESS);
}





