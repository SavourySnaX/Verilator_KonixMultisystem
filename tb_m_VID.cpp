#include <stdlib.h>
#include "Vm_VID.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void tick(Vm_VID *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XTALL=1;
    tb->CCLK = tb->ICCLK;
    trace->dump(ticks*10-2);
    tb->eval();
    trace->dump(ticks*10);
    tb->XTALL=0;
    tb->CCLK = tb->ICCLK;
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_VID *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

// A BUS (BI)
void SetA(Vm_VID *tb, uint32_t value)
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
void SetD(Vm_VID *tb, uint16_t value)
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

// PD BUS (BI) (palette data bus i think)
void SetPD(Vm_VID *tb, uint16_t value)
{
    tb->PD_0=value&1;
    tb->PD_1=(value>>1)&1;
    tb->PD_2=(value>>2)&1;
    tb->PD_3=(value>>3)&1;
    tb->PD_4=(value>>4)&1;
    tb->PD_5=(value>>5)&1;
    tb->PD_6=(value>>6)&1;
    tb->PD_7=(value>>7)&1;
    tb->PD_8=(value>>8)&1;
    tb->PD_9=(value>>9)&1;
    tb->PD_10=(value>>10)&1;
    tb->PD_11=(value>>11)&1;
    tb->PD_12=(value>>12)&1;
    tb->PD_13=(value>>13)&1;
    tb->PD_14=(value>>14)&1;
    tb->PD_15=(value>>15)&1;
}

uint8_t GetPA(Vm_VID *tb)
{
    uint8_t result=tb->PA_7;
    result<<=1; result|=tb->PA_6;
    result<<=1; result|=tb->PA_5;
    result<<=1; result|=tb->PA_4;
    result<<=1; result|=tb->PA_3;
    result<<=1; result|=tb->PA_2;
    result<<=1; result|=tb->PA_1;
    result<<=1; result|=tb->PA_0;

    return result;
}

// VADL BUS 
void SetVADL(Vm_VID *tb, uint8_t value)
{
    tb->VADL_0=value&1;
    tb->VADL_1=(value>>1)&1;
    tb->VADL_2=(value>>2)&1;
    tb->VADL_3=(value>>3)&1;
    tb->VADL_4=(value>>4)&1;
    tb->VADL_5=(value>>5)&1;
    tb->VADL_6=(value>>6)&1;
    tb->VADL_7=(value>>7)&1;
}

void SetVAL(Vm_VID *tb, uint8_t value)
{
    tb->VAL_8=value&1;
    tb->VAL_9=(value>>1)&1;
    tb->VAL_10=(value>>2)&1;
    tb->VAL_11=(value>>3)&1;
    tb->VAL_12=(value>>4)&1;
    tb->VAL_13=(value>>5)&1;
    tb->VAL_14=(value>>6)&1;
    tb->VAL_15=(value>>7)&1;
}

void SetVDL(Vm_VID *tb, uint8_t value)
{
    tb->VDL_8=value&1;
    tb->VDL_9=(value>>1)&1;
    tb->VDL_10=(value>>2)&1;
    tb->VDL_11=(value>>3)&1;
    tb->VDL_12=(value>>4)&1;
    tb->VDL_13=(value>>5)&1;
    tb->VDL_14=(value>>6)&1;
    tb->VDL_15=(value>>7)&1;
}

uint32_t GetSA(Vm_VID *tb)
{
    uint32_t result=tb->SA_17;
    result<<=1; result|=tb->SA_16;
    result<<=1; result|=tb->SA_15;
    result<<=1; result|=tb->SA_14;
    result<<=1; result|=tb->SA_13;
    result<<=1; result|=tb->SA_12;
    result<<=1; result|=tb->SA_11;
    result<<=1; result|=tb->SA_10;
    result<<=1; result|=tb->SA_9;
    result<<=1; result|=tb->SA_8;
    result<<=1; result|=tb->SA_7;
    result<<=1; result|=tb->SA_6;
    result<<=1; result|=tb->SA_5;
    result<<=1; result|=tb->SA_4;
    result<<=1; result|=tb->SA_3;
    result<<=1; result|=tb->SA_2;
    result<<=1; result|=tb->SA_1;
    result<<=1; result|=tb->SA_0;

    return result;
}


uint8_t RAM[256*1024];

void LoadRAM()
{
    FILE* myDump=fopen("/home/snax/Work/Slipstream/build/VRAM.BIN","rb");
    for(int a=0;a<256*1024;a++)
    {
        uint8_t byte;
        fread(&byte,1,1,myDump);
        RAM[a]=byte;
    }
    fclose(myDump);
}

uint8_t PAL[256*2];

void LoadPAL()
{

    FILE* myDump=fopen("/home/snax/Work/Slipstream/build/VRAM.BIN","rb");
    for(int a=0;a<256*2;a++)
    {
        uint8_t byte;
        fread(&byte,1,1,myDump);
        PAL[a]=byte;
    }
    fclose(myDump);
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

    LoadRAM();

	Vm_VID *tb = new Vm_VID;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;

    tb->VRD = 0;
    tb->VWR = 0;
    tb->VLOCK=0;
    tb->HLOCK=0;
    tb->PALL =0;    // PAL ?? 
    tb->PSRAML=1;
    tb->ASL_16 = tb->ASL_17 = tb->ASL_18 = tb->ASL_19 = 0;
    tb->IOML =1;
    tb->ALEL =1;
    tb->INTAL=1;
    tb->BMREQ=0;
    tb->DMREQ=0;
    tb->HLDAL=1;
    tb->AIL_0 = tb->AIL_1 = tb->AIL_2 = 0;
    tb->LP=0;
    tb->BHOLDL=0;
    tb->BWORD=0;
    tb->DWORD=0;
    tb->DRD = 0;
    tb->BWR = 0;
    tb->DWR = 0;

    // A <- Internal slipstream address bus
    // D <- Internal slipstream data bus
    // PA <- Palette Address for Palette RAM (256x16)   <- we can simulate this in theory - i need to dump the palette ram though :)
    // PD <- Palette Databus

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    for (int a=0;a<256*256*10;a++)
    {
        SetPD(tb,a);

        ticks = doNTicks(tb,trace,ticks,1);
    }
	trace->close();

	exit(EXIT_SUCCESS);
}
