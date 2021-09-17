                                                                               //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
srcareg
15/10/88

Source Address Register

The register is loaded in byte chunks by ldsaL[0-2], or as a whole by
upsldL.  The selection between input data and adder output is given by
sdasel.

This register also contains the addback mechanism, which adds the contents
of bits 16 and 8-15 to bits -1 and 0-7.  The signal addback is active for
the cycle in which this occurs, and addbld is used to load the appropriate
register bit.  This must only be active in the second half of the cycle as
the source register may already have been loaded in the first half.

****************************************************************************/

module m_SRCAREG                                                                //[00022] MODULE SRCAREG;
(                                                                               //[00022] MODULE SRCAREG;

    input    inD_0,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_1,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_2,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_3,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_4,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_5,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_6,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    inD_7,                                                               //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDBACKL,                                                          //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDBLDL,                                                           //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDQ_0,                                                            //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDQ_1,                                                            //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDQ_2,                                                            //[00024] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADDQ_0,ADDQ_1,ADDQ_2,
    input    ADDQ_3,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_4,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_5,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_6,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_7,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_8,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_9,                                                            //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_10,                                                           //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_11,                                                           //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_12,                                                           //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
    input    ADDQ_13,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_14,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_15,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_16,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_17,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_18,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQ_19,                                                           //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ADDQM1,                                                            //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ID_0,                                                              //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ID_1,                                                              //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
    input    ID_2,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    ID_3,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    ID_4,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    ID_5,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    ID_6,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    ID_7,                                                              //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    LDSAL_0,                                                           //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    LDSAL_1,                                                           //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    LDSAL_2,                                                           //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    SDASEL,                                                            //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    SRCRDL_0,                                                          //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
    input    SRCRDL_1,                                                          //[00028]    SRCRDL_1,SRCRDL_2,UPSLDL;
    input    SRCRDL_2,                                                          //[00028]    SRCRDL_1,SRCRDL_2,UPSLDL;
    input    UPSLDL,                                                            //[00028]    SRCRDL_1,SRCRDL_2,UPSLDL;
                                                                                //[00025]    ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,
                                                                                //[00026]    ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,ADDQ_18,ADDQ_19,ADDQM1,ID_0,ID_1,
                                                                                //[00027]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDSAL_0,LDSAL_1,LDSAL_2,SDASEL,SRCRDL_0,
                                                                                //[00028]    SRCRDL_1,SRCRDL_2,UPSLDL;
    output    outD_0,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_1,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_2,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_3,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_4,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_5,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_6,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    outD_7,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_0,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_1,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_2,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_3,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_4,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_5,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_6,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    enD_7,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_0,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_1,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_2,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_3,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_4,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_5,                                                            //[00029] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,
    output    SAL_6,                                                            //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_7,                                                            //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_8,                                                            //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_9,                                                            //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_10,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_11,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_12,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_13,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_14,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_15,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_16,                                                           //[00030]    SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,
    output    SAL_17,                                                           //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SAL_18,                                                           //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SAL_19,                                                           //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SAM1L,                                                            //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SRCCMP,                                                           //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SSIGN,                                                            //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
    output    SWRAP                                                             //[00031]    SAL_17,SAL_18,SAL_19,SAM1L,SRCCMP,SSIGN,SWRAP;
);                                                                              //[00022] MODULE SRCAREG;
                                                                                //[00032] LEVEL FUNCTION;
wire ADDBACK;                                                                   //[00035] ADDBACK_(ADDBACK) = N1C(ADDBACKL);
wire SLDM1L;                                                                    //[00039] SLDM1_(SLDM1L) = AND3A(LDSAL_2,UPSLDL,ADDBLDL);
wire SLDL_0;                                                                    //[00040] SLD_0_(SLDL_0) = AND3C(LDSAL_0,UPSLDL,ADDBLDL);
wire SLDL_1;                                                                    //[00041] SLD_1_(SLDL_1) = AND2C(LDSAL_1,UPSLDL);
wire SLDL_2;                                                                    //[00042] SLD_2_(SLDL_2) = AND2C(LDSAL_2,UPSLDL);
wire SAM1;                                                                      //[00046] LADDM1_(LAQM1,CARRY_0) = HALFADD(SAM1,SA_16);
wire SA_16;                                                                     //[00046] LADDM1_(LAQM1,CARRY_0) = HALFADD(SAM1,SA_16);
wire LAQM1;                                                                     //[00046] LADDM1_(LAQM1,CARRY_0) = HALFADD(SAM1,SA_16);
wire CARRY_0;                                                                   //[00046] LADDM1_(LAQM1,CARRY_0) = HALFADD(SAM1,SA_16);
wire SA_8;                                                                      //[00047] LADD_0_(LAQ_0,CARRY_1) = FULLADD(SA_8,SA_0,CARRY_0);
wire SA_0;                                                                      //[00047] LADD_0_(LAQ_0,CARRY_1) = FULLADD(SA_8,SA_0,CARRY_0);
wire LAQ_0;                                                                     //[00047] LADD_0_(LAQ_0,CARRY_1) = FULLADD(SA_8,SA_0,CARRY_0);
wire CARRY_1;                                                                   //[00047] LADD_0_(LAQ_0,CARRY_1) = FULLADD(SA_8,SA_0,CARRY_0);
wire SA_9;                                                                      //[00048] LADD_1_(LAQ_1,CARRY_2) = FULLADD(SA_9,SA_1,CARRY_1);
wire SA_1;                                                                      //[00048] LADD_1_(LAQ_1,CARRY_2) = FULLADD(SA_9,SA_1,CARRY_1);
wire LAQ_1;                                                                     //[00048] LADD_1_(LAQ_1,CARRY_2) = FULLADD(SA_9,SA_1,CARRY_1);
wire CARRY_2;                                                                   //[00048] LADD_1_(LAQ_1,CARRY_2) = FULLADD(SA_9,SA_1,CARRY_1);
wire SA_10;                                                                     //[00049] LADD_2_(LAQ_2,CARRY_3) = FULLADD(SA_10,SA_2,CARRY_2);
wire SA_2;                                                                      //[00049] LADD_2_(LAQ_2,CARRY_3) = FULLADD(SA_10,SA_2,CARRY_2);
wire LAQ_2;                                                                     //[00049] LADD_2_(LAQ_2,CARRY_3) = FULLADD(SA_10,SA_2,CARRY_2);
wire CARRY_3;                                                                   //[00049] LADD_2_(LAQ_2,CARRY_3) = FULLADD(SA_10,SA_2,CARRY_2);
wire SA_11;                                                                     //[00050] LADD_3_(LAQ_3,CARRY_4) = FULLADD(SA_11,SA_3,CARRY_3);
wire SA_3;                                                                      //[00050] LADD_3_(LAQ_3,CARRY_4) = FULLADD(SA_11,SA_3,CARRY_3);
wire LAQ_3;                                                                     //[00050] LADD_3_(LAQ_3,CARRY_4) = FULLADD(SA_11,SA_3,CARRY_3);
wire CARRY_4;                                                                   //[00050] LADD_3_(LAQ_3,CARRY_4) = FULLADD(SA_11,SA_3,CARRY_3);
wire SA_12;                                                                     //[00051] LADD_4_(LAQ_4,CARRY_5) = FULLADD(SA_12,SA_4,CARRY_4);
wire SA_4;                                                                      //[00051] LADD_4_(LAQ_4,CARRY_5) = FULLADD(SA_12,SA_4,CARRY_4);
wire LAQ_4;                                                                     //[00051] LADD_4_(LAQ_4,CARRY_5) = FULLADD(SA_12,SA_4,CARRY_4);
wire CARRY_5;                                                                   //[00051] LADD_4_(LAQ_4,CARRY_5) = FULLADD(SA_12,SA_4,CARRY_4);
wire SA_13;                                                                     //[00052] LADD_5_(LAQ_5,CARRY_6) = FULLADD(SA_13,SA_5,CARRY_5);
wire SA_5;                                                                      //[00052] LADD_5_(LAQ_5,CARRY_6) = FULLADD(SA_13,SA_5,CARRY_5);
wire LAQ_5;                                                                     //[00052] LADD_5_(LAQ_5,CARRY_6) = FULLADD(SA_13,SA_5,CARRY_5);
wire CARRY_6;                                                                   //[00052] LADD_5_(LAQ_5,CARRY_6) = FULLADD(SA_13,SA_5,CARRY_5);
wire SA_14;                                                                     //[00053] LADD_6_(LAQ_6,CARRY_7) = FULLADD(SA_14,SA_6,CARRY_6);
wire SA_6;                                                                      //[00053] LADD_6_(LAQ_6,CARRY_7) = FULLADD(SA_14,SA_6,CARRY_6);
wire LAQ_6;                                                                     //[00053] LADD_6_(LAQ_6,CARRY_7) = FULLADD(SA_14,SA_6,CARRY_6);
wire CARRY_7;                                                                   //[00053] LADD_6_(LAQ_6,CARRY_7) = FULLADD(SA_14,SA_6,CARRY_6);
wire SA_15;                                                                     //[00054] LADD_7_(LAQ_7,CARRY_8) = FULLADD(SA_15,SA_7,CARRY_7);
wire SA_7;                                                                      //[00054] LADD_7_(LAQ_7,CARRY_8) = FULLADD(SA_15,SA_7,CARRY_7);
wire LAQ_7;                                                                     //[00054] LADD_7_(LAQ_7,CARRY_8) = FULLADD(SA_15,SA_7,CARRY_7);
wire CARRY_8;                                                                   //[00054] LADD_7_(LAQ_7,CARRY_8) = FULLADD(SA_15,SA_7,CARRY_7);
wire SDASELL;                                                                   //[00058] SDASELL_(SDASELL) = N1B(SDASEL);
wire ADDSEL;                                                                    //[00059] ADDSEL_(ADDSEL) = NR2C(SDASELL,ADDBACK);
wire DATSEL;                                                                    //[00060] DATSEL_(DATSEL) = NR2C(SDASEL,ADDBACK);
wire SIM1;                                                                      //[00062] SMUXM1_(SIM1) = AO11A(ADDBACK,LAQM1,ADDSEL,ADDQM1,DATSEL,ID_7);
wire SI_0;                                                                      //[00063] SMUX_0_(SI_0) = AO11A(ADDBACK,LAQ_0,ADDSEL,ADDQ_0,DATSEL,ID_0);
wire SI_1;                                                                      //[00064] SMUX_1_(SI_1) = AO11A(ADDBACK,LAQ_1,ADDSEL,ADDQ_1,DATSEL,ID_1);
wire SI_2;                                                                      //[00065] SMUX_2_(SI_2) = AO11A(ADDBACK,LAQ_2,ADDSEL,ADDQ_2,DATSEL,ID_2);
wire SI_3;                                                                      //[00066] SMUX_3_(SI_3) = AO11A(ADDBACK,LAQ_3,ADDSEL,ADDQ_3,DATSEL,ID_3);
wire SI_4;                                                                      //[00067] SMUX_4_(SI_4) = AO11A(ADDBACK,LAQ_4,ADDSEL,ADDQ_4,DATSEL,ID_4);
wire SI_5;                                                                      //[00068] SMUX_5_(SI_5) = AO11A(ADDBACK,LAQ_5,ADDSEL,ADDQ_5,DATSEL,ID_5);
wire SI_6;                                                                      //[00069] SMUX_6_(SI_6) = AO11A(ADDBACK,LAQ_6,ADDSEL,ADDQ_6,DATSEL,ID_6);
wire SI_7;                                                                      //[00070] SMUX_7_(SI_7) = AO11A(ADDBACK,LAQ_7,ADDSEL,ADDQ_7,DATSEL,ID_7);
wire SI_8;                                                                      //[00071] SMUX_8_(SI_8) = AO2A(SDASEL,ADDQ_8,SDASELL,ID_0);
wire SI_9;                                                                      //[00072] SMUX_9_(SI_9) = AO2A(SDASEL,ADDQ_9,SDASELL,ID_1);
wire SI_10;                                                                     //[00073] SMUX_10_(SI_10) = AO2A(SDASEL,ADDQ_10,SDASELL,ID_2);
wire SI_11;                                                                     //[00074] SMUX_11_(SI_11) = AO2A(SDASEL,ADDQ_11,SDASELL,ID_3);
wire SI_12;                                                                     //[00075] SMUX_12_(SI_12) = AO2A(SDASEL,ADDQ_12,SDASELL,ID_4);
wire SI_13;                                                                     //[00076] SMUX_13_(SI_13) = AO2A(SDASEL,ADDQ_13,SDASELL,ID_5);
wire SI_14;                                                                     //[00077] SMUX_14_(SI_14) = AO2A(SDASEL,ADDQ_14,SDASELL,ID_6);
wire SI_15;                                                                     //[00078] SMUX_15_(SI_15) = AO2A(SDASEL,ADDQ_15,SDASELL,ID_7);
wire SI_16;                                                                     //[00079] SMUX_16_(SI_16) = AO2A(SDASEL,ADDQ_16,SDASELL,ID_0);
wire SI_17;                                                                     //[00080] SMUX_17_(SI_17) = AO2A(SDASEL,ADDQ_17,SDASELL,ID_1);
wire SI_18;                                                                     //[00081] SMUX_18_(SI_18) = AO2A(SDASEL,ADDQ_18,SDASELL,ID_2);
wire SI_19;                                                                     //[00082] SMUX_19_(SI_19) = AO2A(SDASEL,ADDQ_19,SDASELL,ID_3);
wire SA_17;                                                                     //[00104] SALATCH_17_(SAL_17,SA_17) = FD1A(SI_17,SLDL_2);
wire SA_18;                                                                     //[00105] SALATCH_18_(SAL_18,SA_18) = FD1A(SI_18,SLDL_2);
wire SA_19;                                                                     //[00106] SALATCH_19_(SAL_19,SA_19) = FD1A(SI_19,SLDL_2);
wire SRCCMPL;                                                                   //[00111] SRCCMP_(SRCCMP,SRCCMPL) = LD2A(ID_4,LDSAL_2);
wire SWRAPL;                                                                    //[00112] SWRAP_(SWRAP,SWRAPL) = LD2A(ID_5,LDSAL_2);
wire SSIGNL;                                                                    //[00113] SSIGN_(SSIGN,SSIGNL) = LD2A(ID_6,LDSAL_2);
wire SRCRD_0;                                                                   //[00117] SIOINV_0_(SRCRD_0) = N1A(SRCRDL_0);
wire SRCRD_1;                                                                   //[00118] SIOINV_1_(SRCRD_1) = N1A(SRCRDL_1);
wire SRCRD_2;                                                                   //[00119] SIOINV_2_(SRCRD_2) = N1A(SRCRDL_2);
wire SAR_0;                                                                     //[00120] SARSEL1_0_(SAR_0) = MUX2(SA_0,SRCRD_0,SA_8,SRCRD_1);
wire SAR_1;                                                                     //[00121] SARSEL1_1_(SAR_1) = MUX2(SA_1,SRCRD_0,SA_9,SRCRD_1);
wire SAR_2;                                                                     //[00122] SARSEL1_2_(SAR_2) = MUX2(SA_2,SRCRD_0,SA_10,SRCRD_1);
wire SAR_3;                                                                     //[00123] SARSEL1_3_(SAR_3) = MUX2(SA_3,SRCRD_0,SA_11,SRCRD_1);
wire SAR_4;                                                                     //[00124] SARSEL1_4_(SAR_4) = MUX2(SA_4,SRCRD_0,SA_12,SRCRD_1);
wire SAR_5;                                                                     //[00125] SARSEL1_5_(SAR_5) = MUX2(SA_5,SRCRD_0,SA_13,SRCRD_1);
wire SAR_6;                                                                     //[00126] SARSEL1_6_(SAR_6) = MUX2(SA_6,SRCRD_0,SA_14,SRCRD_1);
wire SAR_7;                                                                     //[00127] SARSEL1_7_(SAR_7) = MUX2(SA_7,SRCRD_0,SA_15,SRCRD_1);
wire SAS_0;                                                                     //[00128] SARSEL2_0_(SAS_0) = AO2A(SA_16,SRCRD_2,SAR_0,SRCRDL_2);
wire SAS_1;                                                                     //[00129] SARSEL2_1_(SAS_1) = AO2A(SA_17,SRCRD_2,SAR_1,SRCRDL_2);
wire SAS_2;                                                                     //[00130] SARSEL2_2_(SAS_2) = AO2A(SA_18,SRCRD_2,SAR_2,SRCRDL_2);
wire SAS_3;                                                                     //[00131] SARSEL2_3_(SAS_3) = AO2A(SA_19,SRCRD_2,SAR_3,SRCRDL_2);
wire SAS_4;                                                                     //[00132] SARSEL2_4_(SAS_4) = ND2A(SAR_4,SRCRDL_2);
wire SAS_5;                                                                     //[00133] SARSEL2_5_(SAS_5) = ND2A(SAR_5,SRCRDL_2);
wire SAS_6;                                                                     //[00134] SARSEL2_6_(SAS_6) = AO2A(SSIGN,SRCRD_2,SAR_6,SRCRDL_2);
wire SAS_7;                                                                     //[00135] SARSEL2_7_(SAS_7) = AO2A(SAM1,SRCRD_2,SAR_7,SRCRDL_2);
wire SAREN;                                                                     //[00137] SAREN_(SAREN) = ND3B(SRCRDL_0,SRCRDL_1,SRCRDL_2);

assign ADDBACK = ~ADDBACKL;                                                     //[00035] ADDBACK_(ADDBACK) = N1C(ADDBACKL);

/* The load enables for the latches */

assign SLDM1L = LDSAL_2 & UPSLDL & ADDBLDL;                                     //[00039] SLDM1_(SLDM1L) = AND3A(LDSAL_2,UPSLDL,ADDBLDL);
assign SLDL_0 = LDSAL_0 & UPSLDL & ADDBLDL;                                     //[00040] SLD_0_(SLDL_0) = AND3C(LDSAL_0,UPSLDL,ADDBLDL);
assign SLDL_1 = LDSAL_1 & UPSLDL;                                               //[00041] SLD_1_(SLDL_1) = AND2C(LDSAL_1,UPSLDL);
assign SLDL_2 = LDSAL_2 & UPSLDL;                                               //[00042] SLD_2_(SLDL_2) = AND2C(LDSAL_2,UPSLDL);

/* The local adder for add back */

assign LAQM1 = SAM1 ^ SA_16; assign CARRY_0 = SAM1 & SA_16;                     //[00046] LADDM1_(LAQM1,CARRY_0) = HALFADD(SAM1,SA_16);
FULLADD LADD_0__inst (.Q(LAQ_0),.CO(CARRY_1),.A(SA_8),.B(SA_0),.CI(CARRY_0));   //[00047] LADD_0_(LAQ_0,CARRY_1) = FULLADD(SA_8,SA_0,CARRY_0);
FULLADD LADD_1__inst (.Q(LAQ_1),.CO(CARRY_2),.A(SA_9),.B(SA_1),.CI(CARRY_1));   //[00048] LADD_1_(LAQ_1,CARRY_2) = FULLADD(SA_9,SA_1,CARRY_1);
FULLADD LADD_2__inst (.Q(LAQ_2),.CO(CARRY_3),.A(SA_10),.B(SA_2),.CI(CARRY_2));  //[00049] LADD_2_(LAQ_2,CARRY_3) = FULLADD(SA_10,SA_2,CARRY_2);
FULLADD LADD_3__inst (.Q(LAQ_3),.CO(CARRY_4),.A(SA_11),.B(SA_3),.CI(CARRY_3));  //[00050] LADD_3_(LAQ_3,CARRY_4) = FULLADD(SA_11,SA_3,CARRY_3);
FULLADD LADD_4__inst (.Q(LAQ_4),.CO(CARRY_5),.A(SA_12),.B(SA_4),.CI(CARRY_4));  //[00051] LADD_4_(LAQ_4,CARRY_5) = FULLADD(SA_12,SA_4,CARRY_4);
FULLADD LADD_5__inst (.Q(LAQ_5),.CO(CARRY_6),.A(SA_13),.B(SA_5),.CI(CARRY_5));  //[00052] LADD_5_(LAQ_5,CARRY_6) = FULLADD(SA_13,SA_5,CARRY_5);
FULLADD LADD_6__inst (.Q(LAQ_6),.CO(CARRY_7),.A(SA_14),.B(SA_6),.CI(CARRY_6));  //[00053] LADD_6_(LAQ_6,CARRY_7) = FULLADD(SA_14,SA_6,CARRY_6);
FULLADD LADD_7__inst (.Q(LAQ_7),.CO(CARRY_8),.A(SA_15),.B(SA_7),.CI(CARRY_7));  //[00054] LADD_7_(LAQ_7,CARRY_8) = FULLADD(SA_15,SA_7,CARRY_7);

/* Multiplex between the adder output and the data bus */

assign SDASELL = ~SDASEL;                                                       //[00058] SDASELL_(SDASELL) = N1B(SDASEL);
assign ADDSEL = ~(SDASELL | ADDBACK);                                           //[00059] ADDSEL_(ADDSEL) = NR2C(SDASELL,ADDBACK);
assign DATSEL = ~(SDASEL | ADDBACK);                                            //[00060] DATSEL_(DATSEL) = NR2C(SDASEL,ADDBACK);

assign SIM1 = ~((ADDBACK & LAQM1) | (ADDSEL & ADDQM1) | (DATSEL & ID_7));       //[00062] SMUXM1_(SIM1) = AO11A(ADDBACK,LAQM1,ADDSEL,ADDQM1,DATSEL,ID_7);
assign SI_0 = ~((ADDBACK & LAQ_0) | (ADDSEL & ADDQ_0) | (DATSEL & ID_0));       //[00063] SMUX_0_(SI_0) = AO11A(ADDBACK,LAQ_0,ADDSEL,ADDQ_0,DATSEL,ID_0);
assign SI_1 = ~((ADDBACK & LAQ_1) | (ADDSEL & ADDQ_1) | (DATSEL & ID_1));       //[00064] SMUX_1_(SI_1) = AO11A(ADDBACK,LAQ_1,ADDSEL,ADDQ_1,DATSEL,ID_1);
assign SI_2 = ~((ADDBACK & LAQ_2) | (ADDSEL & ADDQ_2) | (DATSEL & ID_2));       //[00065] SMUX_2_(SI_2) = AO11A(ADDBACK,LAQ_2,ADDSEL,ADDQ_2,DATSEL,ID_2);
assign SI_3 = ~((ADDBACK & LAQ_3) | (ADDSEL & ADDQ_3) | (DATSEL & ID_3));       //[00066] SMUX_3_(SI_3) = AO11A(ADDBACK,LAQ_3,ADDSEL,ADDQ_3,DATSEL,ID_3);
assign SI_4 = ~((ADDBACK & LAQ_4) | (ADDSEL & ADDQ_4) | (DATSEL & ID_4));       //[00067] SMUX_4_(SI_4) = AO11A(ADDBACK,LAQ_4,ADDSEL,ADDQ_4,DATSEL,ID_4);
assign SI_5 = ~((ADDBACK & LAQ_5) | (ADDSEL & ADDQ_5) | (DATSEL & ID_5));       //[00068] SMUX_5_(SI_5) = AO11A(ADDBACK,LAQ_5,ADDSEL,ADDQ_5,DATSEL,ID_5);
assign SI_6 = ~((ADDBACK & LAQ_6) | (ADDSEL & ADDQ_6) | (DATSEL & ID_6));       //[00069] SMUX_6_(SI_6) = AO11A(ADDBACK,LAQ_6,ADDSEL,ADDQ_6,DATSEL,ID_6);
assign SI_7 = ~((ADDBACK & LAQ_7) | (ADDSEL & ADDQ_7) | (DATSEL & ID_7));       //[00070] SMUX_7_(SI_7) = AO11A(ADDBACK,LAQ_7,ADDSEL,ADDQ_7,DATSEL,ID_7);
assign SI_8 = ~((SDASEL & ADDQ_8)|(SDASELL & ID_0));                            //[00071] SMUX_8_(SI_8) = AO2A(SDASEL,ADDQ_8,SDASELL,ID_0);
assign SI_9 = ~((SDASEL & ADDQ_9)|(SDASELL & ID_1));                            //[00072] SMUX_9_(SI_9) = AO2A(SDASEL,ADDQ_9,SDASELL,ID_1);
assign SI_10 = ~((SDASEL & ADDQ_10)|(SDASELL & ID_2));                          //[00073] SMUX_10_(SI_10) = AO2A(SDASEL,ADDQ_10,SDASELL,ID_2);
assign SI_11 = ~((SDASEL & ADDQ_11)|(SDASELL & ID_3));                          //[00074] SMUX_11_(SI_11) = AO2A(SDASEL,ADDQ_11,SDASELL,ID_3);
assign SI_12 = ~((SDASEL & ADDQ_12)|(SDASELL & ID_4));                          //[00075] SMUX_12_(SI_12) = AO2A(SDASEL,ADDQ_12,SDASELL,ID_4);
assign SI_13 = ~((SDASEL & ADDQ_13)|(SDASELL & ID_5));                          //[00076] SMUX_13_(SI_13) = AO2A(SDASEL,ADDQ_13,SDASELL,ID_5);
assign SI_14 = ~((SDASEL & ADDQ_14)|(SDASELL & ID_6));                          //[00077] SMUX_14_(SI_14) = AO2A(SDASEL,ADDQ_14,SDASELL,ID_6);
assign SI_15 = ~((SDASEL & ADDQ_15)|(SDASELL & ID_7));                          //[00078] SMUX_15_(SI_15) = AO2A(SDASEL,ADDQ_15,SDASELL,ID_7);
assign SI_16 = ~((SDASEL & ADDQ_16)|(SDASELL & ID_0));                          //[00079] SMUX_16_(SI_16) = AO2A(SDASEL,ADDQ_16,SDASELL,ID_0);
assign SI_17 = ~((SDASEL & ADDQ_17)|(SDASELL & ID_1));                          //[00080] SMUX_17_(SI_17) = AO2A(SDASEL,ADDQ_17,SDASELL,ID_1);
assign SI_18 = ~((SDASEL & ADDQ_18)|(SDASELL & ID_2));                          //[00081] SMUX_18_(SI_18) = AO2A(SDASEL,ADDQ_18,SDASELL,ID_2);
assign SI_19 = ~((SDASEL & ADDQ_19)|(SDASELL & ID_3));                          //[00082] SMUX_19_(SI_19) = AO2A(SDASEL,ADDQ_19,SDASELL,ID_3);

/* The address register */

FD1A SALATCHM1__inst (.q(SAM1L),.qL(SAM1),.d(SIM1),.clk(SLDM1L));               //[00086] SALATCHM1_(SAM1L,SAM1) = FD1A(SIM1,SLDM1L);
FD1A SALATCH_0__inst (.q(SAL_0),.qL(SA_0),.d(SI_0),.clk(SLDL_0));               //[00087] SALATCH_0_(SAL_0,SA_0) = FD1A(SI_0,SLDL_0);
FD1A SALATCH_1__inst (.q(SAL_1),.qL(SA_1),.d(SI_1),.clk(SLDL_0));               //[00088] SALATCH_1_(SAL_1,SA_1) = FD1A(SI_1,SLDL_0);
FD1A SALATCH_2__inst (.q(SAL_2),.qL(SA_2),.d(SI_2),.clk(SLDL_0));               //[00089] SALATCH_2_(SAL_2,SA_2) = FD1A(SI_2,SLDL_0);
FD1A SALATCH_3__inst (.q(SAL_3),.qL(SA_3),.d(SI_3),.clk(SLDL_0));               //[00090] SALATCH_3_(SAL_3,SA_3) = FD1A(SI_3,SLDL_0);
FD1A SALATCH_4__inst (.q(SAL_4),.qL(SA_4),.d(SI_4),.clk(SLDL_0));               //[00091] SALATCH_4_(SAL_4,SA_4) = FD1A(SI_4,SLDL_0);
FD1A SALATCH_5__inst (.q(SAL_5),.qL(SA_5),.d(SI_5),.clk(SLDL_0));               //[00092] SALATCH_5_(SAL_5,SA_5) = FD1A(SI_5,SLDL_0);
FD1A SALATCH_6__inst (.q(SAL_6),.qL(SA_6),.d(SI_6),.clk(SLDL_0));               //[00093] SALATCH_6_(SAL_6,SA_6) = FD1A(SI_6,SLDL_0);
FD1A SALATCH_7__inst (.q(SAL_7),.qL(SA_7),.d(SI_7),.clk(SLDL_0));               //[00094] SALATCH_7_(SAL_7,SA_7) = FD1A(SI_7,SLDL_0);
FD1A SALATCH_8__inst (.q(SAL_8),.qL(SA_8),.d(SI_8),.clk(SLDL_1));               //[00095] SALATCH_8_(SAL_8,SA_8) = FD1A(SI_8,SLDL_1);
FD1A SALATCH_9__inst (.q(SAL_9),.qL(SA_9),.d(SI_9),.clk(SLDL_1));               //[00096] SALATCH_9_(SAL_9,SA_9) = FD1A(SI_9,SLDL_1);
FD1A SALATCH_10__inst (.q(SAL_10),.qL(SA_10),.d(SI_10),.clk(SLDL_1));           //[00097] SALATCH_10_(SAL_10,SA_10) = FD1A(SI_10,SLDL_1);
FD1A SALATCH_11__inst (.q(SAL_11),.qL(SA_11),.d(SI_11),.clk(SLDL_1));           //[00098] SALATCH_11_(SAL_11,SA_11) = FD1A(SI_11,SLDL_1);
FD1A SALATCH_12__inst (.q(SAL_12),.qL(SA_12),.d(SI_12),.clk(SLDL_1));           //[00099] SALATCH_12_(SAL_12,SA_12) = FD1A(SI_12,SLDL_1);
FD1A SALATCH_13__inst (.q(SAL_13),.qL(SA_13),.d(SI_13),.clk(SLDL_1));           //[00100] SALATCH_13_(SAL_13,SA_13) = FD1A(SI_13,SLDL_1);
FD1A SALATCH_14__inst (.q(SAL_14),.qL(SA_14),.d(SI_14),.clk(SLDL_1));           //[00101] SALATCH_14_(SAL_14,SA_14) = FD1A(SI_14,SLDL_1);
FD1A SALATCH_15__inst (.q(SAL_15),.qL(SA_15),.d(SI_15),.clk(SLDL_1));           //[00102] SALATCH_15_(SAL_15,SA_15) = FD1A(SI_15,SLDL_1);
FD1A SALATCH_16__inst (.q(SAL_16),.qL(SA_16),.d(SI_16),.clk(SLDL_2));           //[00103] SALATCH_16_(SAL_16,SA_16) = FD1A(SI_16,SLDL_2);
FD1A SALATCH_17__inst (.q(SAL_17),.qL(SA_17),.d(SI_17),.clk(SLDL_2));           //[00104] SALATCH_17_(SAL_17,SA_17) = FD1A(SI_17,SLDL_2);
FD1A SALATCH_18__inst (.q(SAL_18),.qL(SA_18),.d(SI_18),.clk(SLDL_2));           //[00105] SALATCH_18_(SAL_18,SA_18) = FD1A(SI_18,SLDL_2);
FD1A SALATCH_19__inst (.q(SAL_19),.qL(SA_19),.d(SI_19),.clk(SLDL_2));           //[00106] SALATCH_19_(SAL_19,SA_19) = FD1A(SI_19,SLDL_2);

/* The source data comparator select, source address update sign bit, and '
wrap control */

LD2A SRCCMP__inst (.q(SRCCMP),.qL(SRCCMPL),.d(ID_4),.en(LDSAL_2));              //[00111] SRCCMP_(SRCCMP,SRCCMPL) = LD2A(ID_4,LDSAL_2);
LD2A SWRAP__inst (.q(SWRAP),.qL(SWRAPL),.d(ID_5),.en(LDSAL_2));                 //[00112] SWRAP_(SWRAP,SWRAPL) = LD2A(ID_5,LDSAL_2);
LD2A SSIGN__inst (.q(SSIGN),.qL(SSIGNL),.d(ID_6),.en(LDSAL_2));                 //[00113] SSIGN_(SSIGN,SSIGNL) = LD2A(ID_6,LDSAL_2);

/* Make it readable by the CPU */

assign SRCRD_0 = ~SRCRDL_0;                                                     //[00117] SIOINV_0_(SRCRD_0) = N1A(SRCRDL_0);
assign SRCRD_1 = ~SRCRDL_1;                                                     //[00118] SIOINV_1_(SRCRD_1) = N1A(SRCRDL_1);
assign SRCRD_2 = ~SRCRDL_2;                                                     //[00119] SIOINV_2_(SRCRD_2) = N1A(SRCRDL_2);
assign SAR_0 = ~((~(SA_0 & SRCRD_0)) & (~(SA_8 & SRCRD_1)));                    //[00120] SARSEL1_0_(SAR_0) = MUX2(SA_0,SRCRD_0,SA_8,SRCRD_1);
assign SAR_1 = ~((~(SA_1 & SRCRD_0)) & (~(SA_9 & SRCRD_1)));                    //[00121] SARSEL1_1_(SAR_1) = MUX2(SA_1,SRCRD_0,SA_9,SRCRD_1);
assign SAR_2 = ~((~(SA_2 & SRCRD_0)) & (~(SA_10 & SRCRD_1)));                   //[00122] SARSEL1_2_(SAR_2) = MUX2(SA_2,SRCRD_0,SA_10,SRCRD_1);
assign SAR_3 = ~((~(SA_3 & SRCRD_0)) & (~(SA_11 & SRCRD_1)));                   //[00123] SARSEL1_3_(SAR_3) = MUX2(SA_3,SRCRD_0,SA_11,SRCRD_1);
assign SAR_4 = ~((~(SA_4 & SRCRD_0)) & (~(SA_12 & SRCRD_1)));                   //[00124] SARSEL1_4_(SAR_4) = MUX2(SA_4,SRCRD_0,SA_12,SRCRD_1);
assign SAR_5 = ~((~(SA_5 & SRCRD_0)) & (~(SA_13 & SRCRD_1)));                   //[00125] SARSEL1_5_(SAR_5) = MUX2(SA_5,SRCRD_0,SA_13,SRCRD_1);
assign SAR_6 = ~((~(SA_6 & SRCRD_0)) & (~(SA_14 & SRCRD_1)));                   //[00126] SARSEL1_6_(SAR_6) = MUX2(SA_6,SRCRD_0,SA_14,SRCRD_1);
assign SAR_7 = ~((~(SA_7 & SRCRD_0)) & (~(SA_15 & SRCRD_1)));                   //[00127] SARSEL1_7_(SAR_7) = MUX2(SA_7,SRCRD_0,SA_15,SRCRD_1);
assign SAS_0 = ~((SA_16 & SRCRD_2)|(SAR_0 & SRCRDL_2));                         //[00128] SARSEL2_0_(SAS_0) = AO2A(SA_16,SRCRD_2,SAR_0,SRCRDL_2);
assign SAS_1 = ~((SA_17 & SRCRD_2)|(SAR_1 & SRCRDL_2));                         //[00129] SARSEL2_1_(SAS_1) = AO2A(SA_17,SRCRD_2,SAR_1,SRCRDL_2);
assign SAS_2 = ~((SA_18 & SRCRD_2)|(SAR_2 & SRCRDL_2));                         //[00130] SARSEL2_2_(SAS_2) = AO2A(SA_18,SRCRD_2,SAR_2,SRCRDL_2);
assign SAS_3 = ~((SA_19 & SRCRD_2)|(SAR_3 & SRCRDL_2));                         //[00131] SARSEL2_3_(SAS_3) = AO2A(SA_19,SRCRD_2,SAR_3,SRCRDL_2);
assign SAS_4 = ~(SAR_4 & SRCRDL_2);                                             //[00132] SARSEL2_4_(SAS_4) = ND2A(SAR_4,SRCRDL_2);
assign SAS_5 = ~(SAR_5 & SRCRDL_2);                                             //[00133] SARSEL2_5_(SAS_5) = ND2A(SAR_5,SRCRDL_2);
assign SAS_6 = ~((SSIGN & SRCRD_2)|(SAR_6 & SRCRDL_2));                         //[00134] SARSEL2_6_(SAS_6) = AO2A(SSIGN,SRCRD_2,SAR_6,SRCRDL_2);
assign SAS_7 = ~((SAM1 & SRCRD_2)|(SAR_7 & SRCRDL_2));                          //[00135] SARSEL2_7_(SAS_7) = AO2A(SAM1,SRCRD_2,SAR_7,SRCRDL_2);

assign SAREN = ~(SRCRDL_0 & SRCRDL_1 & SRCRDL_2);                               //[00137] SAREN_(SAREN) = ND3B(SRCRDL_0,SRCRDL_1,SRCRDL_2);
assign outD_0 = (~SAS_0);                                           //[00138] SAPORT_0_(D_0) = BTS5A(SAS_0,SAREN);
assign outD_1 = (~SAS_1);                                           //[00139] SAPORT_1_(D_1) = BTS5A(SAS_1,SAREN);
assign outD_2 = (~SAS_2);                                           //[00140] SAPORT_2_(D_2) = BTS5A(SAS_2,SAREN);
assign outD_3 = (~SAS_3);                                           //[00141] SAPORT_3_(D_3) = BTS5A(SAS_3,SAREN);
assign outD_4 = (~SAS_4);                                           //[00142] SAPORT_4_(D_4) = BTS5A(SAS_4,SAREN);
assign outD_5 = (~SAS_5);                                           //[00143] SAPORT_5_(D_5) = BTS5A(SAS_5,SAREN);
assign outD_6 = (~SAS_6);                                           //[00144] SAPORT_6_(D_6) = BTS5A(SAS_6,SAREN);
assign outD_7 = (~SAS_7);                                           //[00145] SAPORT_7_(D_7) = BTS5A(SAS_7,SAREN);
assign enD_0 = SAREN;                                           //[00138] SAPORT_0_(D_0) = BTS5A(SAS_0,SAREN);
assign enD_1 = SAREN;                                           //[00139] SAPORT_1_(D_1) = BTS5A(SAS_1,SAREN);
assign enD_2 = SAREN;                                           //[00140] SAPORT_2_(D_2) = BTS5A(SAS_2,SAREN);
assign enD_3 = SAREN;                                           //[00141] SAPORT_3_(D_3) = BTS5A(SAS_3,SAREN);
assign enD_4 = SAREN;                                           //[00142] SAPORT_4_(D_4) = BTS5A(SAS_4,SAREN);
assign enD_5 = SAREN;                                           //[00143] SAPORT_5_(D_5) = BTS5A(SAS_5,SAREN);
assign enD_6 = SAREN;                                           //[00144] SAPORT_6_(D_6) = BTS5A(SAS_6,SAREN);
assign enD_7 = SAREN;                                           //[00145] SAPORT_7_(D_7) = BTS5A(SAS_7,SAREN);

endmodule                                                                       //[00147] END MODULE;