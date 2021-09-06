                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
lfu
19/10/88

Blitter data logic function unit

This unit selects the data to be output during a write cycle.  This may be
taken from the source data, the destination data, or the pattern data.  In
sixteen bit mode the high byte is always the source data.

****************************************************************************/

module m_LFU                                                                    //[00016] MODULE LFU;
(                                                                               //[00016] MODULE LFU;

    inout    D_0,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_1,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_2,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_3,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_4,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_5,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_6,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_7,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_8,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_9,                                                               //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_10,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_11,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_12,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_13,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_14,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_15,                                                              //[00018] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    input    DAM1L,                                                             //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DATOEL,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_0,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_1,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_2,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_3,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_4,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_5,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_6,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    DSTD_7,                                                            //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    ID_4,                                                              //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
    input    ID_5,                                                              //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    ID_6,                                                              //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    ID_7,                                                              //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    LDCMPL,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    LDMODL,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_0,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_1,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_2,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_3,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_4,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_5,                                                            //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
    input    PATD_6,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    PATD_7,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    RES_0,                                                             //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_0,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_1,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_2,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_3,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_4,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_5,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_6,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_7,                                                            //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
    input    SRCD_8,                                                            //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_9,                                                            //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_10,                                                           //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_11,                                                           //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_12,                                                           //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_13,                                                           //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_14,                                                           //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
    input    SRCD_15                                                            //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
                                                                                //[00019]    DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,ID_4,
                                                                                //[00020]    ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
                                                                                //[00021]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
                                                                                //[00022]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15;
//    output    D_0,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_1,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_2,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_3,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_4,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_5,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_6,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_7,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_8,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_9,                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_10,                                                           //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_11,                                                           //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_12,                                                           //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_13,                                                           //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_14,                                                           //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
//    output    D_15                                                            //[00023] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15;
);                                                                              //[00016] MODULE LFU;
                                                                                //[00024] LEVEL FUNCTION;
wire RESL_0;                                                                    //[00027] RESL_0_(RESL_0) = N1A(RES_0);
wire LFUC_0;                                                                    //[00031] LFUCL_0_(LFUC_0,LFUCL_0) = LD2A(ID_4,LDCMPL);
wire LFUCL_0;                                                                   //[00031] LFUCL_0_(LFUC_0,LFUCL_0) = LD2A(ID_4,LDCMPL);
wire LFUC_1;                                                                    //[00032] LFUCL_1_(LFUC_1,LFUCL_1) = LD2A(ID_5,LDCMPL);
wire LFUCL_1;                                                                   //[00032] LFUCL_1_(LFUC_1,LFUCL_1) = LD2A(ID_5,LDCMPL);
wire LFUC_2;                                                                    //[00033] LFUCL_2_(LFUC_2,LFUCL_2) = LD2A(ID_6,LDCMPL);
wire LFUCL_2;                                                                   //[00033] LFUCL_2_(LFUC_2,LFUCL_2) = LD2A(ID_6,LDCMPL);
wire LFUC_3;                                                                    //[00034] LFUCL_3_(LFUC_3,LFUCL_3) = LD2A(ID_7,LDCMPL);
wire LFUCL_3;                                                                   //[00034] LFUCL_3_(LFUC_3,LFUCL_3) = LD2A(ID_7,LDCMPL);
wire PATSEL;                                                                    //[00035] PATSEL_(PATSEL,PATSELL) = LD2A(ID_7,LDMODL);
wire PATSELL;                                                                   //[00035] PATSEL_(PATSEL,PATSELL) = LD2A(ID_7,LDMODL);
wire PSD_0;                                                                     //[00039] PSMUX_0_(PSD_0) = MUX2(SRCD_0,PATSELL,PATD_0,PATSEL);
wire PSD_1;                                                                     //[00040] PSMUX_1_(PSD_1) = MUX2(SRCD_1,PATSELL,PATD_1,PATSEL);
wire PSD_2;                                                                     //[00041] PSMUX_2_(PSD_2) = MUX2(SRCD_2,PATSELL,PATD_2,PATSEL);
wire PSD_3;                                                                     //[00042] PSMUX_3_(PSD_3) = MUX2(SRCD_3,PATSELL,PATD_3,PATSEL);
wire PSD_4;                                                                     //[00043] PSMUX_4_(PSD_4) = MUX2(SRCD_4,PATSELL,PATD_4,PATSEL);
wire PSD_5;                                                                     //[00044] PSMUX_5_(PSD_5) = MUX2(SRCD_5,PATSELL,PATD_5,PATSEL);
wire PSD_6;                                                                     //[00045] PSMUX_6_(PSD_6) = MUX2(SRCD_6,PATSELL,PATD_6,PATSEL);
wire PSD_7;                                                                     //[00046] PSMUX_7_(PSD_7) = MUX2(SRCD_7,PATSELL,PATD_7,PATSEL);
wire FD_0;                                                                      //[00050] LFU_0_(FD_0) = LFUBIT(PSD_0,DSTD_0,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_1;                                                                      //[00051] LFU_1_(FD_1) = LFUBIT(PSD_1,DSTD_1,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_2;                                                                      //[00052] LFU_2_(FD_2) = LFUBIT(PSD_2,DSTD_2,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_3;                                                                      //[00053] LFU_3_(FD_3) = LFUBIT(PSD_3,DSTD_3,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_4;                                                                      //[00054] LFU_4_(FD_4) = LFUBIT(PSD_4,DSTD_4,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_5;                                                                      //[00055] LFU_5_(FD_5) = LFUBIT(PSD_5,DSTD_5,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_6;                                                                      //[00056] LFU_6_(FD_6) = LFUBIT(PSD_6,DSTD_6,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire FD_7;                                                                      //[00057] LFU_7_(FD_7) = LFUBIT(PSD_7,DSTD_7,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
wire LODSELL;                                                                   //[00061] HRHDINV_(LODSEL,HIDSELL) = MACINV2(LODSELL,HIDSEL);
wire HIDSEL;                                                                    //[00061] HRHDINV_(LODSEL,HIDSELL) = MACINV2(LODSELL,HIDSEL);
wire LODSEL;                                                                    //[00061] HRHDINV_(LODSEL,HIDSELL) = MACINV2(LODSELL,HIDSEL);
wire HIDSELL;                                                                   //[00061] HRHDINV_(LODSEL,HIDSELL) = MACINV2(LODSELL,HIDSEL);
wire DAM1;                                                                      //[00062] DAM1_(DAM1) = N1A(DAM1L);
wire FDOL_0;                                                                    //[00065] LFDOMUX_0_(FDOL_0) = AO2A(LODSEL,DSTD_0,LODSELL,FD_0);
wire FDOL_1;                                                                    //[00066] LFDOMUX_1_(FDOL_1) = AO2A(LODSEL,DSTD_1,LODSELL,FD_1);
wire FDOL_2;                                                                    //[00067] LFDOMUX_2_(FDOL_2) = AO2A(LODSEL,DSTD_2,LODSELL,FD_2);
wire FDOL_3;                                                                    //[00068] LFDOMUX_3_(FDOL_3) = AO2A(LODSEL,DSTD_3,LODSELL,FD_3);
wire FDOL_4;                                                                    //[00069] LFDOMUX_4_(FDOL_4) = AO2A(HIDSEL,DSTD_4,HIDSELL,FD_4);
wire FDOL_5;                                                                    //[00070] LFDOMUX_5_(FDOL_5) = AO2A(HIDSEL,DSTD_5,HIDSELL,FD_5);
wire FDOL_6;                                                                    //[00071] LFDOMUX_6_(FDOL_6) = AO2A(HIDSEL,DSTD_6,HIDSELL,FD_6);
wire FDOL_7;                                                                    //[00072] LFDOMUX_7_(FDOL_7) = AO2A(HIDSEL,DSTD_7,HIDSELL,FD_7);
wire DATOE;                                                                     //[00076] DATOE_(DATOE) = N1C(DATOEL);

assign RESL_0 = ~RES_0;                                                         //[00027] RESL_0_(RESL_0) = N1A(RES_0);

/* LFU Control bits */

LD2A LFUCL_0__inst (.q(LFUC_0),.qL(LFUCL_0),.d(ID_4),.en(LDCMPL));              //[00031] LFUCL_0_(LFUC_0,LFUCL_0) = LD2A(ID_4,LDCMPL);
LD2A LFUCL_1__inst (.q(LFUC_1),.qL(LFUCL_1),.d(ID_5),.en(LDCMPL));              //[00032] LFUCL_1_(LFUC_1,LFUCL_1) = LD2A(ID_5,LDCMPL);
LD2A LFUCL_2__inst (.q(LFUC_2),.qL(LFUCL_2),.d(ID_6),.en(LDCMPL));              //[00033] LFUCL_2_(LFUC_2,LFUCL_2) = LD2A(ID_6,LDCMPL);
LD2A LFUCL_3__inst (.q(LFUC_3),.qL(LFUCL_3),.d(ID_7),.en(LDCMPL));              //[00034] LFUCL_3_(LFUC_3,LFUCL_3) = LD2A(ID_7,LDCMPL);
LD2A PATSEL__inst (.q(PATSEL),.qL(PATSELL),.d(ID_7),.en(LDMODL));               //[00035] PATSEL_(PATSEL,PATSELL) = LD2A(ID_7,LDMODL);

/* Select between pattern data and source data */

assign PSD_0 = ~((~(SRCD_0 & PATSELL)) & (~(PATD_0 & PATSEL)));                 //[00039] PSMUX_0_(PSD_0) = MUX2(SRCD_0,PATSELL,PATD_0,PATSEL);
assign PSD_1 = ~((~(SRCD_1 & PATSELL)) & (~(PATD_1 & PATSEL)));                 //[00040] PSMUX_1_(PSD_1) = MUX2(SRCD_1,PATSELL,PATD_1,PATSEL);
assign PSD_2 = ~((~(SRCD_2 & PATSELL)) & (~(PATD_2 & PATSEL)));                 //[00041] PSMUX_2_(PSD_2) = MUX2(SRCD_2,PATSELL,PATD_2,PATSEL);
assign PSD_3 = ~((~(SRCD_3 & PATSELL)) & (~(PATD_3 & PATSEL)));                 //[00042] PSMUX_3_(PSD_3) = MUX2(SRCD_3,PATSELL,PATD_3,PATSEL);
assign PSD_4 = ~((~(SRCD_4 & PATSELL)) & (~(PATD_4 & PATSEL)));                 //[00043] PSMUX_4_(PSD_4) = MUX2(SRCD_4,PATSELL,PATD_4,PATSEL);
assign PSD_5 = ~((~(SRCD_5 & PATSELL)) & (~(PATD_5 & PATSEL)));                 //[00044] PSMUX_5_(PSD_5) = MUX2(SRCD_5,PATSELL,PATD_5,PATSEL);
assign PSD_6 = ~((~(SRCD_6 & PATSELL)) & (~(PATD_6 & PATSEL)));                 //[00045] PSMUX_6_(PSD_6) = MUX2(SRCD_6,PATSELL,PATD_6,PATSEL);
assign PSD_7 = ~((~(SRCD_7 & PATSELL)) & (~(PATD_7 & PATSEL)));                 //[00046] PSMUX_7_(PSD_7) = MUX2(SRCD_7,PATSELL,PATD_7,PATSEL);

/* Logic Function Unit */

LFUBIT LFU_0__inst (.DOUT(FD_0),.SRCD(PSD_0),.DSTD(DSTD_0),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00050] LFU_0_(FD_0) = LFUBIT(PSD_0,DSTD_0,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_1__inst (.DOUT(FD_1),.SRCD(PSD_1),.DSTD(DSTD_1),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00051] LFU_1_(FD_1) = LFUBIT(PSD_1,DSTD_1,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_2__inst (.DOUT(FD_2),.SRCD(PSD_2),.DSTD(DSTD_2),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00052] LFU_2_(FD_2) = LFUBIT(PSD_2,DSTD_2,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_3__inst (.DOUT(FD_3),.SRCD(PSD_3),.DSTD(DSTD_3),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00053] LFU_3_(FD_3) = LFUBIT(PSD_3,DSTD_3,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_4__inst (.DOUT(FD_4),.SRCD(PSD_4),.DSTD(DSTD_4),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00054] LFU_4_(FD_4) = LFUBIT(PSD_4,DSTD_4,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_5__inst (.DOUT(FD_5),.SRCD(PSD_5),.DSTD(DSTD_5),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00055] LFU_5_(FD_5) = LFUBIT(PSD_5,DSTD_5,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_6__inst (.DOUT(FD_6),.SRCD(PSD_6),.DSTD(DSTD_6),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00056] LFU_6_(FD_6) = LFUBIT(PSD_6,DSTD_6,LFUC_0,LFUC_1,LFUC_2,LFUC_3);
LFUBIT LFU_7__inst (.DOUT(FD_7),.SRCD(PSD_7),.DSTD(DSTD_7),.LFUC_0(LFUC_0),.LFUC_1(LFUC_1),.LFUC_2(LFUC_2),.LFUC_3(LFUC_3));//[00057] LFU_7_(FD_7) = LFUBIT(PSD_7,DSTD_7,LFUC_0,LFUC_1,LFUC_2,LFUC_3);

/* Select LFU output or unchanged destination data for hires or lores */

assign LODSEL = ~LODSELL; assign HIDSELL = ~HIDSEL;                             //[00061] HRHDINV_(LODSEL,HIDSELL) = MACINV2(LODSELL,HIDSEL);
assign DAM1 = ~DAM1L;                                                           //[00062] DAM1_(DAM1) = N1A(DAM1L);
assign LODSELL = ~(RESL_0 & DAM1);                                              //[00063] LODGEN_(LODSELL) = ND2A(RESL_0,DAM1);
assign HIDSEL = ~(RES_0 | DAM1);                                                //[00064] HIDGEN_(HIDSEL) = NR2A(RES_0,DAM1);
assign FDOL_0 = ~((LODSEL & DSTD_0)|(LODSELL & FD_0));                          //[00065] LFDOMUX_0_(FDOL_0) = AO2A(LODSEL,DSTD_0,LODSELL,FD_0);
assign FDOL_1 = ~((LODSEL & DSTD_1)|(LODSELL & FD_1));                          //[00066] LFDOMUX_1_(FDOL_1) = AO2A(LODSEL,DSTD_1,LODSELL,FD_1);
assign FDOL_2 = ~((LODSEL & DSTD_2)|(LODSELL & FD_2));                          //[00067] LFDOMUX_2_(FDOL_2) = AO2A(LODSEL,DSTD_2,LODSELL,FD_2);
assign FDOL_3 = ~((LODSEL & DSTD_3)|(LODSELL & FD_3));                          //[00068] LFDOMUX_3_(FDOL_3) = AO2A(LODSEL,DSTD_3,LODSELL,FD_3);
assign FDOL_4 = ~((HIDSEL & DSTD_4)|(HIDSELL & FD_4));                          //[00069] LFDOMUX_4_(FDOL_4) = AO2A(HIDSEL,DSTD_4,HIDSELL,FD_4);
assign FDOL_5 = ~((HIDSEL & DSTD_5)|(HIDSELL & FD_5));                          //[00070] LFDOMUX_5_(FDOL_5) = AO2A(HIDSEL,DSTD_5,HIDSELL,FD_5);
assign FDOL_6 = ~((HIDSEL & DSTD_6)|(HIDSELL & FD_6));                          //[00071] LFDOMUX_6_(FDOL_6) = AO2A(HIDSEL,DSTD_6,HIDSELL,FD_6);
assign FDOL_7 = ~((HIDSEL & DSTD_7)|(HIDSELL & FD_7));                          //[00072] LFDOMUX_7_(FDOL_7) = AO2A(HIDSEL,DSTD_7,HIDSELL,FD_7);

/* Drive the output data onto the data bus */

assign DATOE = ~DATOEL;                                                         //[00076] DATOE_(DATOE) = N1C(DATOEL);
assign D_0 = DATOE ? (~FDOL_0) : 1'bZ;                                          //[00077] LFDRIV_0_(D_0) = BTS5A(FDOL_0,DATOE);
assign D_1 = DATOE ? (~FDOL_1) : 1'bZ;                                          //[00078] LFDRIV_1_(D_1) = BTS5A(FDOL_1,DATOE);
assign D_2 = DATOE ? (~FDOL_2) : 1'bZ;                                          //[00079] LFDRIV_2_(D_2) = BTS5A(FDOL_2,DATOE);
assign D_3 = DATOE ? (~FDOL_3) : 1'bZ;                                          //[00080] LFDRIV_3_(D_3) = BTS5A(FDOL_3,DATOE);
assign D_4 = DATOE ? (~FDOL_4) : 1'bZ;                                          //[00081] LFDRIV_4_(D_4) = BTS5A(FDOL_4,DATOE);
assign D_5 = DATOE ? (~FDOL_5) : 1'bZ;                                          //[00082] LFDRIV_5_(D_5) = BTS5A(FDOL_5,DATOE);
assign D_6 = DATOE ? (~FDOL_6) : 1'bZ;                                          //[00083] LFDRIV_6_(D_6) = BTS5A(FDOL_6,DATOE);
assign D_7 = DATOE ? (~FDOL_7) : 1'bZ;                                          //[00084] LFDRIV_7_(D_7) = BTS5A(FDOL_7,DATOE);
assign D_8 = DATOE ? SRCD_8 : 1'bZ;                                             //[00085] LFDRIV_8_(D_8) = BTS4A(SRCD_8,DATOE);
assign D_9 = DATOE ? SRCD_9 : 1'bZ;                                             //[00086] LFDRIV_9_(D_9) = BTS4A(SRCD_9,DATOE);
assign D_10 = DATOE ? SRCD_10 : 1'bZ;                                           //[00087] LFDRIV_10_(D_10) = BTS4A(SRCD_10,DATOE);
assign D_11 = DATOE ? SRCD_11 : 1'bZ;                                           //[00088] LFDRIV_11_(D_11) = BTS4A(SRCD_11,DATOE);
assign D_12 = DATOE ? SRCD_12 : 1'bZ;                                           //[00089] LFDRIV_12_(D_12) = BTS4A(SRCD_12,DATOE);
assign D_13 = DATOE ? SRCD_13 : 1'bZ;                                           //[00090] LFDRIV_13_(D_13) = BTS4A(SRCD_13,DATOE);
assign D_14 = DATOE ? SRCD_14 : 1'bZ;                                           //[00091] LFDRIV_14_(D_14) = BTS4A(SRCD_14,DATOE);
assign D_15 = DATOE ? SRCD_15 : 1'bZ;                                           //[00092] LFDRIV_15_(D_15) = BTS4A(SRCD_15,DATOE);

endmodule                                                                       //[00094] END MODULE;