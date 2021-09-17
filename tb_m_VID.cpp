#include <stdlib.h>
#include "Vm_VID.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

void SetA(Vm_VID *tb, uint32_t value);
void SetD(Vm_VID *tb, uint16_t value);
void SetVADL(Vm_VID *tb, uint8_t value);
void SetVAL(Vm_VID *tb, uint8_t value);
void SetVDL(Vm_VID *tb, uint8_t value);

void GlueAddressData(Vm_VID *tb)
{
    tb->inA_0  = tb->enA_0   ? tb->outA_0   : tb->inA_0  ;
    tb->inA_1  = tb->enA_1   ? tb->outA_1   : tb->inA_1  ;
    tb->inA_2  = tb->enA_2   ? tb->outA_2   : tb->inA_2  ;
    tb->inA_3  = tb->enA_3   ? tb->outA_3   : tb->inA_3  ;
    tb->inA_4  = tb->enA_4   ? tb->outA_4   : tb->inA_4  ;
    tb->inA_5  = tb->enA_5   ? tb->outA_5   : tb->inA_5  ;
    tb->inA_6  = tb->enA_6   ? tb->outA_6   : tb->inA_6  ;
    tb->inA_7  = tb->enA_7   ? tb->outA_7   : tb->inA_7  ;
    tb->inA_8  = tb->enA_8   ? tb->outA_8   : tb->inA_8  ;
    tb->inA_9  = tb->enA_9   ? tb->outA_9   : tb->inA_9  ;
    tb->inA_10 = tb->enA_10  ? tb->outA_10  : tb->inA_10 ;
    tb->inA_11 = tb->enA_11  ? tb->outA_11  : tb->inA_11 ;
    tb->inA_12 = tb->enA_12  ? tb->outA_12  : tb->inA_12 ;
    tb->inA_13 = tb->enA_13  ? tb->outA_13  : tb->inA_13 ;
    tb->inA_14 = tb->enA_14  ? tb->outA_14  : tb->inA_14 ;
    tb->inA_15 = tb->enA_15  ? tb->outA_15  : tb->inA_15 ;
    tb->inA_16 = tb->enA_16  ? tb->outA_16  : tb->inA_16 ;
    tb->inA_17 = tb->enA_17  ? tb->outA_17  : tb->inA_17 ;
    tb->inA_18 = tb->enA_18  ? tb->outA_18  : tb->inA_18 ;
    tb->inA_19 = tb->enA_19  ? tb->outA_19  : tb->inA_19 ;
    tb->inD_0  = tb->enD_0   ? tb->outD_0   : tb->inD_0  ;
    tb->inD_1  = tb->enD_1   ? tb->outD_1   : tb->inD_1  ;
    tb->inD_2  = tb->enD_2   ? tb->outD_2   : tb->inD_2  ;
    tb->inD_3  = tb->enD_3   ? tb->outD_3   : tb->inD_3  ;
    tb->inD_4  = tb->enD_4   ? tb->outD_4   : tb->inD_4  ;
    tb->inD_5  = tb->enD_5   ? tb->outD_5   : tb->inD_5  ;
    tb->inD_6  = tb->enD_6   ? tb->outD_6   : tb->inD_6  ;
    tb->inD_7  = tb->enD_7   ? tb->outD_7   : tb->inD_7  ;
    tb->inD_8  = tb->enD_8   ? tb->outD_8   : tb->inD_8  ;
    tb->inD_9  = tb->enD_9   ? tb->outD_9   : tb->inD_9  ;
    tb->inD_10 = tb->enD_10  ? tb->outD_10  : tb->inD_10 ;
    tb->inD_11 = tb->enD_11  ? tb->outD_11  : tb->inD_11 ;
    tb->inD_12 = tb->enD_12  ? tb->outD_12  : tb->inD_12 ;
    tb->inD_13 = tb->enD_13  ? tb->outD_13  : tb->inD_13 ;
    tb->inD_14 = tb->enD_14  ? tb->outD_14  : tb->inD_14 ;
    tb->inD_15 = tb->enD_15  ? tb->outD_15  : tb->inD_15 ;

    tb->VADL_0  = tb->ADEN ? ~(tb->VAD_0 ) : ~(tb->inA_0 );
    tb->VADL_1  = tb->ADEN ? ~(tb->VAD_1 ) : ~(tb->inA_1 );
    tb->VADL_2  = tb->ADEN ? ~(tb->VAD_2 ) : ~(tb->inA_2 );
    tb->VADL_3  = tb->ADEN ? ~(tb->VAD_3 ) : ~(tb->inA_3 );
    tb->VADL_4  = tb->ADEN ? ~(tb->VAD_4 ) : ~(tb->inA_4 );
    tb->VADL_5  = tb->ADEN ? ~(tb->VAD_5 ) : ~(tb->inA_5 );
    tb->VADL_6  = tb->ADEN ? ~(tb->VAD_6 ) : ~(tb->inA_6 );
    tb->VADL_7  = tb->ADEN ? ~(tb->VAD_7 ) : ~(tb->inA_7 );

    tb->VAL_8  = tb->AEN ? ~(tb->VA_8 ) : ~(tb->inA_8 );
    tb->VAL_9  = tb->AEN ? ~(tb->VA_9 ) : ~(tb->inA_9 );
    tb->VAL_10 = tb->AEN ? ~(tb->VA_10) : ~(tb->inA_10);
    tb->VAL_11 = tb->AEN ? ~(tb->VA_11) : ~(tb->inA_11);
    tb->VAL_12 = tb->AEN ? ~(tb->VA_12) : ~(tb->inA_12);
    tb->VAL_13 = tb->AEN ? ~(tb->VA_13) : ~(tb->inA_13);
    tb->VAL_14 = tb->AEN ? ~(tb->VA_14) : ~(tb->inA_14);
    tb->VAL_15 = tb->AEN ? ~(tb->VA_15) : ~(tb->inA_15);

    tb->VDL_8  = tb->DEN ? ~(tb->VD_8 ) : ~(tb->inD_8 );
    tb->VDL_9  = tb->DEN ? ~(tb->VD_9 ) : ~(tb->inD_9 );
    tb->VDL_10 = tb->DEN ? ~(tb->VD_10) : ~(tb->inD_10);
    tb->VDL_11 = tb->DEN ? ~(tb->VD_11) : ~(tb->inD_11);
    tb->VDL_12 = tb->DEN ? ~(tb->VD_12) : ~(tb->inD_12);
    tb->VDL_13 = tb->DEN ? ~(tb->VD_13) : ~(tb->inD_13);
    tb->VDL_14 = tb->DEN ? ~(tb->VD_14) : ~(tb->inD_14);
    tb->VDL_15 = tb->DEN ? ~(tb->VD_15) : ~(tb->inD_15);


    tb->HLDAL=tb->HOLDL;

}

void tick(Vm_VID *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XTALL=1;
    tb->CCLK = tb->ICCLK;
    trace->dump(ticks*10-2);
    GlueAddressData(tb);
    tb->eval();
    GlueAddressData(tb);
    trace->dump(ticks*10);
    tb->XTALL=0;
    tb->CCLK = tb->ICCLK;
    GlueAddressData(tb);
    tb->eval();
    GlueAddressData(tb);
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

int CPU_WriteHardwareRegister(Vm_VID *tb, VerilatedVcdC* trace, int ticks, uint32_t address, uint8_t value)
{
    // bottoms bits of address/data are multiplexed ALE indicates Address (T1)
    //                                              DEN indicates DATA    (T2-T4)

    tb->IOML=0;
    tb->ALEL=0;
    SetVADL(tb, ~address);
    SetVAL(tb, ~(address>>8));
    SetVDL(tb, ~(value>>8));        // Only important for 16 bit memory accesses
    tick(tb,trace,ticks+0);
    tick(tb,trace,ticks+1);
    tick(tb,trace,ticks+2);
    tb->ALEL=1;
    tb->VWR=1;
    SetVADL(tb, ~value);
    tick(tb,trace,ticks+3);
    tick(tb,trace,ticks+4);
    tick(tb,trace,ticks+5);
    tb->VWR=0;
    tick(tb,trace,ticks+6);
    tb->IOML=1;
    tick(tb,trace,ticks+7);
    tick(tb,trace,ticks+8);
    tick(tb,trace,ticks+9);
    return ticks+10;
}

// A BUS (BI)
void SetA(Vm_VID *tb, uint32_t value)
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
void SetD(Vm_VID *tb, uint16_t value)
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

// PD BUS (BI) (palette data bus i think)
void SetPD(Vm_VID *tb, uint16_t value)
{
    tb->inPD_0=value&1;
    tb->inPD_1=(value>>1)&1;
    tb->inPD_2=(value>>2)&1;
    tb->inPD_3=(value>>3)&1;
    tb->inPD_4=(value>>4)&1;
    tb->inPD_5=(value>>5)&1;
    tb->inPD_6=(value>>6)&1;
    tb->inPD_7=(value>>7)&1;
    tb->inPD_8=(value>>8)&1;
    tb->inPD_9=(value>>9)&1;
    tb->inPD_10=(value>>10)&1;
    tb->inPD_11=(value>>11)&1;
    tb->inPD_12=(value>>12)&1;
    tb->inPD_13=(value>>13)&1;
    tb->inPD_14=(value>>14)&1;
    tb->inPD_15=(value>>15)&1;
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

uint32_t GetVA(Vm_VID *tb)
{
    uint32_t result=(~tb->VAL_17)&1;
    result<<=1; result|=(~tb->VAL_16)&1;
    result<<=1; result|=tb->VA_15;
    result<<=1; result|=tb->VA_14;
    result<<=1; result|=tb->VA_13;
    result<<=1; result|=tb->VA_12;
    result<<=1; result|=tb->VA_11;
    result<<=1; result|=tb->VA_10;
    result<<=1; result|=tb->VA_9;
    result<<=1; result|=tb->VA_8;
    result<<=1; result|=(~tb->VAL_7)&1;
    result<<=1; result|=(~tb->VAL_6)&1;
    result<<=1; result|=(~tb->VAL_5)&1;
    result<<=1; result|=(~tb->VAL_4)&1;
    result<<=1; result|=(~tb->VAL_3)&1;
    result<<=1; result|=(~tb->VAL_2)&1;
    result<<=1; result|=(~tb->VAL_1)&1;
    result<<=1; result|=(~tb->VAL_0)&1;

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
    LoadPAL();

	Vm_VID *tb = new Vm_VID;

	VerilatedVcdC *trace = new VerilatedVcdC;

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL_0=0;

    tb->VRD = 0;
    tb->VWR = 0;
    tb->VLOCK=0;
    tb->HLOCK=0;
    tb->PALL =0;
    tb->PSRAML=0;       // screen is psuedo static ram???
    tb->ASL_16 = tb->ASL_17 = tb->ASL_18 = tb->ASL_19 = 1;
    tb->IOML =1;
    tb->ALEL =1;
    tb->INTAL=1;
    tb->BMREQ=0;
    tb->DMREQ=0;
    tb->HLDAL=1;
    tb->AIL_0 = tb->AIL_1 = tb->AIL_2 = 1;
    tb->LP=0;
    tb->BHOLDL=1;
    tb->BWORD=0;
    tb->DWORD=0;
    tb->FASTL=1;
    tb->BRD = 0;
    tb->DRD = 0;
    tb->BWR = 0;
    tb->DWR = 0;

    // Going to need to glue a bunch of signals (see SS.NET)
    //
    // BDxTNR   = Bidirect Output Buffer (inverted TTL max slew)
    //
    //              (io, zi, po) = (io, a, en, tn, pi)

    // io = a IF (~en)&tn , else Z

    // zi = io
    // 

    // err - so 
    //      AD_0_(XAD_0, VADL_0, TESTI_26) = &BD4TNR (XAD_0, VAD_0, DDIS, ADEN, TESTI_25);
    //
    //  XAD_0 = XAD_0
    //  VADL_0 = (~DDIS)&en ? ~VAD_0 : XAD_0            // DDIS is for test logic, so should be 0 so
    //  VADL_0 = ADEN ? ~VAD_0 : XAD_0

    // A <- Internal slipstream address bus (shared between DSP/BLITTER and VIDEO)
    // D <- Internal slipstream data bus (shared between DSP/BLITTER and VIDEO)
    // VADL (processor multiplexed address/data 8 bits - inverted)
    // VAL  (processor upper address bits)
    // VAD  (processor upper data bits)
    // PA <- Palette Address for Palette RAM (256x16)   <- we can simulate this in theory - i need to dump the palette ram though :)
    // PD <- Palette Databus

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;
    ticks = doNTicks(tb,trace,ticks,10);

    tb->RESETL_0=1;
    ticks = doNTicks(tb,trace,ticks,10);

    // Lets write to some video registers to get things correctly up and running
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x0D, 0xEB);    // BORDERL  // D3B     reD grEen Blue
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x0E, 0x0D);    // BORDERH
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x02, 60);      // STARTL
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x03, 0);       // STARTH
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x11, 0x03);    // ENDL
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x12, 0x01);    // ENDH
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x13, 0x01);    // MEM
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x0C, 0x01);    // MODE
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x0F, 0x00);    // CMASK
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x10, 0x00);    // PINDEX
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x08, 0x00);    // SCROLLL
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x09, 0x01);    // SCROLLM
    ticks = CPU_WriteHardwareRegister(tb, trace, ticks, 0x0A, 0x00);    // SCROLLH

    for (int a=0;a<256*256*10;a++)
    {
        int address = GetPA(tb);
        uint16_t word = PAL[address*2+1];
        word<<=8;
        word|=PAL[address*2+0];
        //printf("Setting PD with Palette %04X from address %02X", word, address);
        SetPD(tb,word);

        if (tb->OE)
        {
            //printf("OE %08X\n",GetVA(tb));
            if (GetVA(tb)>=0x100 && GetVA(tb)<=(0x100 + 256*200))
            {
                //printf("Video Access : %02X\n", RAM[GetVA(tb)]);
                uint16_t pixels=RAM[GetVA(tb)+0];
                pixels<<=8;
                pixels|=RAM[GetVA(tb)+0];
                SetD(tb,pixels);
            }
        }

        ticks = doNTicks(tb,trace,ticks,1);
    }
	trace->close();

	exit(EXIT_SUCCESS);
}
