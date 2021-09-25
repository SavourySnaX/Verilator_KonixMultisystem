#include <stdlib.h>
#include "Vm_SS.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

int lastPCLK = 2;

int hold=0;
int tState=0;
int nextT1Write=0;
int writeState=0;
int writeIO=0;
uint32_t writeAddress=0;
uint8_t writeValue=0;

void SetXAD(Vm_SS *tb, uint8_t value);
void SetXA(Vm_SS *tb, uint8_t value);
void SetXD(Vm_SS *tb, uint8_t value);
void SetJOY(Vm_SS *tb, uint8_t value);
void SetXAS(Vm_SS *tb, uint8_t value);
void SetXAI(Vm_SS *tb, uint8_t value);

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


// Ideal cpu...
void TickRisingCpu(Vm_SS* tb)
{
    if ((hold == 1) || (tb->XRESET == 1))
        return;

    switch (tState)
    {
        case 0: // T1
            if (nextT1Write)
            {
                nextT1Write=0;
                writeState=1;
            }
            tb->XALE=1;
            if (writeState)
            {
                tb->XIOM=writeIO;
                SetXAD(tb, writeAddress);
                SetXA(tb, writeAddress>>8);
                SetXAS(tb, writeAddress>>16);
            }
            else
            {
                // Simulate a nop or something
                tb->XIOM=0;
                uint32_t nopAddres=0x88888;
                SetXAD(tb, nopAddres);
                SetXA(tb, nopAddres>>8);
                SetXAS(tb, nopAddres>>16);
            }
            break;
        case 1: // T2
            tb->XALE=0;
            if (writeState)
            {
                SetXAD(tb, writeValue);
                SetXAS(tb, 3);      // Data
                tb->XWRL=0;
            }
            else
            {
                SetXAD(tb, 0x90);
                SetXAS(tb, 2);      // CODE
            }
            break;
        case 2: // T3
            break;
        case 3: // T4
            tb->XRDL=1;
            tb->XWRL=1;
            break;
    }
}

void TickFallingCpu(Vm_SS* tb)
{
    if (tb->XRESET == 1)
        return;
    if (hold && tb->XHOLD)
        return;

    switch (tState)
    {
        case 0: // T1
            if (writeState)
            {
            }
            else
            {
            }
            break;
        case 1: // T2
            if (writeState)
            {
            }
            else
            {
                tb->XRDL=1;
            }
            break;
        case 2: // T3
            break;
        case 3: // T4
            hold=tb->XHOLD;
            break;
    }

    if (hold==0)
    {
        tState++;
        if (tState==4)
        {
            tState=0;
            writeState=0;
        }
    }
}

uint32_t FetchRamAddress(Vm_SS *tb)
{
    uint32_t address = 0;
    address<<=1; address|=tb->XA_17&1;
    address<<=1; address|=tb->XA_16&1;
    address<<=1; address|=tb->outXA_15&1;
    address<<=1; address|=tb->outXA_14&1;
    address<<=1; address|=tb->outXA_13&1;
    address<<=1; address|=tb->outXA_12&1;
    address<<=1; address|=tb->outXA_11&1;
    address<<=1; address|=tb->outXA_10&1;
    address<<=1; address|=tb->outXA_9&1;
    address<<=1; address|=tb->outXA_8&1;
    address<<=1; address|=tb->XA_7&1;
    address<<=1; address|=tb->XA_6&1;
    address<<=1; address|=tb->XA_5&1;
    address<<=1; address|=tb->XA_4&1;
    address<<=1; address|=tb->XA_3&1;
    address<<=1; address|=tb->XA_2&1;
    address<<=1; address|=tb->XA_1&1;
    address<<=1; address|=tb->XA_0&1;

    if ((tb->enXA_8!=1)||(tb->enXA_9!=1)||(tb->enXA_10!=1)||(tb->enXA_11!=1)||(tb->enXA_12!=1)||(tb->enXA_13!=1)||(tb->enXA_14!=1)||(tb->enXA_15!=1))
    {
        printf("BUS ERROR - attempting to use output address in non driven state\n");
        exit(1);
    }

    return address;
}

void BusProcessorEmulation(Vm_SS *tb)
{
    if (tb->XPCLK==1 && lastPCLK==0)
    {
        // Rising Cycle
        TickRisingCpu(tb);
    }
    if (tb->XPCLK==0 && lastPCLK==1)
    {
        // Falling Cycle
        TickFallingCpu(tb);
    }
    lastPCLK=tb->XPCLK;
    tb->XHLDA=hold;

    if ((tb->XHLDA) && (tb->XOEL==0))
    {
        uint32_t ramAddress=FetchRamAddress(tb);
        if (ramAddress>256*1024)
        {
            printf("RAM FETCH ERROR, out of range : %08X\n",ramAddress);
            exit(1);
        }
        printf("Reading from : %08X with %02X, %02X\n", ramAddress, RAM[ramAddress+0], RAM[ramAddress+1]);
        SetXAD(tb,RAM[ramAddress+0]);
        SetXD(tb, RAM[ramAddress+1]);
    }
}

void tick(Vm_SS *tb, VerilatedVcdC* trace, int ticks)
{
    tb->XXTAL=1;
    trace->dump(ticks*10-2);
    BusProcessorEmulation(tb);
    tb->eval();
    trace->dump(ticks*10);
    tb->XXTAL=0;
    BusProcessorEmulation(tb);
    tb->eval();
    trace->dump(ticks*10+5);
    trace->flush();
}

int doNTicks(Vm_SS *tb, VerilatedVcdC* trace, int ticks, int n)
{
    for (int a=0;a<n;a++)
    {
        tick(tb,trace,ticks+a);
    }
    return ticks+n;
}

void SetXAD(Vm_SS *tb, uint8_t value)
{
    tb->inXAD_0 = (value>>0)&1;
    tb->inXAD_1 = (value>>1)&1;
    tb->inXAD_2 = (value>>2)&1;
    tb->inXAD_3 = (value>>3)&1;
    tb->inXAD_4 = (value>>4)&1;
    tb->inXAD_5 = (value>>5)&1;
    tb->inXAD_6 = (value>>6)&1;
    tb->inXAD_7 = (value>>7)&1;
}

void SetXA(Vm_SS *tb, uint8_t value)
{
    tb->inXA_8 = (value>>0)&1;
    tb->inXA_9 = (value>>1)&1;
    tb->inXA_10 = (value>>2)&1;
    tb->inXA_11 = (value>>3)&1;
    tb->inXA_12 = (value>>4)&1;
    tb->inXA_13 = (value>>5)&1;
    tb->inXA_14 = (value>>6)&1;
    tb->inXA_15 = (value>>7)&1;
}


void SetXD(Vm_SS *tb, uint8_t value)
{
    tb->inXD_8 = (value>>0)&1;
    tb->inXD_9 = (value>>1)&1;
    tb->inXD_10 = (value>>2)&1;
    tb->inXD_11 = (value>>3)&1;
    tb->inXD_12 = (value>>4)&1;
    tb->inXD_13 = (value>>5)&1;
    tb->inXD_14 = (value>>6)&1;
    tb->inXD_15 = (value>>7)&1;
}

void SetJOY(Vm_SS *tb, uint8_t value)
{
    tb->inXJOYL_0 = (value>>0)&1;
    tb->inXJOYL_1 = (value>>1)&1;
    tb->inXJOYL_2 = (value>>2)&1;
}

void SetXAS(Vm_SS *tb, uint8_t value)
{
    tb->XAS_16 = (value>>0)&1;
    tb->XAS_17 = (value>>1)&1;
    tb->XAS_18 = (value>>2)&1;
    tb->XAS_19 = (value>>3)&1;
}

void SetXAI(Vm_SS *tb, uint8_t value)
{
    tb->XAI_0 = (value>>0)&1;
    tb->XAI_1 = (value>>1)&1;
    tb->XAI_2 = (value>>2)&1;
}

int main(int argc, char** argv)
{
	Verilated::commandArgs(argc,argv);

	Verilated::traceEverOn(true);

	Vm_SS *tb = new Vm_SS;

	VerilatedVcdC *trace = new VerilatedVcdC;

    LoadRAM();

	tb->trace(trace, 99);
	trace->open("trace.vcd");

    SetXAD(tb,0);
    SetXA(tb,0);
    SetXD(tb,0);
    tb->inXVSYNCL=1;
    tb->inXHSYNCL=1;
    SetJOY(tb,0x3);         // SLOW, PSRAM, PAL
    tb->inXDSP_IO=0;
    SetXAS(tb,0);       // Look up processor status's
    tb->XRESET=1;
    tb->XIOM=0;
    tb->XALE=0;
    tb->XINTA=0;
    tb->XHLDA=0;
    SetXAI(tb,0);
    tb->XLPL=1;
    tb->XTESTPIN=0;
    tb->XRDL=1;
    tb->XWRL=1;

    // Lets check the various signals according to spec, start of reset for a few ticks
	int ticks=1;

    ticks = doNTicks(tb,trace,ticks,10);

    tb->XRESET=0;
    ticks = doNTicks(tb,trace,ticks,10);

    int registerWrites[13*2] = {
        0x0D, 0xEB,    // BORDERL  // D3B     reD grEen Blue
        0x0E, 0x0D,    // BORDERH
        0x02, 60,      // STARTL
        0x03, 0,       // STARTH
        0x11, 0x03,    // ENDL
        0x12, 0x01,    // ENDH
        0x13, 0x01,    // MEM
        0x0C, 0x01,    // MODE
        0x0F, 0x00,    // CMASK
        0x10, 0x00,    // PINDEX
        0x08, 0x00,    // SCROLLL
        0x09, 0x01,    // SCROLLM
        0x0A, 0x00,    // SCROLLH
    };
    int writeCounter =0;

    while (ticks < 2*757*312)
    {
        if (writeCounter<13)
        {
            if (writeState==0 && nextT1Write==0)
            {
                writeAddress = registerWrites[writeCounter*2 + 0];
                writeValue = registerWrites[writeCounter*2 + 1];
                nextT1Write=1;
                writeIO=1;
                writeCounter++;
                printf("Writing Register %d @%d  (%08X, %02X)\n",writeCounter, ticks,writeAddress, writeValue);
            }
        }

        ticks = doNTicks(tb,trace,ticks, 1);
    }

	trace->close();

	exit(EXIT_SUCCESS);
}













