#include <stdlib.h>
#include "Vm_DSP.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

uint16_t PRAM[256];
uint16_t DRAM[128];
uint16_t ROM[256];      // sine table from SINTAB.ROM

int drvD=0, drvA=0, drvDD=0, drvPD=0;

void UnSetA(Vm_DSP *tb)
{
    drvA=0;
}
void UnSetD(Vm_DSP *tb)
{
    drvD=0;
}
void UnSetDD(Vm_DSP *tb)
{
    drvDD=0;
}
void UnSetPD(Vm_DSP *tb)
{
    drvPD=0;
}

uint8_t GetDA(Vm_DSP *tb)
{
    uint8_t value = 0;
    value |= tb->DA_7; value <<= 1;
    value |= tb->DA_6; value <<= 1;
    value |= tb->DA_5; value <<= 1;
    value |= tb->DA_4; value <<= 1;
    value |= tb->DA_3; value <<= 1;
    value |= tb->DA_2; value <<= 1;
    value |= tb->DA_1; value <<= 1;
    value |= tb->DA_0;

    return value;
}

uint8_t GetPC(Vm_DSP *tb)
{
    uint8_t value = 0;
    value |= tb->PC_7; value <<= 1;
    value |= tb->PC_6; value <<= 1;
    value |= tb->PC_5; value <<= 1;
    value |= tb->PC_4; value <<= 1;
    value |= tb->PC_3; value <<= 1;
    value |= tb->PC_2; value <<= 1;
    value |= tb->PC_1; value <<= 1;
    value |= tb->PC_0;

    return value;
}

uint16_t GetPD(Vm_DSP *tb)
{
    uint16_t value = 0;
    value <<= 1; value |= (tb->outPD_15 & 1);
    value <<= 1; value |= (tb->outPD_14 & 1);
    value <<= 1; value |= (tb->outPD_13 & 1);
    value <<= 1; value |= (tb->outPD_12 & 1);
    value <<= 1; value |= (tb->outPD_11 & 1);
    value <<= 1; value |= (tb->outPD_10 & 1);
    value <<= 1; value |= (tb->outPD_9 & 1);
    value <<= 1; value |= (tb->outPD_8 & 1);
    value <<= 1; value |= (tb->outPD_7 & 1);
    value <<= 1; value |= (tb->outPD_6 & 1);
    value <<= 1; value |= (tb->outPD_5 & 1);
    value <<= 1; value |= (tb->outPD_4 & 1);
    value <<= 1; value |= (tb->outPD_3 & 1);
    value <<= 1; value |= (tb->outPD_2 & 1);
    value <<= 1; value |= (tb->outPD_1 & 1);
    value <<= 1; value |= (tb->outPD_0 & 1);

    if (tb->enPD_0!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_1!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_2!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_3!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_4!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_5!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_6!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_7!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_8!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_9!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_10!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_11!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_12!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_13!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_14!=1) {printf("PD read when floating!!\n"); exit(-1);}
    if (tb->enPD_15!=1) {printf("PD read when floating!!\n"); exit(-1);}

    return value;
}

uint16_t GetDD(Vm_DSP *tb)
{
    uint16_t value = 0;
    value <<= 1; value |= (tb->outDD_15 & 1);
    value <<= 1; value |= (tb->outDD_14 & 1);
    value <<= 1; value |= (tb->outDD_13 & 1);
    value <<= 1; value |= (tb->outDD_12 & 1);
    value <<= 1; value |= (tb->outDD_11 & 1);
    value <<= 1; value |= (tb->outDD_10 & 1);
    value <<= 1; value |= (tb->outDD_9 & 1);
    value <<= 1; value |= (tb->outDD_8 & 1);
    value <<= 1; value |= (tb->outDD_7 & 1);
    value <<= 1; value |= (tb->outDD_6 & 1);
    value <<= 1; value |= (tb->outDD_5 & 1);
    value <<= 1; value |= (tb->outDD_4 & 1);
    value <<= 1; value |= (tb->outDD_3 & 1);
    value <<= 1; value |= (tb->outDD_2 & 1);
    value <<= 1; value |= (tb->outDD_1 & 1);
    value <<= 1; value |= (tb->outDD_0 & 1);

    if (tb->enDD_0!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_1!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_2!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_3!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_4!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_5!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_6!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_7!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_8!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_9!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_10!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_11!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_12!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_13!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_14!=1) {printf("DD read when floating!!\n"); exit(-1);}
    if (tb->enDD_15!=1) {printf("DD read when floating!!\n"); exit(-1);}
    
    return value;
}

void SetPD(Vm_DSP *tb, uint16_t value)
{
    drvPD=1;
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
    drvDD=1;
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

void CheckRamRom(Vm_DSP *tb)
{
    UnSetDD(tb);
    UnSetPD(tb);
    if (tb->ROMEN)
    {
        SetDD(tb, ROM[GetDA(tb)]);
    }
    if (tb->PRAMEN)
    {
        SetPD(tb, PRAM[GetPC(tb)]);
    }
    if (tb->DRAMEN)
    {
        SetDD(tb, DRAM[GetDA(tb)&0x7F]);
    }
    if (tb->PRAMWR)
    {
        PRAM[GetPC(tb)]=GetPD(tb);
    }
    if (tb->DRAMWR)
    {
        DRAM[GetDA(tb)&0x7F]=GetDD(tb);
        printf("DRAM WRITE : %02X : %04X\n", GetDA(tb)&0x7F, GetDD(tb));
    }

    if (1&(drvA & (tb->enA_0 | tb->enA_1 | tb->enA_2 | tb->enA_3 | tb->enA_4 | tb->enA_5 | tb->enA_6 | tb->enA_7 | tb->enA_8 | tb->enA_9 | tb->enA_10 | tb->enA_11 | tb->enA_12 | tb->enA_13 | tb->enA_14 | tb->enA_15 | tb->enA_16 | tb->enA_17 | tb->enA_18 | tb->enA_19)))
    {
        printf("Bus Error on A, being driven from both sides");
        exit(1);
    }
    if (1&(drvD & (tb->enD_0 | tb->enD_1 | tb->enD_2 | tb->enD_3 | tb->enD_4 | tb->enD_5 | tb->enD_6 | tb->enD_7 | tb->enD_8 | tb->enD_9 | tb->enD_10 | tb->enD_11 | tb->enD_12 | tb->enD_13 | tb->enD_14 | tb->enD_15)))
    {
        printf("Bus Error on D, being driven from both sides");
        exit(1);
    }
    if (1&(drvDD & (tb->enDD_0 | tb->enDD_1 | tb->enDD_2 | tb->enDD_3 | tb->enDD_4 | tb->enDD_5 | tb->enDD_6 | tb->enDD_7 | tb->enDD_8 | tb->enDD_9 | tb->enDD_10 | tb->enDD_11 | tb->enDD_12 | tb->enDD_13 | tb->enDD_14 | tb->enDD_15)))
    {
        printf("Bus Error on DD, being driven from both sides");
        exit(1);
    }
    if (1&(drvPD & (tb->enPD_0 | tb->enPD_1 | tb->enPD_2 | tb->enPD_3 | tb->enPD_4 | tb->enPD_5 | tb->enPD_6 | tb->enPD_7 | tb->enPD_8 | tb->enPD_9 | tb->enPD_10 | tb->enPD_11 | tb->enPD_12 | tb->enPD_13 | tb->enPD_14 | tb->enPD_15)))
    {
        printf("Bus Error on PD, being driven from both sides");
        exit(1);
    }

    if (!drvA)
    {
        tb->inA_0  = tb->outA_0  & tb->enA_0 ;
        tb->inA_1  = tb->outA_1  & tb->enA_1 ;
        tb->inA_2  = tb->outA_2  & tb->enA_2 ;
        tb->inA_3  = tb->outA_3  & tb->enA_3 ;
        tb->inA_4  = tb->outA_4  & tb->enA_4 ;
        tb->inA_5  = tb->outA_5  & tb->enA_5 ;
        tb->inA_6  = tb->outA_6  & tb->enA_6 ;
        tb->inA_7  = tb->outA_7  & tb->enA_7 ;
        tb->inA_8  = tb->outA_8  & tb->enA_8 ;
        tb->inA_9  = tb->outA_9  & tb->enA_9 ;
        tb->inA_10 = tb->outA_10 & tb->enA_10;
        tb->inA_11 = tb->outA_11 & tb->enA_11;
        tb->inA_12 = tb->outA_12 & tb->enA_12;
        tb->inA_13 = tb->outA_13 & tb->enA_13;
        tb->inA_14 = tb->outA_14 & tb->enA_14;
        tb->inA_15 = tb->outA_15 & tb->enA_15;
        tb->inA_16 = tb->outA_16 & tb->enA_16;
        tb->inA_17 = tb->outA_17 & tb->enA_17;
        tb->inA_18 = tb->outA_18 & tb->enA_18;
        tb->inA_19 = tb->outA_19 & tb->enA_19;
    }
    if (!drvD)
    {
        tb->inD_0  = tb->outD_0  & tb->enD_0 ;
        tb->inD_1  = tb->outD_1  & tb->enD_1 ;
        tb->inD_2  = tb->outD_2  & tb->enD_2 ;
        tb->inD_3  = tb->outD_3  & tb->enD_3 ;
        tb->inD_4  = tb->outD_4  & tb->enD_4 ;
        tb->inD_5  = tb->outD_5  & tb->enD_5 ;
        tb->inD_6  = tb->outD_6  & tb->enD_6 ;
        tb->inD_7  = tb->outD_7  & tb->enD_7 ;
        tb->inD_8  = tb->outD_8  & tb->enD_8 ;
        tb->inD_9  = tb->outD_9  & tb->enD_9 ;
        tb->inD_10 = tb->outD_10 & tb->enD_10;
        tb->inD_11 = tb->outD_11 & tb->enD_11;
        tb->inD_12 = tb->outD_12 & tb->enD_12;
        tb->inD_13 = tb->outD_13 & tb->enD_13;
        tb->inD_14 = tb->outD_14 & tb->enD_14;
        tb->inD_15 = tb->outD_15 & tb->enD_15;
    }
    if (!drvDD)
    {
        tb->inDD_0  = tb->outDD_0  & tb->enDD_0 ;
        tb->inDD_1  = tb->outDD_1  & tb->enDD_1 ;
        tb->inDD_2  = tb->outDD_2  & tb->enDD_2 ;
        tb->inDD_3  = tb->outDD_3  & tb->enDD_3 ;
        tb->inDD_4  = tb->outDD_4  & tb->enDD_4 ;
        tb->inDD_5  = tb->outDD_5  & tb->enDD_5 ;
        tb->inDD_6  = tb->outDD_6  & tb->enDD_6 ;
        tb->inDD_7  = tb->outDD_7  & tb->enDD_7 ;
        tb->inDD_8  = tb->outDD_8  & tb->enDD_8 ;
        tb->inDD_9  = tb->outDD_9  & tb->enDD_9 ;
        tb->inDD_10 = tb->outDD_10 & tb->enDD_10;
        tb->inDD_11 = tb->outDD_11 & tb->enDD_11;
        tb->inDD_12 = tb->outDD_12 & tb->enDD_12;
        tb->inDD_13 = tb->outDD_13 & tb->enDD_13;
        tb->inDD_14 = tb->outDD_14 & tb->enDD_14;
        tb->inDD_15 = tb->outDD_15 & tb->enDD_15;
    }
    if (!drvPD)
    {
        tb->inPD_0  = tb->outPD_0  & tb->enPD_0 ;
        tb->inPD_1  = tb->outPD_1  & tb->enPD_1 ;
        tb->inPD_2  = tb->outPD_2  & tb->enPD_2 ;
        tb->inPD_3  = tb->outPD_3  & tb->enPD_3 ;
        tb->inPD_4  = tb->outPD_4  & tb->enPD_4 ;
        tb->inPD_5  = tb->outPD_5  & tb->enPD_5 ;
        tb->inPD_6  = tb->outPD_6  & tb->enPD_6 ;
        tb->inPD_7  = tb->outPD_7  & tb->enPD_7 ;
        tb->inPD_8  = tb->outPD_8  & tb->enPD_8 ;
        tb->inPD_9  = tb->outPD_9  & tb->enPD_9 ;
        tb->inPD_10 = tb->outPD_10 & tb->enPD_10;
        tb->inPD_11 = tb->outPD_11 & tb->enPD_11;
        tb->inPD_12 = tb->outPD_12 & tb->enPD_12;
        tb->inPD_13 = tb->outPD_13 & tb->enPD_13;
        tb->inPD_14 = tb->outPD_14 & tb->enPD_14;
        tb->inPD_15 = tb->outPD_15 & tb->enPD_15;
    }

    int AL11 = (~tb->inA_11)&1;
    int AL12 = (~tb->inA_12)&1;
    int AL18 = (~tb->inA_18)&1;
    int D0 = (~(AL12 | tb->inA_13 | tb->inA_14 | tb->inA_15 | tb->inA_16 | tb->inA_17 | AL18 | tb->inA_19))&1;
    tb->DCSL = ~(D0 & tb->IOML & AL11);

}

void tick(Vm_DSP *tb, VerilatedVcdC* trace, int ticks)
{
    tb->CCLK=1;
    tb->DQCLK=1;
    trace->dump(ticks*10-2);
    tb->eval();
    CheckRamRom(tb);
    trace->dump(ticks*10);
    tb->CCLK=0;
    tb->eval();
    CheckRamRom(tb);
    trace->dump(ticks*10+2);
    tb->DQCLK=0;
    tb->eval();
    CheckRamRom(tb);
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

void SetD(Vm_DSP *tb, uint8_t value)
{
    drvD=1;
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
    drvA=1;
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

void initRomRam()
{
    char bits[24];
    FILE* sin = fopen("/home/snax/fpga/OLDDIRS/SS/SINTAB.ROM","r");

    for (int a=0;a<256;a++)
    {
        fscanf(sin, "%s\n", bits);
        uint16_t romWord = 0;
        for (int b=8;b<24;b++)
        {
            romWord<<=1;
            romWord|=bits[b]-'0';
        }

        ROM[a]=romWord;
        PRAM[a]=0;
        DRAM[a/2]=0;
    }
}

const char* DSP_TranslateInstruction(uint16_t addr,uint16_t pWord)
{
    static char staticBuffer[65536];
	uint16_t pAddr=(pWord&0x1FF);		// bottom 9 bits 
	uint16_t pOpcode=(pWord&0xF800)>>11;		// top 5 bits?
	uint8_t isConditional=(pWord&0x0400)>>10;
	uint8_t isIndexed=(pWord&0x0200)>>9;

	// Quick test

	switch (pOpcode)
	{
		case 0:
			sprintf(staticBuffer, "%s MOV (%04X%s),MZ0\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 1:
			sprintf(staticBuffer, "%s MOV (%04X%s),MZ1\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 2:
			sprintf(staticBuffer, "%s MOV MZ0,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 3:
			sprintf(staticBuffer, "%s MOV MZ1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 4:
			sprintf(staticBuffer, "%s CCF\n",isConditional?"IF C THEN":"");
			break;
		case 5:
			sprintf(staticBuffer, "%s MOV DMA0,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 6:
			sprintf(staticBuffer, "%s MOV DMA1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 7:
			sprintf(staticBuffer, "%s MOV DMD,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 8:
			sprintf(staticBuffer, "%s MOV (%04X%s),DMD\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 9:
			sprintf(staticBuffer, "%s MAC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 10:
			sprintf(staticBuffer, "%s MOV MODE,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 11:
			sprintf(staticBuffer, "%s MOV IX,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 12:
			sprintf(staticBuffer, "%s MOV (%04X%s),PC\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 13:
			sprintf(staticBuffer, "%s MOV X,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 14:
			sprintf(staticBuffer, "%s MOV (%04X%s),X\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 15:
			sprintf(staticBuffer, "%s MULT (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 16:
			sprintf(staticBuffer, "%s ADD (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 17:
			sprintf(staticBuffer, "%s SUB (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 18:
			sprintf(staticBuffer, "%s AND (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 19:
			sprintf(staticBuffer, "%s OR (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 20:
			sprintf(staticBuffer, "%s ADC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 21:
			sprintf(staticBuffer, "%s SBC (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 22:
			sprintf(staticBuffer, "%s MOV (%04X%s),AZ\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 23:
			sprintf(staticBuffer, "%s MOV AZ,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 24:
			sprintf(staticBuffer, "%s MOV (%04X%s),Z2\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 25:
			sprintf(staticBuffer, "%s MOV DAC1,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 26:
			sprintf(staticBuffer, "%s MOV DAC2,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 27:
			sprintf(staticBuffer, "%s MOV DAC12,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 28:
			sprintf(staticBuffer, "%s GAI (%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 29:
			sprintf(staticBuffer, "%s MOV PC,(%04X%s)\n",isConditional?"IF C THEN":"",pAddr,isIndexed?"+IX":"");
			break;
		case 30:
			sprintf(staticBuffer, "%s NOP\n",isConditional?"IF C THEN":"");
			break;
		case 31:
			sprintf(staticBuffer, "%s INTRUDE\n",isConditional?"IF C THEN":"");
			break;
	}

    return staticBuffer;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_DSP *tb = new Vm_DSP;

	VerilatedVcdC *trace = new VerilatedVcdC;

    initRomRam();

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    tb->RESETL=0;
    tb->DSPBAKL=1;
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

    // Lets run the first frame of a dump from the emulator (dsp writes)
    FILE* dsp = fopen("/home/snax/DSP_SEQUENCE.TXT", "r");

    uint32_t frameNum, address, data;
    char readOrWrite;

    while(true)
    {
        fscanf(dsp, "%c%08X,%08X,%02X\n", &readOrWrite, &frameNum, &address, &data);
        uint8_t d = (uint8_t)data;

        printf("%c - %08X %08X %02X\n", readOrWrite, frameNum, address, d);
        if (frameNum!=0)
            break;

        if (address == 0x41600 && d==0x10)
            break;

        SetA(tb, address);
        if (readOrWrite=='W')
        {
            SetD(tb, d);
            tb->DWE=1;
        }
        else
            tb->RDL=0;
    
        ticks = doNTicks(tb,trace,ticks,20);
        tb->DWE=0;
        tb->RDL=1;
        UnSetA(tb);
        UnSetD(tb);
        ticks = doNTicks(tb,trace,ticks,20);
    }
    
    // Do a video frame worth of time
    //ticks = doNTicks(tb, trace, ticks, 757 * 312);

	trace->close();

    printf("PRAM\n");
    for (int a=0;a<256;a++)
    {
        printf("%08X : %04X : %s\n", a, PRAM[a], DSP_TranslateInstruction(a, PRAM[a]));
    }

    printf("DRAM\n");
    for (int a=0;a<128;a++)
    {
        printf("%08X : %04X\n", a, DRAM[a]);
    }

	exit(EXIT_SUCCESS);
}












