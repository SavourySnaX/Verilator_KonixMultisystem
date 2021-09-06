                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
blit
19/10/88

Top level of the blitter module

****************************************************************************/

module m_BLIT                                                                   //[00012] MODULE BLIT;
(                                                                               //[00012] MODULE BLIT;

    inout    A_0,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_1,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_2,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_3,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_4,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_5,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_6,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_7,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_8,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_9,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_10,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_11,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_12,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_13,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_14,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_15,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_16,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_17,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_18,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_19,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_0,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_1,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_2,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_3,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_4,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_5,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_6,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_7,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_8,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_9,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_10,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_11,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_12,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_13,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    inout    D_14,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    inout    D_15,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    RESETL,                                                            //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    HLDAL,                                                             //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    DSPBRQL,                                                           //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    INTL,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    IORDL,                                                             //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    IOWRL,                                                             //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    BCSL,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    CCLK,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    WAITL,                                                             //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
                                                                                //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
                                                                                //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
//    output    A_0,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_1,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_2,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_3,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_4,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_5,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_6,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_7,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_8,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_9,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_10,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_11,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_12,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_13,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_14,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_15,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_16,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_17,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_18,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_19,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_0,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_1,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_2,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_3,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_4,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_5,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_6,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_7,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_8,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_9,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_10,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_11,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_12,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_13,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
//    output    D_14,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
//    output    D_15,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    BMREQ,                                                            //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    BRD,                                                              //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    BWR,                                                              //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    BWORD,                                                            //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    DSPBAKL,                                                          //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    BHOLDL,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    TESTWRL                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
);                                                                              //[00012] MODULE BLIT;
                                                                                //[00020] LEVEL FUNCTION;
wire DAM1L;                                                                     //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire DATOEL;                                                                    //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire DSTCMP;                                                                    //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ICNT_0;                                                                    //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ICNT_1;                                                                    //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ICNT_2;                                                                    //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_0;                                                                      //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_1;                                                                      //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_2;                                                                      //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_3;                                                                      //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_4;                                                                      //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
wire ID_5;                                                                      //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_6;                                                                      //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_7;                                                                      //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_8;                                                                      //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_9;                                                                      //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_10;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_11;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_12;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_13;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_14;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire ID_15;                                                                     //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire LDCMPL;                                                                    //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire LDDSTL;                                                                    //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
wire LDPATL;                                                                    //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire LDMODL;                                                                    //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire LDSRCL;                                                                    //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire RES_0;                                                                     //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire SSWAP;                                                                     //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire SRCCMP;                                                                    //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire SRCLTOH;                                                                   //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);
wire INHIB;                                                                     //[00026]    INHIB) = DATA(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,
wire ADDBACKL;                                                                  //[00036]    A_13,A_14,A_15,A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,
wire ADDBLDL;                                                                   //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire ADSTP;                                                                     //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire BUSOE;                                                                     //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire SRCENF;                                                                    //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire DSTRDL_0;                                                                  //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire DSTRDL_1;                                                                  //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire DSTRDL_2;                                                                  //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
wire LDDAL_0;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDDAL_1;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDDAL_2;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDSAL_0;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDSAL_1;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDSAL_2;                                                                   //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LDSTPL;                                                                    //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
wire LINDR;                                                                     //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire PCEN;                                                                      //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire PCWRL_0;                                                                   //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire PCWRL_1;                                                                   //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire PCWRL_2;                                                                   //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire RES_1;                                                                     //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire RUN;                                                                       //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire SDASEL;                                                                    //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire SRCRD;                                                                     //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
wire SRCRDL_0;                                                                  //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire SRCRDL_1;                                                                  //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire SRCRDL_2;                                                                  //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire UPDDSTL;                                                                   //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire UPDPCL;                                                                    //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire UPDSRCL;                                                                   //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire UPSLDL;                                                                    //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);
wire BORROW;                                                                    //[00034]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,BORROW,DAM1L,DSTCMP,
wire SAM1L;                                                                     //[00035]    SAM1L,SRCCMP) = ADDR(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,
wire ACKINT;                                                                    //[00048]    BWORD) = STATE(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,
wire CMDWRL;                                                                    //[00048]    BWORD) = STATE(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,
wire CONWRL;                                                                    //[00049]    CONWRL,DAM1L,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,
wire INCRDL;                                                                    //[00049]    CONWRL,DAM1L,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,
wire OUTCRDL;                                                                   //[00049]    CONWRL,DAM1L,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,
wire RESET;                                                                     //[00050]    RESET,SAM1L,STRD,WAITL);
wire STRD;                                                                      //[00050]    RESET,SAM1L,STRD,WAITL);
wire INCYCL;                                                                    //[00045]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
wire STOP;                                                                      //[00047]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,

/* The data path */

m_DATA DATA_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.D_8(D_8),.D_9(D_9),.D_10(D_10),.D_11(D_11),.D_12(D_12),.D_13(D_13),.D_14(D_14),.D_15(D_15),.DAM1L(DAM1L),.DATOEL(DATOEL),.DSTCMP(DSTCMP),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.ID_8(ID_8),.ID_9(ID_9),.ID_10(ID_10),.ID_11(ID_11),.ID_12(ID_12),.ID_13(ID_13),.ID_14(ID_14),.ID_15(ID_15),.LDCMPL(LDCMPL),.LDDSTL(LDDSTL),.LDPATL(LDPATL),.LDMODL(LDMODL),.LDSRCL(LDSRCL),.RES_0(RES_0),.SSWAP(SSWAP),.SRCCMP(SRCCMP),.SRCLTOH(SRCLTOH),.INHIB(INHIB));//[00025] DATA_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
                                                                                //[00026]    INHIB) = DATA(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,
                                                                                //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
                                                                                //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
                                                                                //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);

/* The address generator */

m_ADDR ADDR_ (.A_0(A_0),.A_1(A_1),.A_2(A_2),.A_3(A_3),.A_4(A_4),.A_5(A_5),.A_6(A_6),.A_7(A_7),.A_8(A_8),.A_9(A_9),.A_10(A_10),.A_11(A_11),.A_12(A_12),.A_13(A_13),.A_14(A_14),.A_15(A_15),.A_16(A_16),.A_17(A_17),.A_18(A_18),.A_19(A_19),.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.ADDBACKL(ADDBACKL),.ADDBLDL(ADDBLDL),.ADSTP(ADSTP),.BUSOE(BUSOE),.SRCENF(SRCENF),.DSTRDL_0(DSTRDL_0),.DSTRDL_1(DSTRDL_1),.DSTRDL_2(DSTRDL_2),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.LDDAL_0(LDDAL_0),.LDDAL_1(LDDAL_1),.LDDAL_2(LDDAL_2),.LDSAL_0(LDSAL_0),.LDSAL_1(LDSAL_1),.LDSAL_2(LDSAL_2),.LDSTPL(LDSTPL),.LDMODL(LDMODL),.LINDR(LINDR),.PCEN(PCEN),.PCWRL_0(PCWRL_0),.PCWRL_1(PCWRL_1),.PCWRL_2(PCWRL_2),.RES_0(RES_0),.RES_1(RES_1),.RUN(RUN),.SDASEL(SDASEL),.SRCRD(SRCRD),.SRCRDL_0(SRCRDL_0),.SRCRDL_1(SRCRDL_1),.SRCRDL_2(SRCRDL_2),.UPDDSTL(UPDDSTL),.UPDPCL(UPDPCL),.UPDSRCL(UPDSRCL),.UPSLDL(UPSLDL),.BORROW(BORROW),.DAM1L(DAM1L),.DSTCMP(DSTCMP),.SAM1L(SAM1L),.SRCCMP(SRCCMP));//[00033] ADDR_(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
                                                                                //[00034]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,BORROW,DAM1L,DSTCMP,
                                                                                //[00035]    SAM1L,SRCCMP) = ADDR(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,
                                                                                //[00036]    A_13,A_14,A_15,A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,
                                                                                //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
                                                                                //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
                                                                                //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
                                                                                //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);

/* The state machine and control logic */

m_STATE STATE_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.ACKINT(ACKINT),.BORROW(BORROW),.CCLK(CCLK),.CMDWRL(CMDWRL),.CONWRL(CONWRL),.DAM1L(DAM1L),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.INCRDL(INCRDL),.INHIB(INHIB),.OUTCRDL(OUTCRDL),.RESET(RESET),.SAM1L(SAM1L),.STRD(STRD),.WAITL(WAITL),.ADDBACKL(ADDBACKL),.ADDBLDL(ADDBLDL),.ADSTP(ADSTP),.DATOEL(DATOEL),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.INCYCL(INCYCL),.LDCMPL(LDCMPL),.LDDAL_0(LDDAL_0),.LDDAL_1(LDDAL_1),.LDDAL_2(LDDAL_2),.LDDSTL(LDDSTL),.LDMODL(LDMODL),.LDPATL(LDPATL),.LDSAL_0(LDSAL_0),.LDSAL_1(LDSAL_1),.LDSAL_2(LDSAL_2),.LDSRCL(LDSRCL),.LDSTPL(LDSTPL),.LINDR(LINDR),.PCEN(PCEN),.RES_0(RES_0),.RES_1(RES_1),.RUN(RUN),.SDASEL(SDASEL),.SRCENF(SRCENF),.SRCLTOH(SRCLTOH),.SRCRD(SRCRD),.SSWAP(SSWAP),.STOP(STOP),.UPDDSTL(UPDDSTL),.UPDPCL(UPDPCL),.UPDSRCL(UPDSRCL),.UPSLDL(UPSLDL),.BMREQ(BMREQ),.BRD(BRD),.BWR(BWR),.BWORD(BWORD));//[00044] STATE_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
                                                                                //[00045]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
                                                                                //[00046]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
                                                                                //[00047]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
                                                                                //[00048]    BWORD) = STATE(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,
                                                                                //[00049]    CONWRL,DAM1L,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,
                                                                                //[00050]    RESET,SAM1L,STRD,WAITL);

/* The bus control and decode logic */

m_BUSCON BUSCON_ (.D_0(D_0),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.A_0(A_0),.A_1(A_1),.A_2(A_2),.A_3(A_3),.A_4(A_4),.BCSL(BCSL),.HLDAL(HLDAL),.DSPBRQL(DSPBRQL),.ID_0(ID_0),.INTL(INTL),.IORDL(IORDL),.IOWRL(IOWRL),.INCYCL(INCYCL),.RESET(RESET),.RUN(RUN),.STOP(STOP),.ACKINT(ACKINT),.BHOLDL(BHOLDL),.BUSOE(BUSOE),.CMDWRL(CMDWRL),.CONWRL(CONWRL),.DSPBAKL(DSPBAKL),.DSTRDL_0(DSTRDL_0),.DSTRDL_1(DSTRDL_1),.DSTRDL_2(DSTRDL_2),.INCRDL(INCRDL),.OUTCRDL(OUTCRDL),.PCWRL_0(PCWRL_0),.PCWRL_1(PCWRL_1),.PCWRL_2(PCWRL_2),.SRCRDL_0(SRCRDL_0),.SRCRDL_1(SRCRDL_1),.SRCRDL_2(SRCRDL_2),.STRD(STRD),.TESTWRL(TESTWRL));//[00054] BUSCON_(D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
                                                                                //[00055]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
                                                                                //[00056]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL) = BUSCON(D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,
                                                                                //[00057]    A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,IORDL,IOWRL,INCYCL,RESET,RUN,STOP);

/* Locally invert some inputs, and buffer to keep fanouts down */

assign RESET = ~RESETL;                                                         //[00061] RESETINV_(RESET) = N1B(RESETL);
assign ID_0 = D_0;                                                              //[00062] DBUF_0_(ID_0) = B3A(D_0);
assign ID_1 = D_1;                                                              //[00063] DBUF_1_(ID_1) = B3A(D_1);
assign ID_2 = D_2;                                                              //[00064] DBUF_2_(ID_2) = B3A(D_2);
assign ID_3 = D_3;                                                              //[00065] DBUF_3_(ID_3) = B3A(D_3);
assign ID_4 = D_4;                                                              //[00066] DBUF_4_(ID_4) = B3A(D_4);
assign ID_5 = D_5;                                                              //[00067] DBUF_5_(ID_5) = B3A(D_5);
assign ID_6 = D_6;                                                              //[00068] DBUF_6_(ID_6) = B3A(D_6);
assign ID_7 = D_7;                                                              //[00069] DBUF_7_(ID_7) = B3A(D_7);
assign ID_8 = D_8;                                                              //[00070] DBUF_8_(ID_8) = B3A(D_8);
assign ID_9 = D_9;                                                              //[00071] DBUF_9_(ID_9) = B3A(D_9);
assign ID_10 = D_10;                                                            //[00072] DBUF_10_(ID_10) = B3A(D_10);
assign ID_11 = D_11;                                                            //[00073] DBUF_11_(ID_11) = B3A(D_11);
assign ID_12 = D_12;                                                            //[00074] DBUF_12_(ID_12) = B3A(D_12);
assign ID_13 = D_13;                                                            //[00075] DBUF_13_(ID_13) = B3A(D_13);
assign ID_14 = D_14;                                                            //[00076] DBUF_14_(ID_14) = B3A(D_14);
assign ID_15 = D_15;                                                            //[00077] DBUF_15_(ID_15) = B3A(D_15);

endmodule                                                                       //[00079] END MODULE;