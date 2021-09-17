                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
blit
19/10/88

Top level of the blitter module

****************************************************************************/

module m_BLIT                                                                   //[00012] MODULE BLIT;
(                                                                               //[00012] MODULE BLIT;

    input    inA_0,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_1,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_2,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_3,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_4,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_5,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_6,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_7,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_8,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_9,                                                               //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_10,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_11,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_12,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_13,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_14,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_15,                                                              //[00014] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_16,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_17,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_18,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_19,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_0,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_1,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_2,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_3,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_4,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_5,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_6,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_7,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_8,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_9,                                                               //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_10,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_11,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_12,                                                              //[00015]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_13,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    inD_14,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
    input    inD_15,                                                              //[00016]    D_13,D_14,D_15,RESETL,HLDAL,DSPBRQL,INTL,IORDL,IOWRL,BCSL,CCLK,WAITL;
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
    output    outA_0,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_1,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_2,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_3,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_4,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_5,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_6,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_7,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_8,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_9,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_10,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_11,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_12,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_13,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_14,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_15,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_16,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_17,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_18,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_19,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_0,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_1,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_2,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_3,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_4,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_5,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_6,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_7,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_8,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_9,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_10,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_11,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_12,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_13,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    outD_14,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    outD_15,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    enA_0,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_1,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_2,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_3,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_4,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_5,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_6,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_7,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_8,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_9,                                                            //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_10,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_11,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_12,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_13,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_14,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_15,                                                           //[00017] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_16,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_17,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_18,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_19,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_0,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_1,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_2,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_3,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_4,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_5,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_6,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_7,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_8,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_9,                                                            //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_10,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_11,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_12,                                                           //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_13,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    enD_14,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
    output    enD_15,                                                           //[00019]    D_13,D_14,D_15,BMREQ,BRD,BWR,BWORD,DSPBAKL,BHOLDL,TESTWRL;
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

wire DATA_outD_0,DATA_outD_1,DATA_outD_2,DATA_outD_3,DATA_outD_4,DATA_outD_5,DATA_outD_6,DATA_outD_7,DATA_outD_8,DATA_outD_9,DATA_outD_10,DATA_outD_11,DATA_outD_12,DATA_outD_13,DATA_outD_14,DATA_outD_15;
wire DATA_enD_0,DATA_enD_1,DATA_enD_2,DATA_enD_3,DATA_enD_4,DATA_enD_5,DATA_enD_6,DATA_enD_7,DATA_enD_8,DATA_enD_9,DATA_enD_10,DATA_enD_11,DATA_enD_12,DATA_enD_13,DATA_enD_14,DATA_enD_15;

m_DATA DATA_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),.inD_8(inD_8),.inD_9(inD_9),.inD_10(inD_10),.inD_11(inD_11),.inD_12(inD_12),.inD_13(inD_13),.inD_14(inD_14),.inD_15(inD_15),
              .outD_0(DATA_outD_0),.outD_1(DATA_outD_1),.outD_2(DATA_outD_2),.outD_3(DATA_outD_3),.outD_4(DATA_outD_4),.outD_5(DATA_outD_5),.outD_6(DATA_outD_6),.outD_7(DATA_outD_7),.outD_8(DATA_outD_8),.outD_9(DATA_outD_9),.outD_10(DATA_outD_10),.outD_11(DATA_outD_11),.outD_12(DATA_outD_12),.outD_13(DATA_outD_13),.outD_14(DATA_outD_14),.outD_15(DATA_outD_15),
              .enD_0(DATA_enD_0),.enD_1(DATA_enD_1),.enD_2(DATA_enD_2),.enD_3(DATA_enD_3),.enD_4(DATA_enD_4),.enD_5(DATA_enD_5),.enD_6(DATA_enD_6),.enD_7(DATA_enD_7),.enD_8(DATA_enD_8),.enD_9(DATA_enD_9),.enD_10(DATA_enD_10),.enD_11(DATA_enD_11),.enD_12(DATA_enD_12),.enD_13(DATA_enD_13),.enD_14(DATA_enD_14),.enD_15(DATA_enD_15),
    .DAM1L(DAM1L),.DATOEL(DATOEL),.DSTCMP(DSTCMP),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.ID_8(ID_8),.ID_9(ID_9),.ID_10(ID_10),.ID_11(ID_11),.ID_12(ID_12),.ID_13(ID_13),.ID_14(ID_14),.ID_15(ID_15),.LDCMPL(LDCMPL),.LDDSTL(LDDSTL),.LDPATL(LDPATL),.LDMODL(LDMODL),.LDSRCL(LDSRCL),.RES_0(RES_0),.SSWAP(SSWAP),.SRCCMP(SRCCMP),.SRCLTOH(SRCLTOH),.INHIB(INHIB));//[00025] DATA_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15,
                                                                                //[00026]    INHIB) = DATA(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,
                                                                                //[00027]    D_14,D_15,DAM1L,DATOEL,DSTCMP,ICNT_0,ICNT_1,ICNT_2,ID_0,ID_1,ID_2,ID_3,ID_4,
                                                                                //[00028]    ID_5,ID_6,ID_7,ID_8,ID_9,ID_10,ID_11,ID_12,ID_13,ID_14,ID_15,LDCMPL,LDDSTL,
                                                                                //[00029]    LDPATL,LDMODL,LDSRCL,RES_0,SSWAP,SRCCMP,SRCLTOH);

/* The address generator */

wire ADDR_outA_0,ADDR_outA_1,ADDR_outA_2,ADDR_outA_3,ADDR_outA_4,ADDR_outA_5,ADDR_outA_6,ADDR_outA_7,ADDR_outA_8,ADDR_outA_9,ADDR_outA_10,ADDR_outA_11,ADDR_outA_12,ADDR_outA_13,ADDR_outA_14,ADDR_outA_15,ADDR_outA_16,ADDR_outA_17,ADDR_outA_18,ADDR_outA_19;
wire ADDR_enA_0,ADDR_enA_1,ADDR_enA_2,ADDR_enA_3,ADDR_enA_4,ADDR_enA_5,ADDR_enA_6,ADDR_enA_7,ADDR_enA_8,ADDR_enA_9,ADDR_enA_10,ADDR_enA_11,ADDR_enA_12,ADDR_enA_13,ADDR_enA_14,ADDR_enA_15,ADDR_enA_16,ADDR_enA_17,ADDR_enA_18,ADDR_enA_19;
wire ADDR_outD_0,ADDR_outD_1,ADDR_outD_2,ADDR_outD_3,ADDR_outD_4,ADDR_outD_5,ADDR_outD_6,ADDR_outD_7;
wire ADDR_enD_0,ADDR_enD_1,ADDR_enD_2,ADDR_enD_3,ADDR_enD_4,ADDR_enD_5,ADDR_enD_6,ADDR_enD_7;

m_ADDR ADDR_ (.inA_0(inA_0),.inA_1(inA_1),.inA_2(inA_2),.inA_3(inA_3),.inA_4(inA_4),.inA_5(inA_5),.inA_6(inA_6),.inA_7(inA_7),.inA_8(inA_8),.inA_9(inA_9),.inA_10(inA_10),.inA_11(inA_11),.inA_12(inA_12),.inA_13(inA_13),.inA_14(inA_14),.inA_15(inA_15),.inA_16(inA_16),.inA_17(inA_17),.inA_18(inA_18),.inA_19(inA_19),.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
              .outA_0(ADDR_outA_0),.outA_1(ADDR_outA_1),.outA_2(ADDR_outA_2),.outA_3(ADDR_outA_3),.outA_4(ADDR_outA_4),.outA_5(ADDR_outA_5),.outA_6(ADDR_outA_6),.outA_7(ADDR_outA_7),.outA_8(ADDR_outA_8),.outA_9(ADDR_outA_9),.outA_10(ADDR_outA_10),.outA_11(ADDR_outA_11),.outA_12(ADDR_outA_12),.outA_13(ADDR_outA_13),.outA_14(ADDR_outA_14),.outA_15(ADDR_outA_15),.outA_16(ADDR_outA_16),.outA_17(ADDR_outA_17),.outA_18(ADDR_outA_18),.outA_19(ADDR_outA_19),.outD_0(ADDR_outD_0),.outD_1(ADDR_outD_1),.outD_2(ADDR_outD_2),.outD_3(ADDR_outD_3),.outD_4(ADDR_outD_4),.outD_5(ADDR_outD_5),.outD_6(ADDR_outD_6),.outD_7(ADDR_outD_7),
              .enA_0(ADDR_enA_0),.enA_1(ADDR_enA_1),.enA_2(ADDR_enA_2),.enA_3(ADDR_enA_3),.enA_4(ADDR_enA_4),.enA_5(ADDR_enA_5),.enA_6(ADDR_enA_6),.enA_7(ADDR_enA_7),.enA_8(ADDR_enA_8),.enA_9(ADDR_enA_9),.enA_10(ADDR_enA_10),.enA_11(ADDR_enA_11),.enA_12(ADDR_enA_12),.enA_13(ADDR_enA_13),.enA_14(ADDR_enA_14),.enA_15(ADDR_enA_15),.enA_16(ADDR_enA_16),.enA_17(ADDR_enA_17),.enA_18(ADDR_enA_18),.enA_19(ADDR_enA_19),.enD_0(ADDR_enD_0),.enD_1(ADDR_enD_1),.enD_2(ADDR_enD_2),.enD_3(ADDR_enD_3),.enD_4(ADDR_enD_4),.enD_5(ADDR_enD_5),.enD_6(ADDR_enD_6),.enD_7(ADDR_enD_7),
        .ADDBACKL(ADDBACKL),.ADDBLDL(ADDBLDL),.ADSTP(ADSTP),.BUSOE(BUSOE),.SRCENF(SRCENF),.DSTRDL_0(DSTRDL_0),.DSTRDL_1(DSTRDL_1),.DSTRDL_2(DSTRDL_2),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.LDDAL_0(LDDAL_0),.LDDAL_1(LDDAL_1),.LDDAL_2(LDDAL_2),.LDSAL_0(LDSAL_0),.LDSAL_1(LDSAL_1),.LDSAL_2(LDSAL_2),.LDSTPL(LDSTPL),.LDMODL(LDMODL),.LINDR(LINDR),.PCEN(PCEN),.PCWRL_0(PCWRL_0),.PCWRL_1(PCWRL_1),.PCWRL_2(PCWRL_2),.RES_0(RES_0),.RES_1(RES_1),.RUN(RUN),.SDASEL(SDASEL),.SRCRD(SRCRD),.SRCRDL_0(SRCRDL_0),.SRCRDL_1(SRCRDL_1),.SRCRDL_2(SRCRDL_2),.UPDDSTL(UPDDSTL),.UPDPCL(UPDPCL),.UPDSRCL(UPDSRCL),.UPSLDL(UPSLDL),.BORROW(BORROW),.DAM1L(DAM1L),.DSTCMP(DSTCMP),.SAM1L(SAM1L),.SRCCMP(SRCCMP));//[00033] ADDR_(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
                                                                                //[00034]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,BORROW,DAM1L,DSTCMP,
                                                                                //[00035]    SAM1L,SRCCMP) = ADDR(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,
                                                                                //[00036]    A_13,A_14,A_15,A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,
                                                                                //[00037]    ADDBLDL,ADSTP,BUSOE,SRCENF,DSTRDL_0,DSTRDL_1,DSTRDL_2,ID_0,ID_1,ID_2,ID_3,
                                                                                //[00038]    ID_4,ID_5,ID_6,ID_7,LDDAL_0,LDDAL_1,LDDAL_2,LDSAL_0,LDSAL_1,LDSAL_2,LDSTPL,
                                                                                //[00039]    LDMODL,LINDR,PCEN,PCWRL_0,PCWRL_1,PCWRL_2,RES_0,RES_1,RUN,SDASEL,SRCRD,
                                                                                //[00040]    SRCRDL_0,SRCRDL_1,SRCRDL_2,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL);

/* The state machine and control logic */

wire STATE_outD_0,STATE_outD_1,STATE_outD_2,STATE_outD_3,STATE_outD_4,STATE_outD_5,STATE_outD_6,STATE_outD_7;
wire STATE_enD_0,STATE_enD_1,STATE_enD_2,STATE_enD_3,STATE_enD_4,STATE_enD_5,STATE_enD_6,STATE_enD_7;

m_STATE STATE_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
                .outD_0(STATE_outD_0),.outD_1(STATE_outD_1),.outD_2(STATE_outD_2),.outD_3(STATE_outD_3),.outD_4(STATE_outD_4),.outD_5(STATE_outD_5),.outD_6(STATE_outD_6),.outD_7(STATE_outD_7),
                .enD_0(STATE_enD_0),.enD_1(STATE_enD_1),.enD_2(STATE_enD_2),.enD_3(STATE_enD_3),.enD_4(STATE_enD_4),.enD_5(STATE_enD_5),.enD_6(STATE_enD_6),.enD_7(STATE_enD_7),
        .ACKINT(ACKINT),.BORROW(BORROW),.CCLK(CCLK),.CMDWRL(CMDWRL),.CONWRL(CONWRL),.DAM1L(DAM1L),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.INCRDL(INCRDL),.INHIB(INHIB),.OUTCRDL(OUTCRDL),.RESET(RESET),.SAM1L(SAM1L),.STRD(STRD),.WAITL(WAITL),.ADDBACKL(ADDBACKL),.ADDBLDL(ADDBLDL),.ADSTP(ADSTP),.DATOEL(DATOEL),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.INCYCL(INCYCL),.LDCMPL(LDCMPL),.LDDAL_0(LDDAL_0),.LDDAL_1(LDDAL_1),.LDDAL_2(LDDAL_2),.LDDSTL(LDDSTL),.LDMODL(LDMODL),.LDPATL(LDPATL),.LDSAL_0(LDSAL_0),.LDSAL_1(LDSAL_1),.LDSAL_2(LDSAL_2),.LDSRCL(LDSRCL),.LDSTPL(LDSTPL),.LINDR(LINDR),.PCEN(PCEN),.RES_0(RES_0),.RES_1(RES_1),.RUN(RUN),.SDASEL(SDASEL),.SRCENF(SRCENF),.SRCLTOH(SRCLTOH),.SRCRD(SRCRD),.SSWAP(SSWAP),.STOP(STOP),.UPDDSTL(UPDDSTL),.UPDPCL(UPDPCL),.UPDSRCL(UPDSRCL),.UPSLDL(UPSLDL),.BMREQ(BMREQ),.BRD(BRD),.BWR(BWR),.BWORD(BWORD));//[00044] STATE_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
                                                                                //[00045]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
                                                                                //[00046]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
                                                                                //[00047]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
                                                                                //[00048]    BWORD) = STATE(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,
                                                                                //[00049]    CONWRL,DAM1L,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,
                                                                                //[00050]    RESET,SAM1L,STRD,WAITL);

/* The bus control and decode logic */

wire BUSCON_outD_0,BUSCON_outD_3,BUSCON_outD_4,BUSCON_outD_5,BUSCON_outD_6,BUSCON_outD_7;
wire BUSCON_enD_0,BUSCON_enD_3,BUSCON_enD_4,BUSCON_enD_5,BUSCON_enD_6,BUSCON_enD_7;

m_BUSCON BUSCON_ (.inD_0(inD_0),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
                  .outD_0(BUSCON_outD_0),.outD_3(BUSCON_outD_3),.outD_4(BUSCON_outD_4),.outD_5(BUSCON_outD_5),.outD_6(BUSCON_outD_6),.outD_7(BUSCON_outD_7),
                  .enD_0(BUSCON_enD_0),.enD_3(BUSCON_enD_3),.enD_4(BUSCON_enD_4),.enD_5(BUSCON_enD_5),.enD_6(BUSCON_enD_6),.enD_7(BUSCON_enD_7),
                    .A_0(inA_0),.A_1(inA_1),.A_2(inA_2),.A_3(inA_3),.A_4(inA_4),.BCSL(BCSL),.HLDAL(HLDAL),.DSPBRQL(DSPBRQL),.ID_0(ID_0),.INTL(INTL),.IORDL(IORDL),.IOWRL(IOWRL),.INCYCL(INCYCL),.RESET(RESET),.RUN(RUN),.STOP(STOP),.ACKINT(ACKINT),.BHOLDL(BHOLDL),.BUSOE(BUSOE),.CMDWRL(CMDWRL),.CONWRL(CONWRL),.DSPBAKL(DSPBAKL),.DSTRDL_0(DSTRDL_0),.DSTRDL_1(DSTRDL_1),.DSTRDL_2(DSTRDL_2),.INCRDL(INCRDL),.OUTCRDL(OUTCRDL),.PCWRL_0(PCWRL_0),.PCWRL_1(PCWRL_1),.PCWRL_2(PCWRL_2),.SRCRDL_0(SRCRDL_0),.SRCRDL_1(SRCRDL_1),.SRCRDL_2(SRCRDL_2),.STRD(STRD),.TESTWRL(TESTWRL));//[00054] BUSCON_(D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
                                                                                //[00055]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
                                                                                //[00056]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL) = BUSCON(D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,
                                                                                //[00057]    A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,IORDL,IOWRL,INCYCL,RESET,RUN,STOP);

/* Locally invert some inputs, and buffer to keep fanouts down */

assign RESET = ~RESETL;                                                         //[00061] RESETINV_(RESET) = N1B(RESETL);
assign ID_0 = inD_0;                                                              //[00062] DBUF_0_(ID_0) = B3A(D_0);
assign ID_1 = inD_1;                                                              //[00063] DBUF_1_(ID_1) = B3A(D_1);
assign ID_2 = inD_2;                                                              //[00064] DBUF_2_(ID_2) = B3A(D_2);
assign ID_3 = inD_3;                                                              //[00065] DBUF_3_(ID_3) = B3A(D_3);
assign ID_4 = inD_4;                                                              //[00066] DBUF_4_(ID_4) = B3A(D_4);
assign ID_5 = inD_5;                                                              //[00067] DBUF_5_(ID_5) = B3A(D_5);
assign ID_6 = inD_6;                                                              //[00068] DBUF_6_(ID_6) = B3A(D_6);
assign ID_7 = inD_7;                                                              //[00069] DBUF_7_(ID_7) = B3A(D_7);
assign ID_8 = inD_8;                                                              //[00070] DBUF_8_(ID_8) = B3A(D_8);
assign ID_9 = inD_9;                                                              //[00071] DBUF_9_(ID_9) = B3A(D_9);
assign ID_10 = inD_10;                                                            //[00072] DBUF_10_(ID_10) = B3A(D_10);
assign ID_11 = inD_11;                                                            //[00073] DBUF_11_(ID_11) = B3A(D_11);
assign ID_12 = inD_12;                                                            //[00074] DBUF_12_(ID_12) = B3A(D_12);
assign ID_13 = inD_13;                                                            //[00075] DBUF_13_(ID_13) = B3A(D_13);
assign ID_14 = inD_14;                                                            //[00076] DBUF_14_(ID_14) = B3A(D_14);
assign ID_15 = inD_15;                                                            //[00077] DBUF_15_(ID_15) = B3A(D_15);

/* MUX bidirectional busses to next level */

assign outD_0 = (BUSCON_outD_0 & BUSCON_enD_0) | (STATE_outD_0 & STATE_enD_0) | (DATA_outD_0 & DATA_enD_0);
assign outD_1 = (STATE_outD_1 & STATE_enD_1) | (DATA_outD_1 & DATA_enD_1);
assign outD_2 = (STATE_outD_2 & STATE_enD_2) | (DATA_outD_2 & DATA_enD_2);
assign outD_3 = (BUSCON_outD_3 & BUSCON_enD_3) | (STATE_outD_3 & STATE_enD_3) | (DATA_outD_3 & DATA_enD_3);
assign outD_4 = (BUSCON_outD_4 & BUSCON_enD_4) | (STATE_outD_4 & STATE_enD_4) | (DATA_outD_4 & DATA_enD_4);
assign outD_5 = (BUSCON_outD_5 & BUSCON_enD_5) | (STATE_outD_5 & STATE_enD_5) | (DATA_outD_5 & DATA_enD_5);
assign outD_6 = (BUSCON_outD_6 & BUSCON_enD_6) | (STATE_outD_6 & STATE_enD_6) | (DATA_outD_6 & DATA_enD_6);
assign outD_7 = (BUSCON_outD_7 & BUSCON_enD_7) | (STATE_outD_7 & STATE_enD_7) | (DATA_outD_7 & DATA_enD_7);
assign outD_8 = (DATA_outD_8 & DATA_enD_8);
assign outD_9 = (DATA_outD_9 & DATA_enD_9);
assign outD_10 = (DATA_outD_10 & DATA_enD_10);
assign outD_11 = (DATA_outD_11 & DATA_enD_11);
assign outD_12 = (DATA_outD_12 & DATA_enD_12);
assign outD_13 = (DATA_outD_13 & DATA_enD_13);
assign outD_14 = (DATA_outD_14 & DATA_enD_14);
assign outD_15 = (DATA_outD_15 & DATA_enD_15);

assign enD_0 = BUSCON_enD_0 | STATE_enD_0 | DATA_enD_0;
assign enD_1 = STATE_enD_1 | DATA_enD_1;
assign enD_2 = STATE_enD_2 | DATA_enD_2;
assign enD_3 = BUSCON_enD_3 | STATE_enD_3 | DATA_enD_3;
assign enD_4 = BUSCON_enD_4 | STATE_enD_4 | DATA_enD_4;
assign enD_5 = BUSCON_enD_5 | STATE_enD_5 | DATA_enD_5;
assign enD_6 = BUSCON_enD_6 | STATE_enD_6 | DATA_enD_6;
assign enD_7 = BUSCON_enD_7 | STATE_enD_7 | DATA_enD_7;
assign enD_8 = DATA_enD_8;
assign enD_9 = DATA_enD_9;
assign enD_10 = DATA_enD_10;
assign enD_11 = DATA_enD_11;
assign enD_12 = DATA_enD_12;
assign enD_13 = DATA_enD_13;
assign enD_14 = DATA_enD_14;
assign enD_15 = DATA_enD_15;

assign outA_0 = (ADDR_outA_0 & ADDR_enA_0);
assign outA_1 = (ADDR_outA_1 & ADDR_enA_1);
assign outA_2 = (ADDR_outA_2 & ADDR_enA_2);
assign outA_3 = (ADDR_outA_3 & ADDR_enA_3);
assign outA_4 = (ADDR_outA_4 & ADDR_enA_4);
assign outA_5 = (ADDR_outA_5 & ADDR_enA_5);
assign outA_6 = (ADDR_outA_6 & ADDR_enA_6);
assign outA_7 = (ADDR_outA_7 & ADDR_enA_7);
assign outA_8 = (ADDR_outA_8 & ADDR_enA_8);
assign outA_9 = (ADDR_outA_9 & ADDR_enA_9);
assign outA_10 = (ADDR_outA_10 & ADDR_enA_10);
assign outA_11 = (ADDR_outA_11 & ADDR_enA_11);
assign outA_12 = (ADDR_outA_12 & ADDR_enA_12);
assign outA_13 = (ADDR_outA_13 & ADDR_enA_13);
assign outA_14 = (ADDR_outA_14 & ADDR_enA_14);
assign outA_15 = (ADDR_outA_15 & ADDR_enA_15);
assign outA_16 = (ADDR_outA_16 & ADDR_enA_16);
assign outA_17 = (ADDR_outA_17 & ADDR_enA_17);
assign outA_18 = (ADDR_outA_18 & ADDR_enA_18);
assign outA_19 = (ADDR_outA_19 & ADDR_enA_19);

assign enA_0 = ADDR_enA_0;
assign enA_1 = ADDR_enA_1;
assign enA_2 = ADDR_enA_2;
assign enA_3 = ADDR_enA_3;
assign enA_4 = ADDR_enA_4;
assign enA_5 = ADDR_enA_5;
assign enA_6 = ADDR_enA_6;
assign enA_7 = ADDR_enA_7;
assign enA_8 = ADDR_enA_8;
assign enA_9 = ADDR_enA_9;
assign enA_10 = ADDR_enA_10;
assign enA_11 = ADDR_enA_11;
assign enA_12 = ADDR_enA_12;
assign enA_13 = ADDR_enA_13;
assign enA_14 = ADDR_enA_14;
assign enA_15 = ADDR_enA_15;
assign enA_16 = ADDR_enA_16;
assign enA_17 = ADDR_enA_17;
assign enA_18 = ADDR_enA_18;
assign enA_19 = ADDR_enA_19;

endmodule                                                                       //[00079] END MODULE;