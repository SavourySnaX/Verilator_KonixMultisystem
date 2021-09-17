#include <stdlib.h>
#include "Vm_BLIT.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

uint32_t GetA(Vm_BLIT *tb);
void SetD(Vm_BLIT *tb, uint16_t value);

uint8_t blitterProgram[13]=
    {
        0x33,           // SRC Address Low Byte
        0x33,           // SRC Address Mid Byte
        0x03,           // SRC Address Hi Nibble and Flags Nibble (top 4 bits)
        0x44,           // DST Address Low Byte
        0x44,           // DST Address Mid Byte
        0x04,           // DST Address Hi Nibble and Flags Nibble (top 4 bits)
        0x20,           // MODE (PATSEL | RES1 | RES0 | YFRAC | LINDR | CMPBIT | ILCNT8 | STEP-1)  (8bits per pixel mode)
        0xC0,           // COMP (LFU3 | LFU2 | LFU1 | LFU0 | CMPPLN | CMPGT | CMPNE | CMPEQ)
        0x01,           // OUTERCNT
        0x01,           // INNERCNT
        0x00,           // INNERSTEP
        0x55,           // INNERPAT
        0x00            // next command, in this case stop
    };


void emulateBus(Vm_BLIT *tb)
{
    if (tb->CCLK==0)
        tb->HLDAL = tb->BHOLDL; // really this would transition slower i expect - for now transition on falling edge

    if (tb->BMREQ)  // Memory request from blitter
    {
        if (tb->BRD)
        {
            int address=GetA(tb);
            int bltAddress = address - 0x12345;
            if (bltAddress >= 0 && bltAddress < 13)
            {
                uint8_t blitprogram = blitterProgram[bltAddress];
                SetD(tb,blitprogram);       // instant request for now...
                printf("Setting D to %08X, from %08X\n",blitprogram, address);
            }
        }
    }

}

void tick(Vm_BLIT *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CCLK = 1;
    trace->dump(ticks*10-2);
    tb->eval();
    emulateBus(tb);
    trace->dump(ticks*10);
    tb->CCLK = 0;
    tb->eval();
    emulateBus(tb);
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
    tb->inA_0=value&1;
    tb->inA_1=(value>>1)&1;
    tb->inA_2=(value>>2)&1;
    tb->inA_3=(value>>3)&1;
    tb->inA_4=(value>>4)&1;
    tb->inA_5=(value>>5)&1;
    tb->inA_6=(value>>6)&1;
    tb->inA_7=(value>>7)&1;
    tb->inA_8=(value>>8)&1;
    tb->inA_9=(value>>9)&1;
    tb->inA_10=(value>>10)&1;
    tb->inA_11=(value>>11)&1;
    tb->inA_12=(value>>12)&1;
    tb->inA_13=(value>>13)&1;
    tb->inA_14=(value>>14)&1;
    tb->inA_15=(value>>15)&1;
    tb->inA_16=(value>>16)&1;
    tb->inA_17=(value>>17)&1;
    tb->inA_18=(value>>18)&1;
    tb->inA_19=(value>>19)&1;
}

// D BUS (BI)
void SetD(Vm_BLIT *tb, uint16_t value)
{
    tb->inD_0=value&1;
    tb->inD_1=(value>>1)&1;
    tb->inD_2=(value>>2)&1;
    tb->inD_3=(value>>3)&1;
    tb->inD_4=(value>>4)&1;
    tb->inD_5=(value>>5)&1;
    tb->inD_6=(value>>6)&1;
    tb->inD_7=(value>>7)&1;
    tb->inD_8=(value>>8)&1;
    tb->inD_9=(value>>9)&1;
    tb->inD_10=(value>>10)&1;
    tb->inD_11=(value>>11)&1;
    tb->inD_12=(value>>12)&1;
    tb->inD_13=(value>>13)&1;
    tb->inD_14=(value>>14)&1;
    tb->inD_15=(value>>15)&1;
}

uint32_t GetA(Vm_BLIT *tb)
{
    uint32_t result=tb->outA_19;
    result<<=1; result|=tb->outA_18;
    result<<=1; result|=tb->outA_17;
    result<<=1; result|=tb->outA_16;
    result<<=1; result|=tb->outA_15;
    result<<=1; result|=tb->outA_14;
    result<<=1; result|=tb->outA_13;
    result<<=1; result|=tb->outA_12;
    result<<=1; result|=tb->outA_11;
    result<<=1; result|=tb->outA_10;
    result<<=1; result|=tb->outA_9;
    result<<=1; result|=tb->outA_8;
    result<<=1; result|=tb->outA_7;
    result<<=1; result|=tb->outA_6;
    result<<=1; result|=tb->outA_5;
    result<<=1; result|=tb->outA_4;
    result<<=1; result|=tb->outA_3;
    result<<=1; result|=tb->outA_2;
    result<<=1; result|=tb->outA_1;
    result<<=1; result|=tb->outA_0;

    // Check the bus is actually being driven
    int drivenA = tb->enA_0 & tb->enA_1 & tb->enA_2 & tb->enA_3;
    int drivenB = tb->enA_4 & tb->enA_5 & tb->enA_6 & tb->enA_7;
    int drivenC = tb->enA_8 & tb->enA_9 & tb->enA_10 & tb->enA_11;
    int drivenD = tb->enA_12 & tb->enA_13 & tb->enA_14 & tb->enA_15;
    int drivenE = tb->enA_16 & tb->enA_17 & tb->enA_18 & tb->enA_19;

    if ((drivenA & drivenB & drivenC & drivenD & drivenE)==0)
    {
        printf("Request for A but bus is not being driven!\n");
    }

    return result;
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


    // Setup a blit
    SetA(tb, 0x30);
    SetD(tb, 0x45);     // Blitter program @ 0x12345
    tb->IOWRL=0;
    ticks = doNTicks(tb,trace,ticks,1);
    tb->IOWRL=1;
    ticks = doNTicks(tb,trace,ticks,9);
    SetA(tb, 0x31);
    SetD(tb, 0x23);     // Blitter program @ 0x12345
    tb->IOWRL=0;
    ticks = doNTicks(tb,trace,ticks,1);
    tb->IOWRL=1;
    ticks = doNTicks(tb,trace,ticks,9);
    SetA(tb, 0x32);
    SetD(tb, 0x01);     // Blitter program @ 0x12345
    tb->IOWRL=0;
    ticks = doNTicks(tb,trace,ticks,1);
    tb->IOWRL=1;
    ticks = doNTicks(tb,trace,ticks,9);

    // Send Blitter command

    // SRCENF | DSTEN | SRCEN | DSTUP | SRCUP | PARRD | COLST | RUN

    SetA(tb, 0x33);
    SetD(tb, 0x01);     // RUN 
    tb->IOWRL=0;
    ticks = doNTicks(tb,trace,ticks,1);
    tb->IOWRL=1;
    ticks = doNTicks(tb,trace,ticks,9);

    for (int a=0;a<50;a++)
    {
        ticks = doNTicks(tb,trace,ticks,10);
    }

	trace->close();

	exit(EXIT_SUCCESS);
}

