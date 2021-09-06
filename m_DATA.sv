                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/***************************************************************************
data
15/10/88

Data path of blitter

This section contains the data registers, logic function unit, and data
comparator of the blitter.

***************************************************************************/

module m_DATA                                                                   //[00015] MODULE DATA;
(                                                                               //[00015] MODULE DATA;

    inout    D_0,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_1,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_2,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_3,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_4,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_5,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_6,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_7,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_8,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_9,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_10,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_11,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_12,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_13,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_14,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    inout    D_15,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    input    DAM1L,                                                             //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    DATOEL,                                                            //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    DSTCMP,                                                            //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ICNT_0,                                                            //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ICNT_1,                                                            //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ICNT_2,                                                            //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_0,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_1,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_2,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_3,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_4,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_5,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_6,                                                              //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_7,                                                              //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_8,                                                              //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_9,                                                              //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_10,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_11,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_12,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_13,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_14,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    ID_15,                                                             //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    LDCMPL,                                                            //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    LDDSTL,                                                            //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    LDPATL,                                                            //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
    input    LDMODL,                                                            //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
    input    LDSRCL,                                                            //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
    input    RES_0,                                                             //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
    input    SSWAP,                                                             //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
    input    SRCCMP,                                                            //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
    input    SRCLTOH,                                                           //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
                                                                                //[00018]    DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
                                                                                //[00019]    ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,LDPATL,
                                                                                //[00020]    LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH;
//    output    D_0,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_1,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_2,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_3,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_4,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_5,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_6,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_7,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_8,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_9,                                                            //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_10,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_11,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_12,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_13,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_14,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
//    output    D_15,                                                           //[00021] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
    output    INHIB                                                             //[00022]    INHIB;
);                                                                              //[00015] MODULE DATA;
                                                                                //[00023] LEVEL FUNCTION;
wire SRCD_0;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_1;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_2;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_3;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_4;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_5;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_6;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_7;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_8;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_9;                                                                    //[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
wire SRCD_10;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire SRCD_11;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire SRCD_12;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire SRCD_13;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire SRCD_14;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire SRCD_15;                                                                   //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
wire DSTD_0;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_1;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_2;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_3;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_4;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_5;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_6;                                                                    //[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
wire DSTD_7;                                                                    //[00032]    DSTD_7) = DSTDATA(LDDSTL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7);
wire PATD_0;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_1;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_2;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_3;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_4;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_5;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_6;                                                                    //[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
wire PATD_7;                                                                    //[00035]    PATD_7) = PATDATA(LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7);

m_SRCDATA SRCDATA_ (.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.ID_8(ID_8),.ID_9(ID_9),.ID_10(ID_10),.ID_11(ID_11),.ID_12(ID_12),.ID_13(ID_13),.ID_14(ID_14),.ID_15(ID_15),.LDSRCL(LDSRCL),.SRCLTOH(SRCLTOH),.SSWAP(SSWAP),.SRCD_0(SRCD_0),.SRCD_1(SRCD_1),.SRCD_2(SRCD_2),.SRCD_3(SRCD_3),.SRCD_4(SRCD_4),.SRCD_5(SRCD_5),.SRCD_6(SRCD_6),.SRCD_7(SRCD_7),.SRCD_8(SRCD_8),.SRCD_9(SRCD_9),.SRCD_10(SRCD_10),.SRCD_11(SRCD_11),.SRCD_12(SRCD_12),.SRCD_13(SRCD_13),.SRCD_14(SRCD_14),.SRCD_15(SRCD_15));//[00026] SRCDATA_(SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,SRCD_8,SRCD_9,
                                                                                //[00027]    SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15) = SRCDATA(ID_0,ID_1,ID_2,
                                                                                //[00028]    ID_3,ID_4,ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,
                                                                                //[00029]    LDSRCL,SRCLTOH,SSWAP);

m_DSTDATA DSTDATA_ (.LDDSTL(LDDSTL),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.DSTD_0(DSTD_0),.DSTD_1(DSTD_1),.DSTD_2(DSTD_2),.DSTD_3(DSTD_3),.DSTD_4(DSTD_4),.DSTD_5(DSTD_5),.DSTD_6(DSTD_6),.DSTD_7(DSTD_7));//[00031] DSTDATA_(DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,
                                                                                //[00032]    DSTD_7) = DSTDATA(LDDSTL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7);

m_PATDATA PATDATA_ (.LDPATL(LDPATL),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.PATD_0(PATD_0),.PATD_1(PATD_1),.PATD_2(PATD_2),.PATD_3(PATD_3),.PATD_4(PATD_4),.PATD_5(PATD_5),.PATD_6(PATD_6),.PATD_7(PATD_7));//[00034] PATDATA_(PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,
                                                                                //[00035]    PATD_7) = PATDATA(LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7);

m_COMP COMP_ (.DSTCMP(DSTCMP),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.LDCMPL(LDCMPL),.LDMODL(LDMODL),.SRCD_0(SRCD_0),.SRCD_1(SRCD_1),.SRCD_2(SRCD_2),.SRCD_3(SRCD_3),.SRCD_4(SRCD_4),.SRCD_5(SRCD_5),.SRCD_6(SRCD_6),.SRCD_7(SRCD_7),.DSTD_0(DSTD_0),.DSTD_1(DSTD_1),.DSTD_2(DSTD_2),.DSTD_3(DSTD_3),.DSTD_4(DSTD_4),.DSTD_5(DSTD_5),.DSTD_6(DSTD_6),.DSTD_7(DSTD_7),.PATD_0(PATD_0),.PATD_1(PATD_1),.PATD_2(PATD_2),.PATD_3(PATD_3),.PATD_4(PATD_4),.PATD_5(PATD_5),.PATD_6(PATD_6),.PATD_7(PATD_7),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.DAM1L(DAM1L),.RES_0(RES_0),.SRCCMP(SRCCMP),.INHIB(INHIB));//[00037] COMP_(INHIB) = COMP(DSTCMP,ID_0,ID_1,ID_2,ID_3,LDCMPL,LDMODL,SRCD_0,SRCD_1,
                                                                                //[00038]    SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,
                                                                                //[00039]    DSTD_5,DSTD_6,DSTD_7,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7,
                                                                                //[00040]    ICNT_0,ICNT_1,ICNT_2,DAM1L,RES_0,SRCCMP);

m_LFU LFU_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.D_8(D_8),.D_9(D_9),.D_10(D_10),.D_11(D_11),.D_12(D_12),.D_13(D_13),.D_14(D_14),.D_15(D_15),.DAM1L(DAM1L),.DATOEL(DATOEL),.DSTD_0(DSTD_0),.DSTD_1(DSTD_1),.DSTD_2(DSTD_2),.DSTD_3(DSTD_3),.DSTD_4(DSTD_4),.DSTD_5(DSTD_5),.DSTD_6(DSTD_6),.DSTD_7(DSTD_7),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.LDCMPL(LDCMPL),.LDMODL(LDMODL),.PATD_0(PATD_0),.PATD_1(PATD_1),.PATD_2(PATD_2),.PATD_3(PATD_3),.PATD_4(PATD_4),.PATD_5(PATD_5),.PATD_6(PATD_6),.PATD_7(PATD_7),.RES_0(RES_0),.SRCD_0(SRCD_0),.SRCD_1(SRCD_1),.SRCD_2(SRCD_2),.SRCD_3(SRCD_3),.SRCD_4(SRCD_4),.SRCD_5(SRCD_5),.SRCD_6(SRCD_6),.SRCD_7(SRCD_7),.SRCD_8(SRCD_8),.SRCD_9(SRCD_9),.SRCD_10(SRCD_10),.SRCD_11(SRCD_11),.SRCD_12(SRCD_12),.SRCD_13(SRCD_13),.SRCD_14(SRCD_14),.SRCD_15(SRCD_15));//[00043] LFU_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,
                                                                                //[00044]    D_15) = LFU(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,
                                                                                //[00045]    D_15,DAM1L,DATOEL,DSTD_0,DSTD_1,DSTD_2,DSTD_3,DSTD_4,DSTD_5,DSTD_6,DSTD_7,
                                                                                //[00046]    ID_4,ID_5,ID_6,ID_7,LDCMPL,LDMODL,PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,
                                                                                //[00047]    PATD_6,PATD_7,RES_0,SRCD_0,SRCD_1,SRCD_2,SRCD_3,SRCD_4,SRCD_5,SRCD_6,SRCD_7,
                                                                                //[00048]    SRCD_8,SRCD_9,SRCD_10,SRCD_11,SRCD_12,SRCD_13,SRCD_14,SRCD_15);

endmodule                                                                       //[00050] END MODULE;