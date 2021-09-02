                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	bm-hdl						*
*	1/11/88						*
********************************************************/

/*
This module is the bus manager in the SLIPSTREAM chip on the ACW

It is responsible for the following:-

Latching the host address
Enabling the host address onto the internal address bus
Enabling the coprocessor or video address onto the external address bus
Multiplexing the address for DRAMs
Enabling external data onto the internal data bus
Enabling internal data onto the external data bus
Swapping data between the lower and upper halves of the data bus
for eight bit access to the odd SRAM and joysticks
Puting zero on the data bus during reset

*/

module m_BM                                                                     //[00030] MODULE BM;
(                                                                               //[00030] MODULE BM;

    inout    A_0,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_1,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_2,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_3,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_4,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_5,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_6,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_7,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_8,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_9,                                                               //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_10,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_11,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_12,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_13,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_14,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_15,                                                              //[00032] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_16,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_17,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_18,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_19,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_0,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_1,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_2,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_3,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_4,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_5,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_6,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_7,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_8,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_9,                                                               //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_10,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_11,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_12,                                                              //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_13,                                                              //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    inout    D_14,                                                              //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    inout    D_15,                                                              //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    RESETL_0,                                                          //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_0,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_1,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_2,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_3,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_4,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_5,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_6,                                                            //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_7,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_8,                                                             //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_9,                                                             //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_10,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_11,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_12,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_13,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_14,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_15,                                                            //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_8,                                                             //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_9,                                                             //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_10,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VDL_11,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VDL_12,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VDL_13,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VDL_14,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VDL_15,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VRD,                                                               //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    VWR,                                                               //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    ASL_16,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    ASL_17,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    ASL_18,                                                            //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
    input    ASL_19,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    IOML,                                                              //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    ALEL,                                                              //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    INTAL,                                                             //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    HLDAL,                                                             //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    BHOLDL,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    BWORD,                                                             //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    DWORD,                                                             //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    VHOLDL,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    SSIORD,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    JOYL_0,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    JOYL_1,                                                            //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
    input    SA_0,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_1,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_2,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_3,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_4,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_5,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_6,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_7,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_8,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_9,                                                              //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_10,                                                             //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_11,                                                             //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_12,                                                             //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_13,                                                             //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
    input    SA_14,                                                             //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    SA_15,                                                             //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    SA_16,                                                             //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    SA_17,                                                             //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    SAEN,                                                              //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    MUXL,                                                              //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    BRD,                                                               //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    DRD,                                                               //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    BWR,                                                               //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
    input    DWR,                                                               //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
                                                                                //[00033]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
                                                                                //[00034]    D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
                                                                                //[00035]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
                                                                                //[00036]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
                                                                                //[00037]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
                                                                                //[00038]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
                                                                                //[00039]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR;
//    output    A_0,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_1,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_2,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_3,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_4,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_5,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_6,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_7,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_8,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_9,                                                            //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_10,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_11,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_12,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_13,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_14,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_15,                                                           //[00040] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_16,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_17,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_18,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_19,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_0,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_1,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_2,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_3,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_4,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_5,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_6,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_7,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_8,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_9,                                                            //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_10,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_11,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_12,                                                           //[00041]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_13,                                                           //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
//    output    D_14,                                                           //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
//    output    D_15,                                                           //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_0,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_1,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_2,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_3,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_4,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_5,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_6,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAD_7,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    ADEN,                                                             //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAL_0,                                                            //[00042]    D_13,D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,
    output    VAL_1,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_2,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_3,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_4,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_5,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_6,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VAL_7,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_8,                                                             //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_9,                                                             //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_10,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_11,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_12,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_13,                                                            //[00043]    VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,
    output    VA_14,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VA_15,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    AEN,                                                              //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VAL_16,                                                           //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VAL_17,                                                           //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    DEN,                                                              //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_8,                                                             //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_9,                                                             //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_10,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_11,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_12,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_13,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_14,                                                            //[00044]    VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,
    output    VD_15,                                                            //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    VRDL,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    VWRL,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    HOLDL,                                                            //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_0,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_1,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_2,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_3,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_4,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_5,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_6,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WD_7,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    PALCS,                                                            //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    DCSL,                                                             //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    RDL,                                                              //[00045]    VD_15,VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
    output    WRL                                                               //[00046]    WRL;
);                                                                              //[00030] MODULE BM;
                                                                                //[00047] LEVEL FUNCTION;
wire ALE;                                                                       //[00052] ALE_(ALE) = N1C(ALEL);
wire PAL_0;                                                                     //[00053] PA_0_(PAL_0,PA_0) = LD1A(VADL_0,ALE);
wire PA_0;                                                                      //[00053] PA_0_(PAL_0,PA_0) = LD1A(VADL_0,ALE);
wire PAL_1;                                                                     //[00054] PA_1_(PAL_1,PA_1) = LD1A(VADL_1,ALE);
wire PA_1;                                                                      //[00054] PA_1_(PAL_1,PA_1) = LD1A(VADL_1,ALE);
wire PAL_2;                                                                     //[00055] PA_2_(PAL_2,PA_2) = LD1A(VADL_2,ALE);
wire PA_2;                                                                      //[00055] PA_2_(PAL_2,PA_2) = LD1A(VADL_2,ALE);
wire PAL_3;                                                                     //[00056] PA_3_(PAL_3,PA_3) = LD1A(VADL_3,ALE);
wire PA_3;                                                                      //[00056] PA_3_(PAL_3,PA_3) = LD1A(VADL_3,ALE);
wire PAL_4;                                                                     //[00057] PA_4_(PAL_4,PA_4) = LD1A(VADL_4,ALE);
wire PA_4;                                                                      //[00057] PA_4_(PAL_4,PA_4) = LD1A(VADL_4,ALE);
wire PAL_5;                                                                     //[00058] PA_5_(PAL_5,PA_5) = LD1A(VADL_5,ALE);
wire PA_5;                                                                      //[00058] PA_5_(PAL_5,PA_5) = LD1A(VADL_5,ALE);
wire PAL_6;                                                                     //[00059] PA_6_(PAL_6,PA_6) = LD1A(VADL_6,ALE);
wire PA_6;                                                                      //[00059] PA_6_(PAL_6,PA_6) = LD1A(VADL_6,ALE);
wire PAL_7;                                                                     //[00060] PA_7_(PAL_7,PA_7) = LD1A(VADL_7,ALE);
wire PA_7;                                                                      //[00060] PA_7_(PAL_7,PA_7) = LD1A(VADL_7,ALE);
wire PAL_16;                                                                    //[00061] PA_16_(PAL_16,PA_16) = LD1A(ASL_16,ALE);
wire PA_16;                                                                     //[00061] PA_16_(PAL_16,PA_16) = LD1A(ASL_16,ALE);
wire PAL_17;                                                                    //[00062] PA_17_(PAL_17,PA_17) = LD1A(ASL_17,ALE);
wire PA_17;                                                                     //[00062] PA_17_(PAL_17,PA_17) = LD1A(ASL_17,ALE);
wire PAL_18;                                                                    //[00063] PA_18_(PAL_18,PA_18) = LD1A(ASL_18,ALE);
wire PA_18;                                                                     //[00063] PA_18_(PAL_18,PA_18) = LD1A(ASL_18,ALE);
wire PAL_19;                                                                    //[00064] PA_19_(PAL_19,PA_19) = LD1A(ASL_19,ALE);
wire PA_19;                                                                     //[00064] PA_19_(PAL_19,PA_19) = LD1A(ASL_19,ALE);
wire PAEN;                                                                      //[00072] A_0_(A_0) = BTS5A(PAL_0,PAEN);
wire CRD;                                                                       //[00095] CRD_(CRD) = OR2A(BRD,DRD);
wire CWR;                                                                       //[00096] CWR_(CWR) = OR2A(BWR,DWR);
wire WORDL;                                                                     //[00097] WORDL_(WORDL) = NR2A(DWORD,BWORD);
wire HLDA;                                                                      //[00098] RDL_(RDL) = AO2C(HLDA,CRD,HLDAL,VRD);
wire SAENL;                                                                     //[00106] SAENL_(SAENL) = N1C(SAEN);
wire SAENBL;                                                                    //[00107] SAENBL_(SAENBL) = B1A(SAEN);
wire SAENB;                                                                     //[00108] SAENB_(SAENB) = B1A(SAENL);
wire OAL_0;                                                                     //[00110] OA_0_(OAL_0) = AO2A(SA_0,SAENB,A_0,SAENBL);
wire OAL_1;                                                                     //[00111] OA_1_(OAL_1) = AO2A(SA_1,SAENB,A_1,SAENBL);
wire OAL_2;                                                                     //[00112] OA_2_(OAL_2) = AO2A(SA_2,SAENB,A_2,SAENBL);
wire OAL_3;                                                                     //[00113] OA_3_(OAL_3) = AO2A(SA_3,SAENB,A_3,SAENBL);
wire OAL_4;                                                                     //[00114] OA_4_(OAL_4) = AO2A(SA_4,SAENB,A_4,SAENBL);
wire OAL_5;                                                                     //[00115] OA_5_(OAL_5) = AO2A(SA_5,SAENB,A_5,SAENBL);
wire OAL_6;                                                                     //[00116] OA_6_(OAL_6) = AO2A(SA_6,SAENB,A_6,SAENBL);
wire OAL_7;                                                                     //[00117] OA_7_(OAL_7) = AO2A(SA_7,SAENB,A_7,SAENBL);
wire OAL_8;                                                                     //[00118] OA_8_(OAL_8) = AO2A(SA_8,SAENB,A_8,SAENBL);
wire OAL_9;                                                                     //[00119] OA_9_(OAL_9) = AO2A(SA_9,SAENB,A_9,SAENBL);
wire OAL_10;                                                                    //[00120] OA_10_(OAL_10) = AO2A(SA_10,SAENB,A_10,SAENBL);
wire OAL_11;                                                                    //[00121] OA_11_(OAL_11) = AO2A(SA_11,SAENB,A_11,SAENBL);
wire OAL_12;                                                                    //[00122] OA_12_(OAL_12) = AO2A(SA_12,SAENB,A_12,SAENBL);
wire OAL_13;                                                                    //[00123] OA_13_(OAL_13) = AO2A(SA_13,SAENB,A_13,SAENBL);
wire OAL_14;                                                                    //[00124] OA_14_(OAL_14) = AO2A(SA_14,SAENB,A_14,SAENBL);
wire OAL_15;                                                                    //[00125] OA_15_(OAL_15) = AO2A(SA_15,SAENB,A_15,SAENBL);
wire OAL_16;                                                                    //[00126] OA_16_(OAL_16) = AO2A(SA_16,SAENB,A_16,SAENBL);
wire MUX;                                                                       //[00131] MUX_(MUX) = N1C(MUXL);
wire MUXB;                                                                      //[00132] MUXB_(MUXB) = B1A(MUXL);
wire MUXBL;                                                                     //[00133] MUXBL_(MUXBL) = B1A(MUX);
wire VA_0;                                                                      //[00135] VA_0_(VA_0) = AO2A(OAL_0,MUXBL,OAL_8,MUXB);
wire VA_1;                                                                      //[00136] VA_1_(VA_1) = AO2A(OAL_1,MUXBL,OAL_9,MUXB);
wire VA_2;                                                                      //[00137] VA_2_(VA_2) = AO2A(OAL_2,MUXBL,OAL_10,MUXB);
wire VA_3;                                                                      //[00138] VA_3_(VA_3) = AO2A(OAL_3,MUXBL,OAL_11,MUXB);
wire VA_4;                                                                      //[00139] VA_4_(VA_4) = AO2A(OAL_4,MUXBL,OAL_12,MUXB);
wire VA_5;                                                                      //[00140] VA_5_(VA_5) = AO2A(OAL_5,MUXBL,OAL_13,MUXB);
wire VA_6;                                                                      //[00141] VA_6_(VA_6) = AO2A(OAL_6,MUXBL,OAL_14,MUXB);
wire VA_7;                                                                      //[00142] VA_7_(VA_7) = AO2A(OAL_7,MUXBL,OAL_15,MUXB);
wire VA_16;                                                                     //[00171] VA_16_(VA_16) = AO2A(OAL_16,MUXBL,VAL_17,MUXB);
wire RESET_0;                                                                   //[00184] RESET_0_(RESET_0) = N1A(RESETL_0);
wire RESETL_1;                                                                  //[00185] RESETL_1_(RESETL_1) = N1A(RESET_0);
wire RESET_1;                                                                   //[00186] RESET_1_(RESET_1) = N1A(RESETL_1);
wire RESETL_2;                                                                  //[00187] RESETL_2_(RESETL_2) = N1A(RESET_1);
wire RESET_2;                                                                   //[00188] RESET_2_(RESET_2) = N1A(RESETL_2);
wire RESETL_3;                                                                  //[00189] RESETL_3_(RESETL_3) = N1A(RESET_2);
wire RESET_3;                                                                   //[00190] RESET_3_(RESET_3) = N1A(RESETL_3);
wire RESETL_4;                                                                  //[00191] RESETL_4_(RESETL_4) = N1A(RESET_3);
wire RESET_4;                                                                   //[00192] RESET_4_(RESET_4) = N1A(RESETL_4);
wire RESETL_5;                                                                  //[00193] RESETL_5_(RESETL_5) = N1A(RESET_4);
wire RESET_5;                                                                   //[00194] RESET_5_(RESET_5) = N1A(RESETL_5);
wire RESETL_6;                                                                  //[00195] RESETL_6_(RESETL_6) = N1A(RESET_5);
wire RESET_6;                                                                   //[00196] RESET_6_(RESET_6) = N1A(RESETL_6);
wire RD;                                                                        //[00209] IMRDL_(IMRDL) = ND4A(IOML,RD,A_18,AL_19);
wire AL_19;                                                                     //[00209] IMRDL_(IMRDL) = ND4A(IOML,RD,A_18,AL_19);
wire IMRDL;                                                                     //[00209] IMRDL_(IMRDL) = ND4A(IOML,RD,A_18,AL_19);
wire SSIORDL;                                                                   //[00210] EN0_(EN0) = ND3B(IMRDL,SSIORDL,RESETL_6);
wire EN0;                                                                       //[00210] EN0_(EN0) = ND3B(IMRDL,SSIORDL,RESETL_6);
wire SDL_0;                                                                     //[00231] DH_0_(D_0) = BTS5A(SDL_0,ENID);
wire ENID;                                                                      //[00231] DH_0_(D_0) = BTS5A(SDL_0,ENID);
wire SDL_1;                                                                     //[00232] DH_1_(D_1) = BTS5A(SDL_1,ENID);
wire SDL_2;                                                                     //[00233] DH_2_(D_2) = BTS5A(SDL_2,ENID);
wire SDL_3;                                                                     //[00234] DH_3_(D_3) = BTS5A(SDL_3,ENID);
wire SDL_4;                                                                     //[00235] DH_4_(D_4) = BTS5A(SDL_4,ENID);
wire SDL_5;                                                                     //[00236] DH_5_(D_5) = BTS5A(SDL_5,ENID);
wire SDL_6;                                                                     //[00237] DH_6_(D_6) = BTS5A(SDL_6,ENID);
wire SDL_7;                                                                     //[00238] DH_7_(D_7) = BTS5A(SDL_7,ENID);
wire SSIMRDL;                                                                   //[00254] SSIMRDL_(SSIMRDL) = ND5A(HLDAL,IOML,VRD,A_18,AL_19);
wire WR;                                                                        //[00259] WR_(WR) = N1A(WRL);
wire COPWRL;                                                                    //[00260] COPWRL_(COPWRL) = ND2A(HLDA,WR);
wire COPWRNVL;                                                                  //[00264] COPWRNVL_(COPWRNVL) = ND3A(HLDA,WR,SAENL);
wire COPIMRDL;                                                                  //[00269] COPIMRDL_(COPIMRDL) = ND4A(HLDA,RD,A_18,AL_19);
wire ENIDL;                                                                     //[00271] ENIDL_(ENIDL) = ND6A(SSIORDL,SSIMRDL,INTAL,COPWRL,COPIMRDL,RESETL_6);
wire SWAP1L;                                                                    //[00287] SDL_8_(SDL_8) = AO2A(D_8,SWAP1L,D_0,SWAP1);
wire SWAP1;                                                                     //[00287] SDL_8_(SDL_8) = AO2A(D_8,SWAP1L,D_0,SWAP1);
wire SDL_8;                                                                     //[00287] SDL_8_(SDL_8) = AO2A(D_8,SWAP1L,D_0,SWAP1);
wire SDL_9;                                                                     //[00288] SDL_9_(SDL_9) = AO2A(D_9,SWAP1L,D_1,SWAP1);
wire SDL_10;                                                                    //[00289] SDL_10_(SDL_10) = AO2A(D_10,SWAP1L,D_2,SWAP1);
wire SDL_11;                                                                    //[00290] SDL_11_(SDL_11) = AO2A(D_11,SWAP1L,D_3,SWAP1);
wire SDL_12;                                                                    //[00291] SDL_12_(SDL_12) = AO2A(D_12,SWAP1L,D_4,SWAP1);
wire SDL_13;                                                                    //[00292] SDL_13_(SDL_13) = AO2A(D_13,SWAP1L,D_5,SWAP1);
wire SDL_14;                                                                    //[00293] SDL_14_(SDL_14) = AO2A(D_14,SWAP1L,D_6,SWAP1);
wire SDL_15;                                                                    //[00294] SDL_15_(SDL_15) = AO2A(D_15,SWAP1L,D_7,SWAP1);
wire SWAP2L;                                                                    //[00304] SD_0_(SD_0) = AO2A(VADL_0,SWAP2L,VDL_8,SWAP2);
wire SWAP2;                                                                     //[00304] SD_0_(SD_0) = AO2A(VADL_0,SWAP2L,VDL_8,SWAP2);
wire SD_0;                                                                      //[00304] SD_0_(SD_0) = AO2A(VADL_0,SWAP2L,VDL_8,SWAP2);
wire SD_1;                                                                      //[00305] SD_1_(SD_1) = AO2A(VADL_1,SWAP2L,VDL_9,SWAP2);
wire SD_2;                                                                      //[00306] SD_2_(SD_2) = AO2A(VADL_2,SWAP2L,VDL_10,SWAP2);
wire SD_3;                                                                      //[00307] SD_3_(SD_3) = AO2A(VADL_3,SWAP2L,VDL_11,SWAP2);
wire SD_4;                                                                      //[00308] SD_4_(SD_4) = AO2A(VADL_4,SWAP2L,VDL_12,SWAP2);
wire SD_5;                                                                      //[00309] SD_5_(SD_5) = AO2A(VADL_5,SWAP2L,VDL_13,SWAP2);
wire SD_6;                                                                      //[00310] SD_6_(SD_6) = AO2A(VADL_6,SWAP2L,VDL_14,SWAP2);
wire SD_7;                                                                      //[00311] SD_7_(SD_7) = AO2A(VADL_7,SWAP2L,VDL_15,SWAP2);
wire AL_18;                                                                     //[00331] AL_18_(AL_18) = N1A(A_18);
wire HODDL;                                                                     //[00333] HODDL_(HODDL) = ND5A(HLDAL,IOML,A_0,AL_18,AL_19);
wire HODDRL;                                                                    //[00334] HODDRL_(HODDRL) = OR2A(RDL,HODDL);
wire CODDL;                                                                     //[00338] CODDL_(CODDL) = ND6A(HLDA,SAENL,A_0,AL_18,AL_19,WORDL);
wire JOYL;                                                                      //[00342] JOYL_(JOYL) = AND2A(JOYL_0,JOYL_1);
wire SWAP;                                                                      //[00344] SWAP_(SWAP) = ND3A(HODDL,CODDL,JOYL);
wire DENL;                                                                      //[00347] SWAP2L_(SWAP2L) = ND2C(SWAP,DENL);
wire HODDWL;                                                                    //[00370] HODDWL_(HODDWL) = ND6A(HLDAL,IOML,VWR,A_0,AL_18,AL_19);
wire PR;                                                                        //[00393] PR_(PR) = NR8A(A_12,A_13,A_14,A_15,A_16,A_17,AL_18,A_19);
wire AL_9;                                                                      //[00394] AL_9_(AL_9) = N1A(A_9);
wire AL_10;                                                                     //[00395] AL_10_(AL_10) = N1A(A_10);
wire AL_11;                                                                     //[00396] AL_11_(AL_11) = N1A(A_11);
wire AL_14;                                                                     //[00397] AL_14_(AL_14) = N1A(A_14);
wire PALCSL;                                                                    //[00399] PALCSL_(PALCSL) = ND5A(PR,IOML,AL_9,AL_10,AL_11);
wire AL_12;                                                                     //[00404] AL_12_(AL_12) = N1A(A_12);
wire D0;                                                                        //[00405] D0_(D0) = NR8A(AL_12,A_13,A_14,A_15,A_16,A_17,AL_18,A_19);

/* Latch the processors address */

assign ALE = ~ALEL;                                                             //[00052] ALE_(ALE) = N1C(ALEL);
LD1A PA_0__inst (.q(PAL_0),.qL(PA_0),.d(VADL_0),.en(ALE));                      //[00053] PA_0_(PAL_0,PA_0) = LD1A(VADL_0,ALE);
LD1A PA_1__inst (.q(PAL_1),.qL(PA_1),.d(VADL_1),.en(ALE));                      //[00054] PA_1_(PAL_1,PA_1) = LD1A(VADL_1,ALE);
LD1A PA_2__inst (.q(PAL_2),.qL(PA_2),.d(VADL_2),.en(ALE));                      //[00055] PA_2_(PAL_2,PA_2) = LD1A(VADL_2,ALE);
LD1A PA_3__inst (.q(PAL_3),.qL(PA_3),.d(VADL_3),.en(ALE));                      //[00056] PA_3_(PAL_3,PA_3) = LD1A(VADL_3,ALE);
LD1A PA_4__inst (.q(PAL_4),.qL(PA_4),.d(VADL_4),.en(ALE));                      //[00057] PA_4_(PAL_4,PA_4) = LD1A(VADL_4,ALE);
LD1A PA_5__inst (.q(PAL_5),.qL(PA_5),.d(VADL_5),.en(ALE));                      //[00058] PA_5_(PAL_5,PA_5) = LD1A(VADL_5,ALE);
LD1A PA_6__inst (.q(PAL_6),.qL(PA_6),.d(VADL_6),.en(ALE));                      //[00059] PA_6_(PAL_6,PA_6) = LD1A(VADL_6,ALE);
LD1A PA_7__inst (.q(PAL_7),.qL(PA_7),.d(VADL_7),.en(ALE));                      //[00060] PA_7_(PAL_7,PA_7) = LD1A(VADL_7,ALE);
LD1A PA_16__inst (.q(PAL_16),.qL(PA_16),.d(ASL_16),.en(ALE));                   //[00061] PA_16_(PAL_16,PA_16) = LD1A(ASL_16,ALE);
LD1A PA_17__inst (.q(PAL_17),.qL(PA_17),.d(ASL_17),.en(ALE));                   //[00062] PA_17_(PAL_17,PA_17) = LD1A(ASL_17,ALE);
LD1A PA_18__inst (.q(PAL_18),.qL(PA_18),.d(ASL_18),.en(ALE));                   //[00063] PA_18_(PAL_18,PA_18) = LD1A(ASL_18,ALE);
LD1A PA_19__inst (.q(PAL_19),.qL(PA_19),.d(ASL_19),.en(ALE));                   //[00064] PA_19_(PAL_19,PA_19) = LD1A(ASL_19,ALE);

/* enable onto the internal address bus */
/* the microprocessors address is enabled except when hlda is asserted */
/* NB the blitter should enable its address whenever hlda is asserted,
even if it did not issue a hold, in order that this bus does not float */

assign A_0 = PAEN ? (~PAL_0) : 1'bZ;                                            //[00072] A_0_(A_0) = BTS5A(PAL_0,PAEN);
assign A_1 = PAEN ? (~PAL_1) : 1'bZ;                                            //[00073] A_1_(A_1) = BTS5A(PAL_1,PAEN);
assign A_2 = PAEN ? (~PAL_2) : 1'bZ;                                            //[00074] A_2_(A_2) = BTS5A(PAL_2,PAEN);
assign A_3 = PAEN ? (~PAL_3) : 1'bZ;                                            //[00075] A_3_(A_3) = BTS5A(PAL_3,PAEN);
assign A_4 = PAEN ? (~PAL_4) : 1'bZ;                                            //[00076] A_4_(A_4) = BTS5A(PAL_4,PAEN);
assign A_5 = PAEN ? (~PAL_5) : 1'bZ;                                            //[00077] A_5_(A_5) = BTS5A(PAL_5,PAEN);
assign A_6 = PAEN ? (~PAL_6) : 1'bZ;                                            //[00078] A_6_(A_6) = BTS5A(PAL_6,PAEN);
assign A_7 = PAEN ? (~PAL_7) : 1'bZ;                                            //[00079] A_7_(A_7) = BTS5A(PAL_7,PAEN);
assign A_8 = PAEN ? (~VAL_8) : 1'bZ;                                            //[00080] A_8_(A_8) = BTS5A(VAL_8,PAEN);
assign A_9 = PAEN ? (~VAL_9) : 1'bZ;                                            //[00081] A_9_(A_9) = BTS5A(VAL_9,PAEN);
assign A_10 = PAEN ? (~VAL_10) : 1'bZ;                                          //[00082] A_10_(A_10) = BTS5A(VAL_10,PAEN);
assign A_11 = PAEN ? (~VAL_11) : 1'bZ;                                          //[00083] A_11_(A_11) = BTS5A(VAL_11,PAEN);
assign A_12 = PAEN ? (~VAL_12) : 1'bZ;                                          //[00084] A_12_(A_12) = BTS5A(VAL_12,PAEN);
assign A_13 = PAEN ? (~VAL_13) : 1'bZ;                                          //[00085] A_13_(A_13) = BTS5A(VAL_13,PAEN);
assign A_14 = PAEN ? (~VAL_14) : 1'bZ;                                          //[00086] A_14_(A_14) = BTS5A(VAL_14,PAEN);
assign A_15 = PAEN ? (~VAL_15) : 1'bZ;                                          //[00087] A_15_(A_15) = BTS5A(VAL_15,PAEN);
assign A_16 = PAEN ? (~PAL_16) : 1'bZ;                                          //[00088] A_16_(A_16) = BTS5A(PAL_16,PAEN);
assign A_17 = PAEN ? (~PAL_17) : 1'bZ;                                          //[00089] A_17_(A_17) = BTS5A(PAL_17,PAEN);
assign A_18 = PAEN ? (~PAL_18) : 1'bZ;                                          //[00090] A_18_(A_18) = BTS5A(PAL_18,PAEN);
assign A_19 = PAEN ? (~PAL_19) : 1'bZ;                                          //[00091] A_19_(A_19) = BTS5A(PAL_19,PAEN);

/* mix coprocessor read and write strobes */

assign CRD = BRD | DRD;                                                         //[00095] CRD_(CRD) = OR2A(BRD,DRD);
assign CWR = BWR | DWR;                                                         //[00096] CWR_(CWR) = OR2A(BWR,DWR);
assign WORDL = ~(DWORD | BWORD);                                                //[00097] WORDL_(WORDL) = NR2A(DWORD,BWORD);
assign RDL = ~((HLDA & CRD)|(HLDAL & VRD));                                     //[00098] RDL_(RDL) = AO2C(HLDA,CRD,HLDAL,VRD);
assign WRL = ~((HLDA & CWR)|(HLDAL & VWR));                                     //[00099] WRL_(WRL) = AO2C(HLDA,CWR,HLDAL,VWR);
assign VRDL = RDL;                                                              //[00100] VRDL_(VRDL) = B3A(RDL);
assign VWRL = WRL;                                                              //[00101] VWRL_(VWRL) = B3A(WRL);

/* select between the video address or coprocessor address */
/* the video address does not appear on the internal address bus */

assign SAENL = ~SAEN;                                                           //[00106] SAENL_(SAENL) = N1C(SAEN);
assign SAENBL = SAEN;                                                           //[00107] SAENBL_(SAENBL) = B1A(SAEN);
assign SAENB = SAENL;                                                           //[00108] SAENB_(SAENB) = B1A(SAENL);

assign OAL_0 = ~((SA_0 & SAENB)|(A_0 & SAENBL));                                //[00110] OA_0_(OAL_0) = AO2A(SA_0,SAENB,A_0,SAENBL);
assign OAL_1 = ~((SA_1 & SAENB)|(A_1 & SAENBL));                                //[00111] OA_1_(OAL_1) = AO2A(SA_1,SAENB,A_1,SAENBL);
assign OAL_2 = ~((SA_2 & SAENB)|(A_2 & SAENBL));                                //[00112] OA_2_(OAL_2) = AO2A(SA_2,SAENB,A_2,SAENBL);
assign OAL_3 = ~((SA_3 & SAENB)|(A_3 & SAENBL));                                //[00113] OA_3_(OAL_3) = AO2A(SA_3,SAENB,A_3,SAENBL);
assign OAL_4 = ~((SA_4 & SAENB)|(A_4 & SAENBL));                                //[00114] OA_4_(OAL_4) = AO2A(SA_4,SAENB,A_4,SAENBL);
assign OAL_5 = ~((SA_5 & SAENB)|(A_5 & SAENBL));                                //[00115] OA_5_(OAL_5) = AO2A(SA_5,SAENB,A_5,SAENBL);
assign OAL_6 = ~((SA_6 & SAENB)|(A_6 & SAENBL));                                //[00116] OA_6_(OAL_6) = AO2A(SA_6,SAENB,A_6,SAENBL);
assign OAL_7 = ~((SA_7 & SAENB)|(A_7 & SAENBL));                                //[00117] OA_7_(OAL_7) = AO2A(SA_7,SAENB,A_7,SAENBL);
assign OAL_8 = ~((SA_8 & SAENB)|(A_8 & SAENBL));                                //[00118] OA_8_(OAL_8) = AO2A(SA_8,SAENB,A_8,SAENBL);
assign OAL_9 = ~((SA_9 & SAENB)|(A_9 & SAENBL));                                //[00119] OA_9_(OAL_9) = AO2A(SA_9,SAENB,A_9,SAENBL);
assign OAL_10 = ~((SA_10 & SAENB)|(A_10 & SAENBL));                             //[00120] OA_10_(OAL_10) = AO2A(SA_10,SAENB,A_10,SAENBL);
assign OAL_11 = ~((SA_11 & SAENB)|(A_11 & SAENBL));                             //[00121] OA_11_(OAL_11) = AO2A(SA_11,SAENB,A_11,SAENBL);
assign OAL_12 = ~((SA_12 & SAENB)|(A_12 & SAENBL));                             //[00122] OA_12_(OAL_12) = AO2A(SA_12,SAENB,A_12,SAENBL);
assign OAL_13 = ~((SA_13 & SAENB)|(A_13 & SAENBL));                             //[00123] OA_13_(OAL_13) = AO2A(SA_13,SAENB,A_13,SAENBL);
assign OAL_14 = ~((SA_14 & SAENB)|(A_14 & SAENBL));                             //[00124] OA_14_(OAL_14) = AO2A(SA_14,SAENB,A_14,SAENBL);
assign OAL_15 = ~((SA_15 & SAENB)|(A_15 & SAENBL));                             //[00125] OA_15_(OAL_15) = AO2A(SA_15,SAENB,A_15,SAENBL);
assign OAL_16 = ~((SA_16 & SAENB)|(A_16 & SAENBL));                             //[00126] OA_16_(OAL_16) = AO2A(SA_16,SAENB,A_16,SAENBL);
assign VAL_17 = ~((SA_17 & SAENB)|(A_17 & SAENBL));                             //[00127] VAL_17_(VAL_17) = AO2A(SA_17,SAENB,A_17,SAENBL);

/* the low eight address lines may be multiplexed for DRAMs */

assign MUX = ~MUXL;                                                             //[00131] MUX_(MUX) = N1C(MUXL);
assign MUXB = MUXL;                                                             //[00132] MUXB_(MUXB) = B1A(MUXL);
assign MUXBL = MUX;                                                             //[00133] MUXBL_(MUXBL) = B1A(MUX);

assign VA_0 = ~((OAL_0 & MUXBL)|(OAL_8 & MUXB));                                //[00135] VA_0_(VA_0) = AO2A(OAL_0,MUXBL,OAL_8,MUXB);
assign VA_1 = ~((OAL_1 & MUXBL)|(OAL_9 & MUXB));                                //[00136] VA_1_(VA_1) = AO2A(OAL_1,MUXBL,OAL_9,MUXB);
assign VA_2 = ~((OAL_2 & MUXBL)|(OAL_10 & MUXB));                               //[00137] VA_2_(VA_2) = AO2A(OAL_2,MUXBL,OAL_10,MUXB);
assign VA_3 = ~((OAL_3 & MUXBL)|(OAL_11 & MUXB));                               //[00138] VA_3_(VA_3) = AO2A(OAL_3,MUXBL,OAL_11,MUXB);
assign VA_4 = ~((OAL_4 & MUXBL)|(OAL_12 & MUXB));                               //[00139] VA_4_(VA_4) = AO2A(OAL_4,MUXBL,OAL_12,MUXB);
assign VA_5 = ~((OAL_5 & MUXBL)|(OAL_13 & MUXB));                               //[00140] VA_5_(VA_5) = AO2A(OAL_5,MUXBL,OAL_13,MUXB);
assign VA_6 = ~((OAL_6 & MUXBL)|(OAL_14 & MUXB));                               //[00141] VA_6_(VA_6) = AO2A(OAL_6,MUXBL,OAL_14,MUXB);
assign VA_7 = ~((OAL_7 & MUXBL)|(OAL_15 & MUXB));                               //[00142] VA_7_(VA_7) = AO2A(OAL_7,MUXBL,OAL_15,MUXB);
assign VAL_0 = ~VA_0;                                                           //[00143] VAL_0_(VAL_0) = N1A(VA_0);

assign VAL_1 = ~VA_1;                                                           //[00145] VAL_1_(VAL_1) = N1A(VA_1);

assign VAL_2 = ~VA_2;                                                           //[00147] VAL_2_(VAL_2) = N1A(VA_2);

assign VAL_3 = ~VA_3;                                                           //[00149] VAL_3_(VAL_3) = N1A(VA_3);

assign VAL_4 = ~VA_4;                                                           //[00151] VAL_4_(VAL_4) = N1A(VA_4);

assign VAL_5 = ~VA_5;                                                           //[00153] VAL_5_(VAL_5) = N1A(VA_5);

assign VAL_6 = ~VA_6;                                                           //[00155] VAL_6_(VAL_6) = N1A(VA_6);

assign VAL_7 = ~VA_7;                                                           //[00157] VAL_7_(VAL_7) = N1A(VA_7);

assign VA_8 = ~OAL_8;                                                           //[00160] VA_8_(VA_8) = N1A(OAL_8);
assign VA_9 = ~OAL_9;                                                           //[00161] VA_9_(VA_9) = N1A(OAL_9);
assign VA_10 = ~OAL_10;                                                         //[00162] VA_10_(VA_10) = N1A(OAL_10);
assign VA_11 = ~OAL_11;                                                         //[00163] VA_11_(VA_11) = N1A(OAL_11);
assign VA_12 = ~OAL_12;                                                         //[00164] VA_12_(VA_12) = N1A(OAL_12);
assign VA_13 = ~OAL_13;                                                         //[00165] VA_13_(VA_13) = N1A(OAL_13);
assign VA_14 = ~OAL_14;                                                         //[00166] VA_14_(VA_14) = N1A(OAL_14);
assign VA_15 = ~OAL_15;                                                         //[00167] VA_15_(VA_15) = N1A(OAL_15);

/* A16 may also be multiplexed for DRAMs */

assign VA_16 = ~((OAL_16 & MUXBL)|(VAL_17 & MUXB));                             //[00171] VA_16_(VA_16) = AO2A(OAL_16,MUXBL,VAL_17,MUXB);
assign VAL_16 = ~VA_16;                                                         //[00172] VAL_16_(VAL_16) = N1A(VA_16);

/* A8-A15, RDL and WRL are enabled when hlda is asserted */

assign AEN = ~HLDAL;                                                            //[00176] AEN_(AEN) = N1C(HLDAL);
assign PAEN = ~AEN;                                                             //[00177] PAEN_(PAEN) = N1C(AEN);

/* Zero is put on the internal bus during reset,
so that registers may be cleared without much additional logic */

/* Delay the enable to provide hold time */

assign RESET_0 = ~RESETL_0;                                                     //[00184] RESET_0_(RESET_0) = N1A(RESETL_0);
assign RESETL_1 = ~RESET_0;                                                     //[00185] RESETL_1_(RESETL_1) = N1A(RESET_0);
assign RESET_1 = ~RESETL_1;                                                     //[00186] RESET_1_(RESET_1) = N1A(RESETL_1);
assign RESETL_2 = ~RESET_1;                                                     //[00187] RESETL_2_(RESETL_2) = N1A(RESET_1);
assign RESET_2 = ~RESETL_2;                                                     //[00188] RESET_2_(RESET_2) = N1A(RESETL_2);
assign RESETL_3 = ~RESET_2;                                                     //[00189] RESETL_3_(RESETL_3) = N1A(RESET_2);
assign RESET_3 = ~RESETL_3;                                                     //[00190] RESET_3_(RESET_3) = N1A(RESETL_3);
assign RESETL_4 = ~RESET_3;                                                     //[00191] RESETL_4_(RESETL_4) = N1A(RESET_3);
assign RESET_4 = ~RESETL_4;                                                     //[00192] RESET_4_(RESET_4) = N1A(RESETL_4);
assign RESETL_5 = ~RESET_4;                                                     //[00193] RESETL_5_(RESETL_5) = N1A(RESET_4);
assign RESET_5 = ~RESETL_5;                                                     //[00194] RESET_5_(RESET_5) = N1A(RESETL_5);
assign RESETL_6 = ~RESET_5;                                                     //[00195] RESETL_6_(RESETL_6) = N1A(RESET_5);
assign RESET_6 = ~RESETL_6;                                                     //[00196] RESET_6_(RESET_6) = N1A(RESETL_6);
assign D_0 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00197] DR_0_(D_0) = BTS5A(RESET_6,RESET_6);
assign D_1 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00198] DR_1_(D_1) = BTS5A(RESET_6,RESET_6);
assign D_2 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00199] DR_2_(D_2) = BTS5A(RESET_6,RESET_6);
assign D_3 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00200] DR_3_(D_3) = BTS5A(RESET_6,RESET_6);
assign D_4 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00201] DR_4_(D_4) = BTS5A(RESET_6,RESET_6);
assign D_5 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00202] DR_5_(D_5) = BTS5A(RESET_6,RESET_6);
assign D_6 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00203] DR_6_(D_6) = BTS5A(RESET_6,RESET_6);
assign D_7 = RESET_6 ? (~RESET_6) : 1'bZ;                                       //[00204] DR_7_(D_7) = BTS5A(RESET_6,RESET_6);

/* zero is put onto the top half of the bus during internal memory reads
and internal io reads. This prevents it from floating */

assign IMRDL = ~(IOML & RD & A_18 & AL_19);                                     //[00209] IMRDL_(IMRDL) = ND4A(IOML,RD,A_18,AL_19);
assign EN0 = ~(IMRDL & SSIORDL & RESETL_6);                                     //[00210] EN0_(EN0) = ND3B(IMRDL,SSIORDL,RESETL_6);
assign D_8 = EN0 ? (~EN0) : 1'bZ;                                               //[00211] DR_8_(D_8) = BTS5A(EN0,EN0);
assign D_9 = EN0 ? (~EN0) : 1'bZ;                                               //[00212] DR_9_(D_9) = BTS5A(EN0,EN0);
assign D_10 = EN0 ? (~EN0) : 1'bZ;                                              //[00213] DR_10_(D_10) = BTS5A(EN0,EN0);
assign D_11 = EN0 ? (~EN0) : 1'bZ;                                              //[00214] DR_11_(D_11) = BTS5A(EN0,EN0);
assign D_12 = EN0 ? (~EN0) : 1'bZ;                                              //[00215] DR_12_(D_12) = BTS5A(EN0,EN0);
assign D_13 = EN0 ? (~EN0) : 1'bZ;                                              //[00216] DR_13_(D_13) = BTS5A(EN0,EN0);
assign D_14 = EN0 ? (~EN0) : 1'bZ;                                              //[00217] DR_14_(D_14) = BTS5A(EN0,EN0);
assign D_15 = EN0 ? (~EN0) : 1'bZ;                                              //[00218] DR_15_(D_15) = BTS5A(EN0,EN0);

/* enable the host data onto the internal data bus except:-

1)	when the host is reading internal IO
2)	when the host is reading internal memory
3)	during interupt acknowledge
4)	when the coprocessors are writing
5)	when coprocessors reading from internal memory
6)	during reset

*/

assign D_0 = ENID ? (~SDL_0) : 1'bZ;                                            //[00231] DH_0_(D_0) = BTS5A(SDL_0,ENID);
assign D_1 = ENID ? (~SDL_1) : 1'bZ;                                            //[00232] DH_1_(D_1) = BTS5A(SDL_1,ENID);
assign D_2 = ENID ? (~SDL_2) : 1'bZ;                                            //[00233] DH_2_(D_2) = BTS5A(SDL_2,ENID);
assign D_3 = ENID ? (~SDL_3) : 1'bZ;                                            //[00234] DH_3_(D_3) = BTS5A(SDL_3,ENID);
assign D_4 = ENID ? (~SDL_4) : 1'bZ;                                            //[00235] DH_4_(D_4) = BTS5A(SDL_4,ENID);
assign D_5 = ENID ? (~SDL_5) : 1'bZ;                                            //[00236] DH_5_(D_5) = BTS5A(SDL_5,ENID);
assign D_6 = ENID ? (~SDL_6) : 1'bZ;                                            //[00237] DH_6_(D_6) = BTS5A(SDL_6,ENID);
assign D_7 = ENID ? (~SDL_7) : 1'bZ;                                            //[00238] DH_7_(D_7) = BTS5A(SDL_7,ENID);
assign D_8 = ENID ? (~VDL_8) : 1'bZ;                                            //[00239] DH_8_(D_8) = BTS5A(VDL_8,ENID);
assign D_9 = ENID ? (~VDL_9) : 1'bZ;                                            //[00240] DH_9_(D_9) = BTS5A(VDL_9,ENID);
assign D_10 = ENID ? (~VDL_10) : 1'bZ;                                          //[00241] DH_10_(D_10) = BTS5A(VDL_10,ENID);
assign D_11 = ENID ? (~VDL_11) : 1'bZ;                                          //[00242] DH_11_(D_11) = BTS5A(VDL_11,ENID);
assign D_12 = ENID ? (~VDL_12) : 1'bZ;                                          //[00243] DH_12_(D_12) = BTS5A(VDL_12,ENID);
assign D_13 = ENID ? (~VDL_13) : 1'bZ;                                          //[00244] DH_13_(D_13) = BTS5A(VDL_13,ENID);
assign D_14 = ENID ? (~VDL_14) : 1'bZ;                                          //[00245] DH_14_(D_14) = BTS5A(VDL_14,ENID);
assign D_15 = ENID ? (~VDL_15) : 1'bZ;                                          //[00246] DH_15_(D_15) = BTS5A(VDL_15,ENID);

/* internal IO reads are decoded by iodec */

assign SSIORDL = ~SSIORD;                                                       //[00250] SSIORDL_(SSIORDL) = N1A(SSIORD);

/* decode host internal memory reads */

assign SSIMRDL = ~(HLDAL & IOML & VRD & A_18 & AL_19);                          //[00254] SSIMRDL_(SSIMRDL) = ND5A(HLDAL,IOML,VRD,A_18,AL_19);

/* decode coproccesor writes */

assign HLDA = ~HLDAL;                                                           //[00258] HLDA_(HLDA) = N1B(HLDAL);
assign WR = ~WRL;                                                               //[00259] WR_(WR) = N1A(WRL);
assign COPWRL = ~(HLDA & WR);                                                   //[00260] COPWRL_(COPWRL) = ND2A(HLDA,WR);

/* copwrnvL is not asserted during video fetches */

assign COPWRNVL = ~(HLDA & WR & SAENL);                                         //[00264] COPWRNVL_(COPWRNVL) = ND3A(HLDA,WR,SAENL);

/* decode coproccesor internal reads */

assign RD = ~RDL;                                                               //[00268] RD_(RD) = N1A(RDL);
assign COPIMRDL = ~(HLDA & RD & A_18 & AL_19);                                  //[00269] COPIMRDL_(COPIMRDL) = ND4A(HLDA,RD,A_18,AL_19);

assign ENIDL = ~(SSIORDL & SSIMRDL & INTAL & COPWRL & COPIMRDL & RESETL_6);     //[00271] ENIDL_(ENIDL) = ND6A(SSIORDL,SSIMRDL,INTAL,COPWRL,COPIMRDL,RESETL_6);
assign ENID = ENIDL;                                                            //[00272] ENID_(ENID) = B1A(ENIDL);

/* when SWAP1 is asserted the low byte on the internal bus is presented
to D[8-15] output pads: when SWAP2 is asserted D[8-15] input pad is presented
to the low byte on the internal bus */

assign VAD_0 = D_0;                                                             //[00278] VAD_0_(VAD_0) = B3A(D_0);
assign VAD_1 = D_1;                                                             //[00279] VAD_1_(VAD_1) = B3A(D_1);
assign VAD_2 = D_2;                                                             //[00280] VAD_2_(VAD_2) = B3A(D_2);
assign VAD_3 = D_3;                                                             //[00281] VAD_3_(VAD_3) = B3A(D_3);
assign VAD_4 = D_4;                                                             //[00282] VAD_4_(VAD_4) = B3A(D_4);
assign VAD_5 = D_5;                                                             //[00283] VAD_5_(VAD_5) = B3A(D_5);
assign VAD_6 = D_6;                                                             //[00284] VAD_6_(VAD_6) = B3A(D_6);
assign VAD_7 = D_7;                                                             //[00285] VAD_7_(VAD_7) = B3A(D_7);

assign SDL_8 = ~((D_8 & SWAP1L)|(D_0 & SWAP1));                                 //[00287] SDL_8_(SDL_8) = AO2A(D_8,SWAP1L,D_0,SWAP1);
assign SDL_9 = ~((D_9 & SWAP1L)|(D_1 & SWAP1));                                 //[00288] SDL_9_(SDL_9) = AO2A(D_9,SWAP1L,D_1,SWAP1);
assign SDL_10 = ~((D_10 & SWAP1L)|(D_2 & SWAP1));                               //[00289] SDL_10_(SDL_10) = AO2A(D_10,SWAP1L,D_2,SWAP1);
assign SDL_11 = ~((D_11 & SWAP1L)|(D_3 & SWAP1));                               //[00290] SDL_11_(SDL_11) = AO2A(D_11,SWAP1L,D_3,SWAP1);
assign SDL_12 = ~((D_12 & SWAP1L)|(D_4 & SWAP1));                               //[00291] SDL_12_(SDL_12) = AO2A(D_12,SWAP1L,D_4,SWAP1);
assign SDL_13 = ~((D_13 & SWAP1L)|(D_5 & SWAP1));                               //[00292] SDL_13_(SDL_13) = AO2A(D_13,SWAP1L,D_5,SWAP1);
assign SDL_14 = ~((D_14 & SWAP1L)|(D_6 & SWAP1));                               //[00293] SDL_14_(SDL_14) = AO2A(D_14,SWAP1L,D_6,SWAP1);
assign SDL_15 = ~((D_15 & SWAP1L)|(D_7 & SWAP1));                               //[00294] SDL_15_(SDL_15) = AO2A(D_15,SWAP1L,D_7,SWAP1);
assign VD_8 = ~SDL_8;                                                           //[00295] VD_8_(VD_8) = N1A(SDL_8);
assign VD_9 = ~SDL_9;                                                           //[00296] VD_9_(VD_9) = N1A(SDL_9);
assign VD_10 = ~SDL_10;                                                         //[00297] VD_10_(VD_10) = N1A(SDL_10);
assign VD_11 = ~SDL_11;                                                         //[00298] VD_11_(VD_11) = N1A(SDL_11);
assign VD_12 = ~SDL_12;                                                         //[00299] VD_12_(VD_12) = N1A(SDL_12);
assign VD_13 = ~SDL_13;                                                         //[00300] VD_13_(VD_13) = N1A(SDL_13);
assign VD_14 = ~SDL_14;                                                         //[00301] VD_14_(VD_14) = N1A(SDL_14);
assign VD_15 = ~SDL_15;                                                         //[00302] VD_15_(VD_15) = N1A(SDL_15);

assign SD_0 = ~((VADL_0 & SWAP2L)|(VDL_8 & SWAP2));                             //[00304] SD_0_(SD_0) = AO2A(VADL_0,SWAP2L,VDL_8,SWAP2);
assign SD_1 = ~((VADL_1 & SWAP2L)|(VDL_9 & SWAP2));                             //[00305] SD_1_(SD_1) = AO2A(VADL_1,SWAP2L,VDL_9,SWAP2);
assign SD_2 = ~((VADL_2 & SWAP2L)|(VDL_10 & SWAP2));                            //[00306] SD_2_(SD_2) = AO2A(VADL_2,SWAP2L,VDL_10,SWAP2);
assign SD_3 = ~((VADL_3 & SWAP2L)|(VDL_11 & SWAP2));                            //[00307] SD_3_(SD_3) = AO2A(VADL_3,SWAP2L,VDL_11,SWAP2);
assign SD_4 = ~((VADL_4 & SWAP2L)|(VDL_12 & SWAP2));                            //[00308] SD_4_(SD_4) = AO2A(VADL_4,SWAP2L,VDL_12,SWAP2);
assign SD_5 = ~((VADL_5 & SWAP2L)|(VDL_13 & SWAP2));                            //[00309] SD_5_(SD_5) = AO2A(VADL_5,SWAP2L,VDL_13,SWAP2);
assign SD_6 = ~((VADL_6 & SWAP2L)|(VDL_14 & SWAP2));                            //[00310] SD_6_(SD_6) = AO2A(VADL_6,SWAP2L,VDL_14,SWAP2);
assign SD_7 = ~((VADL_7 & SWAP2L)|(VDL_15 & SWAP2));                            //[00311] SD_7_(SD_7) = AO2A(VADL_7,SWAP2L,VDL_15,SWAP2);
assign SDL_0 = ~SD_0;                                                           //[00312] SDL_0_(SDL_0) = N1A(SD_0);
assign SDL_1 = ~SD_1;                                                           //[00313] SDL_1_(SDL_1) = N1A(SD_1);
assign SDL_2 = ~SD_2;                                                           //[00314] SDL_2_(SDL_2) = N1A(SD_2);
assign SDL_3 = ~SD_3;                                                           //[00315] SDL_3_(SDL_3) = N1A(SD_3);
assign SDL_4 = ~SD_4;                                                           //[00316] SDL_4_(SDL_4) = N1A(SD_4);
assign SDL_5 = ~SD_5;                                                           //[00317] SDL_5_(SDL_5) = N1A(SD_5);
assign SDL_6 = ~SD_6;                                                           //[00318] SDL_6_(SDL_6) = N1A(SD_6);
assign SDL_7 = ~SD_7;                                                           //[00319] SDL_7_(SDL_7) = N1A(SD_7);

/* SWAP is asserted:-

1) when the host is host is reading or writing to odd SRAM
2) when the coproccesors are reading or writing to odd SRAM and word is clear
3) when the host reads the joysticks
*/

/* decode odd host SRAM accesses */

assign AL_18 = ~A_18;                                                           //[00331] AL_18_(AL_18) = N1A(A_18);
assign AL_19 = ~A_19;                                                           //[00332] AL_19_(AL_19) = N1A(A_19);
assign HODDL = ~(HLDAL & IOML & A_0 & AL_18 & AL_19);                           //[00333] HODDL_(HODDL) = ND5A(HLDAL,IOML,A_0,AL_18,AL_19);
assign HODDRL = RDL | HODDL;                                                    //[00334] HODDRL_(HODDRL) = OR2A(RDL,HODDL);

/* decode odd coproccesor SRAM accesses */

assign CODDL = ~(HLDA & SAENL & A_0 & AL_18 & AL_19 & WORDL);                   //[00338] CODDL_(CODDL) = ND6A(HLDA,SAENL,A_0,AL_18,AL_19,WORDL);

/* decode joystick reads */

assign JOYL = JOYL_0 & JOYL_1;                                                  //[00342] JOYL_(JOYL) = AND2A(JOYL_0,JOYL_1);

assign SWAP = ~(HODDL & CODDL & JOYL);                                          //[00344] SWAP_(SWAP) = ND3A(HODDL,CODDL,JOYL);
assign SWAP1L = ~(SWAP & DEN);                                                  //[00345] SWAP1L_(SWAP1L) = ND2C(SWAP,DEN);
assign SWAP1 = ~SWAP1L;                                                         //[00346] SWAP1_(SWAP1) = N1C(SWAP1L);
assign SWAP2L = ~(SWAP & DENL);                                                 //[00347] SWAP2L_(SWAP2L) = ND2C(SWAP,DENL);
assign SWAP2 = ~SWAP2L;                                                         //[00348] SWAP2_(SWAP2) = N1C(SWAP2L);

/* the low eight data pins are enabled:-

1) when the host is reading internal memory
2) when the host is reading internal IO
3) when the host is reading joysticks
4) when the coprocessors are writing (except during video)
5) during interupt acknowledge
6) when the host is reading odd sram

*/

assign ADEN = ~(HODDRL & SSIMRDL & SSIORDL & JOYL & INTAL & COPWRNVL);          //[00361] ADEN_(ADEN) = ND6B(HODDRL,SSIMRDL,SSIORDL,JOYL,INTAL,COPWRNVL);

/* the high eight data pins are enabled:-

1) when the host is writing to odd SRAM
2) when the coprocessors are writing (except during video)

*/

assign HODDWL = ~(HLDAL & IOML & VWR & A_0 & AL_18 & AL_19);                    //[00370] HODDWL_(HODDWL) = ND6A(HLDAL,IOML,VWR,A_0,AL_18,AL_19);

assign DEN = ~(HODDWL & COPWRNVL);                                              //[00372] DEN_(DEN) = ND2C(HODDWL,COPWRNVL);
assign DENL = ~DEN;                                                             //[00373] DENL_(DENL) = N1A(DEN);

/* buffer host data onto VID write bus */

assign WD_0 = ~(VADL_0 | RESET_6);                                              //[00377] WD_0_(WD_0) = NR2C(VADL_0,RESET_6);
assign WD_1 = ~(VADL_1 | RESET_6);                                              //[00378] WD_1_(WD_1) = NR2C(VADL_1,RESET_6);
assign WD_2 = ~(VADL_2 | RESET_6);                                              //[00379] WD_2_(WD_2) = NR2C(VADL_2,RESET_6);
assign WD_3 = ~(VADL_3 | RESET_6);                                              //[00380] WD_3_(WD_3) = NR2C(VADL_3,RESET_6);
assign WD_4 = ~(VADL_4 | RESET_6);                                              //[00381] WD_4_(WD_4) = NR2C(VADL_4,RESET_6);
assign WD_5 = ~(VADL_5 | RESET_6);                                              //[00382] WD_5_(WD_5) = NR2C(VADL_5,RESET_6);
assign WD_6 = ~(VADL_6 | RESET_6);                                              //[00383] WD_6_(WD_6) = NR2C(VADL_6,RESET_6);
assign WD_7 = ~(VADL_7 | RESET_6);                                              //[00384] WD_7_(WD_7) = NR2C(VADL_7,RESET_6);

/* hold is generated from blitter hold and video hold signals */

assign HOLDL = BHOLDL & VHOLDL;                                                 //[00388] HOLDL_(HOLDL) = AND2A(BHOLDL,VHOLDL);

/* palcs is decoded here */
/* the palette RAM lies between 40000 and 401FF */

assign PR = ~(A_12 | A_13 | A_14 | A_15 | A_16 | A_17 | AL_18 | A_19);          //[00393] PR_(PR) = NR8A(A_12,A_13,A_14,A_15,A_16,A_17,AL_18,A_19);
assign AL_9 = ~A_9;                                                             //[00394] AL_9_(AL_9) = N1A(A_9);
assign AL_10 = ~A_10;                                                           //[00395] AL_10_(AL_10) = N1A(A_10);
assign AL_11 = ~A_11;                                                           //[00396] AL_11_(AL_11) = N1A(A_11);
assign AL_14 = ~A_14;                                                           //[00397] AL_14_(AL_14) = N1A(A_14);

assign PALCSL = ~(PR & IOML & AL_9 & AL_10 & AL_11);                            //[00399] PALCSL_(PALCSL) = ND5A(PR,IOML,AL_9,AL_10,AL_11);
assign PALCS = ~PALCSL;                                                         //[00400] PALCS_(PALCS) = N1C(PALCSL);

/* the dsp lies between 41000 and 41FFF */

assign AL_12 = ~A_12;                                                           //[00404] AL_12_(AL_12) = N1A(A_12);
assign D0 = ~(AL_12 | A_13 | A_14 | A_15 | A_16 | A_17 | AL_18 | A_19);         //[00405] D0_(D0) = NR8A(AL_12,A_13,A_14,A_15,A_16,A_17,AL_18,A_19);
assign DCSL = ~(D0 & IOML & AL_11);                                             //[00406] DCSL_(DCSL) = ND3C(D0,IOML,AL_11);

endmodule                                                                       //[00408] END MODULE;