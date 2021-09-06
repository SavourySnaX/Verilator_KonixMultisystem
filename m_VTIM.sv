                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	vtim-hdl					*
*	2/11/88						*
********************************************************/
/* verilator lint_off SYNCASYNCNET */
/*
This module provides the video timing in the SLIPSTREAM chip on the ACW
*/

module m_VTIM                                                                   //[00015] MODULE VTIM;
(                                                                               //[00015] MODULE VTIM;

    input    RESETL_0,                                                          //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    CLK,                                                               //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_0,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_1,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_2,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_3,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_4,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_5,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_6,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    WD_7,                                                              //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    MODE_0,                                                            //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    MODE_1,                                                            //[00017] INPUTS	RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,
    input    SCRL_0,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    SCRL_1,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    SCRL_2,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    VVACTIVE,                                                          //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HVACTIVE,                                                          //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    VSTART,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HC_0,                                                              //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HC_1,                                                              //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HC_2,                                                              //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HC_3,                                                              //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HD1,                                                               //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    PSUEDO,                                                            //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
    input    HVHOLD,                                                            //[00019]    HVHOLD,NOWRAP;
    input    NOWRAP,                                                            //[00019]    HVHOLD,NOWRAP;
                                                                                //[00018]    SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,
                                                                                //[00019]    HVHOLD,NOWRAP;
    output    VBUSYL_0,                                                         //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    VBUSYL_1,                                                         //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    VCS,                                                              //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    VOE,                                                              //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    VCAS,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    VRAS,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SAEN,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_0,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_1,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_2,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_3,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_4,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_5,                                                             //[00020] OUTPUTS	VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
    output    SA_6,                                                             //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_7,                                                             //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_8,                                                             //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_9,                                                             //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_10,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_11,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_12,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_13,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_14,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_15,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_16,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    SA_17,                                                            //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    VHOLDL,                                                           //[00021]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
    output    PIXLD_0,                                                          //[00022]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1;
    output    PIXLD_1,                                                          //[00022]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1;
    output    PIXAD_0,                                                          //[00022]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1;
    output    PIXAD_1                                                           //[00022]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1;
);                                                                              //[00015] MODULE VTIM;
                                                                                //[00023] LEVEL FUNCTION;
wire SCR_1;                                                                     //[00029] SCR_1_(SCR_1,SCRB_1) = LD1A(WD_1,SCRL_0);
wire SCRB_1;                                                                    //[00029] SCR_1_(SCR_1,SCRB_1) = LD1A(WD_1,SCRL_0);
wire SCR_2;                                                                     //[00030] SCR_2_(SCR_2,SCRB_2) = LD1A(WD_2,SCRL_0);
wire SCRB_2;                                                                    //[00030] SCR_2_(SCR_2,SCRB_2) = LD1A(WD_2,SCRL_0);
wire SCR_3;                                                                     //[00031] SCR_3_(SCR_3,SCRB_3) = LD1A(WD_3,SCRL_0);
wire SCRB_3;                                                                    //[00031] SCR_3_(SCR_3,SCRB_3) = LD1A(WD_3,SCRL_0);
wire SCR_4;                                                                     //[00032] SCR_4_(SCR_4,SCRB_4) = LD1A(WD_4,SCRL_0);
wire SCRB_4;                                                                    //[00032] SCR_4_(SCR_4,SCRB_4) = LD1A(WD_4,SCRL_0);
wire SCR_5;                                                                     //[00033] SCR_5_(SCR_5,SCRB_5) = LD1A(WD_5,SCRL_0);
wire SCRB_5;                                                                    //[00033] SCR_5_(SCR_5,SCRB_5) = LD1A(WD_5,SCRL_0);
wire SCR_6;                                                                     //[00034] SCR_6_(SCR_6,SCRB_6) = LD1A(WD_6,SCRL_0);
wire SCRB_6;                                                                    //[00034] SCR_6_(SCR_6,SCRB_6) = LD1A(WD_6,SCRL_0);
wire SCR_7;                                                                     //[00035] SCR_7_(SCR_7,SCRB_7) = LD1A(WD_7,SCRL_0);
wire SCRB_7;                                                                    //[00035] SCR_7_(SCR_7,SCRB_7) = LD1A(WD_7,SCRL_0);
wire SCR_8;                                                                     //[00036] SCR_8_(SCR_8,SCRB_8) = LD1A(WD_0,SCRL_1);
wire SCRB_8;                                                                    //[00036] SCR_8_(SCR_8,SCRB_8) = LD1A(WD_0,SCRL_1);
wire SCR_9;                                                                     //[00037] SCR_9_(SCR_9,SCRB_9) = LD1A(WD_1,SCRL_1);
wire SCRB_9;                                                                    //[00037] SCR_9_(SCR_9,SCRB_9) = LD1A(WD_1,SCRL_1);
wire SCR_10;                                                                    //[00038] SCR_10_(SCR_10,SCRB_10) = LD1A(WD_2,SCRL_1);
wire SCRB_10;                                                                   //[00038] SCR_10_(SCR_10,SCRB_10) = LD1A(WD_2,SCRL_1);
wire SCR_11;                                                                    //[00039] SCR_11_(SCR_11,SCRB_11) = LD1A(WD_3,SCRL_1);
wire SCRB_11;                                                                   //[00039] SCR_11_(SCR_11,SCRB_11) = LD1A(WD_3,SCRL_1);
wire SCR_12;                                                                    //[00040] SCR_12_(SCR_12,SCRB_12) = LD1A(WD_4,SCRL_1);
wire SCRB_12;                                                                   //[00040] SCR_12_(SCR_12,SCRB_12) = LD1A(WD_4,SCRL_1);
wire SCR_13;                                                                    //[00041] SCR_13_(SCR_13,SCRB_13) = LD1A(WD_5,SCRL_1);
wire SCRB_13;                                                                   //[00041] SCR_13_(SCR_13,SCRB_13) = LD1A(WD_5,SCRL_1);
wire SCR_14;                                                                    //[00042] SCR_14_(SCR_14,SCRB_14) = LD1A(WD_6,SCRL_1);
wire SCRB_14;                                                                   //[00042] SCR_14_(SCR_14,SCRB_14) = LD1A(WD_6,SCRL_1);
wire SCR_15;                                                                    //[00043] SCR_15_(SCR_15,SCRB_15) = LD1A(WD_7,SCRL_1);
wire SCRB_15;                                                                   //[00043] SCR_15_(SCR_15,SCRB_15) = LD1A(WD_7,SCRL_1);
wire SCR_16;                                                                    //[00044] SCR_16_(SCR_16,SCRB_16) = LD1A(WD_0,SCRL_2);
wire SCRB_16;                                                                   //[00044] SCR_16_(SCR_16,SCRB_16) = LD1A(WD_0,SCRL_2);
wire SCR_17;                                                                    //[00045] SCR_17_(SCR_17,SCRB_17) = LD1A(WD_1,SCRL_2);
wire SCRB_17;                                                                   //[00045] SCR_17_(SCR_17,SCRB_17) = LD1A(WD_1,SCRL_2);
wire RES;                                                                       //[00052] RES_(RES) = N1B(RESETL_0);
wire RESL;                                                                      //[00053] RESL_(RESL) = N1A(RES);
wire VSTARTL;                                                                   //[00054] VSTARTL_(VSTARTL) = N1A(VSTART);
wire SCRLL_2;                                                                   //[00059] SCRLL_2_(SCRLL_2) = N1A(SCRL_2);
wire LOADL;                                                                     //[00060] NEWSCROLL_(NEWSCROLL,NEWSCROLLL) = SR(SCRLL_2,LOADL);
wire NEWSCROLL;                                                                 //[00060] NEWSCROLL_(NEWSCROLL,NEWSCROLLL) = SR(SCRLL_2,LOADL);
wire NEWSCROLLL;                                                                //[00060] NEWSCROLL_(NEWSCROLL,NEWSCROLLL) = SR(SCRLL_2,LOADL);
wire UPDATEL;                                                                   //[00061] UPDATEL_(UPDATEL) = ND2A(HD1,NEWSCROLL);
wire LOAD;                                                                      //[00062] LOAD_(LOAD) = ND2A(UPDATEL,VSTARTL);
wire LINC;                                                                      //[00066] SA_1_(SA_1,SAB_1,CO_1) = SYNCNT(SCR_1,CLK,RES,LOADL,LINC);
wire SAB_1;                                                                     //[00066] SA_1_(SA_1,SAB_1,CO_1) = SYNCNT(SCR_1,CLK,RES,LOADL,LINC);
wire CO_1;                                                                      //[00066] SA_1_(SA_1,SAB_1,CO_1) = SYNCNT(SCR_1,CLK,RES,LOADL,LINC);
wire SAB_2;                                                                     //[00067] SA_2_(SA_2,SAB_2,CO_2) = SYNCNT(SCR_2,CLK,RES,LOADL,CO_1);
wire CO_2;                                                                      //[00067] SA_2_(SA_2,SAB_2,CO_2) = SYNCNT(SCR_2,CLK,RES,LOADL,CO_1);
wire SAB_3;                                                                     //[00068] SA_3_(SA_3,SAB_3,CO_3) = SYNCNT(SCR_3,CLK,RES,LOADL,CO_2);
wire CO_3;                                                                      //[00068] SA_3_(SA_3,SAB_3,CO_3) = SYNCNT(SCR_3,CLK,RES,LOADL,CO_2);
wire SAB_4;                                                                     //[00069] SA_4_(SA_4,SAB_4,CO_4) = SYNCNT(SCR_4,CLK,RES,LOADL,CO_3);
wire CO_4;                                                                      //[00069] SA_4_(SA_4,SAB_4,CO_4) = SYNCNT(SCR_4,CLK,RES,LOADL,CO_3);
wire SAB_5;                                                                     //[00070] SA_5_(SA_5,SAB_5,CO_5) = SYNCNT(SCR_5,CLK,RES,LOADL,CO_4);
wire CO_5;                                                                      //[00070] SA_5_(SA_5,SAB_5,CO_5) = SYNCNT(SCR_5,CLK,RES,LOADL,CO_4);
wire SAB_6;                                                                     //[00071] SA_6_(SA_6,SAB_6,CO_6) = SYNCNT(SCR_6,CLK,RES,LOADL,CO_5);
wire CO_6;                                                                      //[00071] SA_6_(SA_6,SAB_6,CO_6) = SYNCNT(SCR_6,CLK,RES,LOADL,CO_5);
wire EN_7;                                                                      //[00073] SA_7_(SA_7,SAB_7,CO_7) = SYNCNT(SCR_7,CLK,RES,LOADL,EN_7);
wire SAB_7;                                                                     //[00073] SA_7_(SA_7,SAB_7,CO_7) = SYNCNT(SCR_7,CLK,RES,LOADL,EN_7);
wire CO_7;                                                                      //[00073] SA_7_(SA_7,SAB_7,CO_7) = SYNCNT(SCR_7,CLK,RES,LOADL,EN_7);
wire EN_8;                                                                      //[00074] SA_8_(SA_8,SAB_8,CO_8) = SYNCNT(SCR_8,CLK,RES,LOADL,EN_8);
wire SAB_8;                                                                     //[00074] SA_8_(SA_8,SAB_8,CO_8) = SYNCNT(SCR_8,CLK,RES,LOADL,EN_8);
wire CO_8;                                                                      //[00074] SA_8_(SA_8,SAB_8,CO_8) = SYNCNT(SCR_8,CLK,RES,LOADL,EN_8);
wire SAB_9;                                                                     //[00076] SA_9_(SA_9,SAB_9,CO_9) = SYNCNT(SCR_9,CLK,RES,LOADL,CO_8);
wire CO_9;                                                                      //[00076] SA_9_(SA_9,SAB_9,CO_9) = SYNCNT(SCR_9,CLK,RES,LOADL,CO_8);
wire SAB_10;                                                                    //[00077] SA_10_(SA_10,SAB_10,CO_10) = SYNCNT(SCR_10,CLK,RES,LOADL,CO_9);
wire CO_10;                                                                     //[00077] SA_10_(SA_10,SAB_10,CO_10) = SYNCNT(SCR_10,CLK,RES,LOADL,CO_9);
wire SAB_11;                                                                    //[00078] SA_11_(SA_11,SAB_11,CO_11) = SYNCNT(SCR_11,CLK,RES,LOADL,CO_10);
wire CO_11;                                                                     //[00078] SA_11_(SA_11,SAB_11,CO_11) = SYNCNT(SCR_11,CLK,RES,LOADL,CO_10);
wire SAB_12;                                                                    //[00079] SA_12_(SA_12,SAB_12,CO_12) = SYNCNT(SCR_12,CLK,RES,LOADL,CO_11);
wire CO_12;                                                                     //[00079] SA_12_(SA_12,SAB_12,CO_12) = SYNCNT(SCR_12,CLK,RES,LOADL,CO_11);
wire SAB_13;                                                                    //[00080] SA_13_(SA_13,SAB_13,CO_13) = SYNCNT(SCR_13,CLK,RES,LOADL,CO_12);
wire CO_13;                                                                     //[00080] SA_13_(SA_13,SAB_13,CO_13) = SYNCNT(SCR_13,CLK,RES,LOADL,CO_12);
wire SAB_14;                                                                    //[00081] SA_14_(SA_14,SAB_14,CO_14) = SYNCNT(SCR_14,CLK,RES,LOADL,CO_13);
wire CO_14;                                                                     //[00081] SA_14_(SA_14,SAB_14,CO_14) = SYNCNT(SCR_14,CLK,RES,LOADL,CO_13);
wire SAB_15;                                                                    //[00082] SA_15_(SA_15,SAB_15,CO_15) = SYNCNT(SCR_15,CLK,RES,LOADL,CO_14);
wire CO_15;                                                                     //[00082] SA_15_(SA_15,SAB_15,CO_15) = SYNCNT(SCR_15,CLK,RES,LOADL,CO_14);
wire INC;                                                                       //[00086] NOWRAP_(INC) = AND2A(CO_15,NOWRAP);
wire SAB_16;                                                                    //[00087] SA_16_(SA_16,SAB_16,CO_16) = SYNCNT(SCR_16,CLK,RES,LOADL,INC);
wire CO_16;                                                                     //[00087] SA_16_(SA_16,SAB_16,CO_16) = SYNCNT(SCR_16,CLK,RES,LOADL,INC);
wire SAB_17;                                                                    //[00088] SAL_17_(SA_17,SAB_17,CO_17) = SYNCNT(SCR_17,CLK,RES,LOADL,CO_16);
wire CO_17;                                                                     //[00088] SAL_17_(SA_17,SAB_17,CO_17) = SYNCNT(SCR_17,CLK,RES,LOADL,CO_16);
wire LORES;                                                                     //[00090] ENL_7_(ENL_7) = AO2A(LORES,HINC,LORESL,CO_6);
wire HINC;                                                                      //[00090] ENL_7_(ENL_7) = AO2A(LORES,HINC,LORESL,CO_6);
wire LORESL;                                                                    //[00090] ENL_7_(ENL_7) = AO2A(LORES,HINC,LORESL,CO_6);
wire ENL_7;                                                                     //[00090] ENL_7_(ENL_7) = AO2A(LORES,HINC,LORESL,CO_6);
wire ENL_8;                                                                     //[00091] ENL_8_(ENL_8) = AO2A(LORES,CO_7,LORESL,HINC);
wire LOACTIVE;                                                                  //[00101] LOACTIVE_(LOACTIVE) = ND2A(LORES,HC_3);
wire ACTIVEL;                                                                   //[00102] ACTIVEL_(ACTIVEL) = ND3A(VVACTIVE,HVACTIVE,LOACTIVE);
wire ACTIVE;                                                                    //[00103] ACTIVE_(ACTIVE) = N1C(ACTIVEL);
wire HCB_0;                                                                     //[00119] HCB_0_(HCB_0) = N1C(HC_0);
wire HCB_1;                                                                     //[00120] HCB_1_(HCB_1) = N1C(HC_1);
wire HCB_2;                                                                     //[00121] HCB_2_(HCB_2) = N1C(HC_2);
wire HCB_3;                                                                     //[00122] HCB_3_(HCB_3) = N1C(HC_3);
wire ZEROL;                                                                     //[00124] ZERO_(ZEROL) = ND3A(HCB_0,HCB_1,HCB_2);
wire THREE;                                                                     //[00125] THREE_(THREE) = NR3A(HCB_0,HCB_1,HC_2);
wire THREEL;                                                                    //[00126] THREEL_(THREEL) = ND2A(HC_0,HC_1);
wire FOUR;                                                                      //[00127] FOUR_(FOUR) = NR3A(HC_0,HC_1,HCB_2);
wire FIVE;                                                                      //[00128] FIVE_(FIVE) = NR3A(HCB_0,HC_1,HCB_2);
wire SIX;                                                                       //[00129] SIX_(SIX) = NR3A(HC_0,HCB_1,HCB_2);
wire DEC37;                                                                     //[00131] DEC37L_(DEC37) = ND2A(THREEL,HCB_2);
wire DEC34L;                                                                    //[00138] DEC34L_(DEC34L) = NR2A(THREE,FOUR);
wire PIXLDD_0;                                                                  //[00139] PIXLDD_0_(PIXLDD_0) = OR2A(DEC34L,ACTIVEL);
wire PIXLDL_0;                                                                  //[00140] PIXLD_0_(PIXLD_0,PIXLDL_0) = FD2A(PIXLDD_0,CLK,RESL);
wire DEC56L;                                                                    //[00141] DEC56L_(DEC56L) = NR2A(FIVE,SIX);
wire PIXLDD_1;                                                                  //[00142] PIXLDD_1_(PIXLDD_1) = OR2A(DEC56L,ACTIVEL);
wire PIXLDL_1;                                                                  //[00143] PIXLD_1_(PIXLD_1,PIXLDL_1) = FD2A(PIXLDD_1,CLK,RESL);
wire PIXADL_0;                                                                  //[00153] PIXADL_0_(PIXADL_0) = AO2B(LORES,HC_2,LORESL,HC_1);
wire PIXADL_1;                                                                  //[00154] PIXADL_1_(PIXADL_1) = AO2B(LORES,HCB_3,LORESL,HC_2);
wire DEC46L;                                                                    //[00160] DEC46L_(DEC46L) = NR2A(FOUR,SIX);
wire CLKL;                                                                      //[00164] CLKL_(CLKL) = N1C(CLK);
wire VCSL_0;                                                                    //[00165] VCS_0_(VCSL_0,VCS_0) = FD2A(DEC46L,CLKL,RESL);
wire VCS_0;                                                                     //[00165] VCS_0_(VCSL_0,VCS_0) = FD2A(DEC46L,CLKL,RESL);
wire VCSL_1;                                                                    //[00166] VCS_1_(VCSL_1,VCS_1) = FD2A(DEC46L,CLK,RESL);
wire VCS_1;                                                                     //[00166] VCS_1_(VCSL_1,VCS_1) = FD2A(DEC46L,CLK,RESL);
wire STATIC;                                                                    //[00170] STATIC_(STATIC) = N1A(PSUEDO);
wire SAENL;                                                                     //[00171] SAENL_(SAENL) = N1A(SAEN);
wire VCST_0;                                                                    //[00173] VCST_0_(VCST_0) = ND2A(VCS_0,SAEN);
wire VCST_1;                                                                    //[00174] VCST_1_(VCST_1) = ND2A(VCS_1,SAEN);
wire DEC45L;                                                                    //[00184] DEC45L_(DEC45L) = NR2A(FOUR,FIVE);
wire DEC45A;                                                                    //[00185] DEC45A_(DEC45A) = NR2A(DEC45L,ACTIVEL);
wire VCASL;                                                                     //[00186] VCAS_(VCAS,VCASL) = FD2A(DEC45A,CLKL,RESL);
wire VRASL;                                                                     //[00187] VRAS_(VRAS,VRASL) = FD2A(VCAS,CLKL,RESL);

/* the scroll registers */

LD1A SCR_1__inst (.q(SCR_1),.qL(SCRB_1),.d(WD_1),.en(SCRL_0));                  //[00029] SCR_1_(SCR_1,SCRB_1) = LD1A(WD_1,SCRL_0);
LD1A SCR_2__inst (.q(SCR_2),.qL(SCRB_2),.d(WD_2),.en(SCRL_0));                  //[00030] SCR_2_(SCR_2,SCRB_2) = LD1A(WD_2,SCRL_0);
LD1A SCR_3__inst (.q(SCR_3),.qL(SCRB_3),.d(WD_3),.en(SCRL_0));                  //[00031] SCR_3_(SCR_3,SCRB_3) = LD1A(WD_3,SCRL_0);
LD1A SCR_4__inst (.q(SCR_4),.qL(SCRB_4),.d(WD_4),.en(SCRL_0));                  //[00032] SCR_4_(SCR_4,SCRB_4) = LD1A(WD_4,SCRL_0);
LD1A SCR_5__inst (.q(SCR_5),.qL(SCRB_5),.d(WD_5),.en(SCRL_0));                  //[00033] SCR_5_(SCR_5,SCRB_5) = LD1A(WD_5,SCRL_0);
LD1A SCR_6__inst (.q(SCR_6),.qL(SCRB_6),.d(WD_6),.en(SCRL_0));                  //[00034] SCR_6_(SCR_6,SCRB_6) = LD1A(WD_6,SCRL_0);
LD1A SCR_7__inst (.q(SCR_7),.qL(SCRB_7),.d(WD_7),.en(SCRL_0));                  //[00035] SCR_7_(SCR_7,SCRB_7) = LD1A(WD_7,SCRL_0);
LD1A SCR_8__inst (.q(SCR_8),.qL(SCRB_8),.d(WD_0),.en(SCRL_1));                  //[00036] SCR_8_(SCR_8,SCRB_8) = LD1A(WD_0,SCRL_1);
LD1A SCR_9__inst (.q(SCR_9),.qL(SCRB_9),.d(WD_1),.en(SCRL_1));                  //[00037] SCR_9_(SCR_9,SCRB_9) = LD1A(WD_1,SCRL_1);
LD1A SCR_10__inst (.q(SCR_10),.qL(SCRB_10),.d(WD_2),.en(SCRL_1));               //[00038] SCR_10_(SCR_10,SCRB_10) = LD1A(WD_2,SCRL_1);
LD1A SCR_11__inst (.q(SCR_11),.qL(SCRB_11),.d(WD_3),.en(SCRL_1));               //[00039] SCR_11_(SCR_11,SCRB_11) = LD1A(WD_3,SCRL_1);
LD1A SCR_12__inst (.q(SCR_12),.qL(SCRB_12),.d(WD_4),.en(SCRL_1));               //[00040] SCR_12_(SCR_12,SCRB_12) = LD1A(WD_4,SCRL_1);
LD1A SCR_13__inst (.q(SCR_13),.qL(SCRB_13),.d(WD_5),.en(SCRL_1));               //[00041] SCR_13_(SCR_13,SCRB_13) = LD1A(WD_5,SCRL_1);
LD1A SCR_14__inst (.q(SCR_14),.qL(SCRB_14),.d(WD_6),.en(SCRL_1));               //[00042] SCR_14_(SCR_14,SCRB_14) = LD1A(WD_6,SCRL_1);
LD1A SCR_15__inst (.q(SCR_15),.qL(SCRB_15),.d(WD_7),.en(SCRL_1));               //[00043] SCR_15_(SCR_15,SCRB_15) = LD1A(WD_7,SCRL_1);
LD1A SCR_16__inst (.q(SCR_16),.qL(SCRB_16),.d(WD_0),.en(SCRL_2));               //[00044] SCR_16_(SCR_16,SCRB_16) = LD1A(WD_0,SCRL_2);
LD1A SCR_17__inst (.q(SCR_17),.qL(SCRB_17),.d(WD_1),.en(SCRL_2));               //[00045] SCR_17_(SCR_17,SCRB_17) = LD1A(WD_1,SCRL_2);

/* the pixel address counters */
/* the counter is organised as either:- 6 + 11 or 7 + 10 bits depending on
the resolution.*/
/* NB the LSB of the screen address is always zero */

assign RES = ~RESETL_0;                                                         //[00052] RES_(RES) = N1B(RESETL_0);
assign RESL = ~RES;                                                             //[00053] RESL_(RESL) = N1A(RES);
assign VSTARTL = ~VSTART;                                                       //[00054] VSTARTL_(VSTARTL) = N1A(VSTART);

/* The counter is loaded either at the top of the screen or
at the begining of the line after scrl2 is written */

assign SCRLL_2 = ~SCRL_2;                                                       //[00059] SCRLL_2_(SCRLL_2) = N1A(SCRL_2);
SR NEWSCROLL__inst (.Q(NEWSCROLL),.QL(NEWSCROLLL),.S(SCRLL_2),.R(LOADL));       //[00060] NEWSCROLL_(NEWSCROLL,NEWSCROLLL) = SR(SCRLL_2,LOADL);
assign UPDATEL = ~(HD1 & NEWSCROLL);                                            //[00061] UPDATEL_(UPDATEL) = ND2A(HD1,NEWSCROLL);
assign LOAD = ~(UPDATEL & VSTARTL);                                             //[00062] LOAD_(LOAD) = ND2A(UPDATEL,VSTARTL);
assign LOADL = ~LOAD;                                                           //[00063] LOADL_(LOADL) = N1B(LOAD);

assign SA_0 = RES;                                                              //[00065] SA_0_(SA_0) = B3A(RES);
SYNCNT SA_1__inst (.Q(SA_1),.QB(SAB_1),.CO(CO_1),.D(SCR_1),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(LINC));//[00066] SA_1_(SA_1,SAB_1,CO_1) = SYNCNT(SCR_1,CLK,RES,LOADL,LINC);
SYNCNT SA_2__inst (.Q(SA_2),.QB(SAB_2),.CO(CO_2),.D(SCR_2),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_1));//[00067] SA_2_(SA_2,SAB_2,CO_2) = SYNCNT(SCR_2,CLK,RES,LOADL,CO_1);
SYNCNT SA_3__inst (.Q(SA_3),.QB(SAB_3),.CO(CO_3),.D(SCR_3),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_2));//[00068] SA_3_(SA_3,SAB_3,CO_3) = SYNCNT(SCR_3,CLK,RES,LOADL,CO_2);
SYNCNT SA_4__inst (.Q(SA_4),.QB(SAB_4),.CO(CO_4),.D(SCR_4),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_3));//[00069] SA_4_(SA_4,SAB_4,CO_4) = SYNCNT(SCR_4,CLK,RES,LOADL,CO_3);
SYNCNT SA_5__inst (.Q(SA_5),.QB(SAB_5),.CO(CO_5),.D(SCR_5),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_4));//[00070] SA_5_(SA_5,SAB_5,CO_5) = SYNCNT(SCR_5,CLK,RES,LOADL,CO_4);
SYNCNT SA_6__inst (.Q(SA_6),.QB(SAB_6),.CO(CO_6),.D(SCR_6),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_5));//[00071] SA_6_(SA_6,SAB_6,CO_6) = SYNCNT(SCR_6,CLK,RES,LOADL,CO_5);

SYNCNT SA_7__inst (.Q(SA_7),.QB(SAB_7),.CO(CO_7),.D(SCR_7),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(EN_7));//[00073] SA_7_(SA_7,SAB_7,CO_7) = SYNCNT(SCR_7,CLK,RES,LOADL,EN_7);
SYNCNT SA_8__inst (.Q(SA_8),.QB(SAB_8),.CO(CO_8),.D(SCR_8),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(EN_8));//[00074] SA_8_(SA_8,SAB_8,CO_8) = SYNCNT(SCR_8,CLK,RES,LOADL,EN_8);

SYNCNT SA_9__inst (.Q(SA_9),.QB(SAB_9),.CO(CO_9),.D(SCR_9),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_8));//[00076] SA_9_(SA_9,SAB_9,CO_9) = SYNCNT(SCR_9,CLK,RES,LOADL,CO_8);
SYNCNT SA_10__inst (.Q(SA_10),.QB(SAB_10),.CO(CO_10),.D(SCR_10),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_9));//[00077] SA_10_(SA_10,SAB_10,CO_10) = SYNCNT(SCR_10,CLK,RES,LOADL,CO_9);
SYNCNT SA_11__inst (.Q(SA_11),.QB(SAB_11),.CO(CO_11),.D(SCR_11),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_10));//[00078] SA_11_(SA_11,SAB_11,CO_11) = SYNCNT(SCR_11,CLK,RES,LOADL,CO_10);
SYNCNT SA_12__inst (.Q(SA_12),.QB(SAB_12),.CO(CO_12),.D(SCR_12),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_11));//[00079] SA_12_(SA_12,SAB_12,CO_12) = SYNCNT(SCR_12,CLK,RES,LOADL,CO_11);
SYNCNT SA_13__inst (.Q(SA_13),.QB(SAB_13),.CO(CO_13),.D(SCR_13),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_12));//[00080] SA_13_(SA_13,SAB_13,CO_13) = SYNCNT(SCR_13,CLK,RES,LOADL,CO_12);
SYNCNT SA_14__inst (.Q(SA_14),.QB(SAB_14),.CO(CO_14),.D(SCR_14),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_13));//[00081] SA_14_(SA_14,SAB_14,CO_14) = SYNCNT(SCR_14,CLK,RES,LOADL,CO_13);
SYNCNT SA_15__inst (.Q(SA_15),.QB(SAB_15),.CO(CO_15),.D(SCR_15),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_14));//[00082] SA_15_(SA_15,SAB_15,CO_15) = SYNCNT(SCR_15,CLK,RES,LOADL,CO_14);

/* the screen may or may not wrap around 64k boundary */

assign INC = CO_15 & NOWRAP;                                                    //[00086] NOWRAP_(INC) = AND2A(CO_15,NOWRAP);
SYNCNT SA_16__inst (.Q(SA_16),.QB(SAB_16),.CO(CO_16),.D(SCR_16),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(INC));//[00087] SA_16_(SA_16,SAB_16,CO_16) = SYNCNT(SCR_16,CLK,RES,LOADL,INC);
SYNCNT SAL_17__inst (.Q(SA_17),.QB(SAB_17),.CO(CO_17),.D(SCR_17),.CLK(CLK),.CLR(RES),.LDL(LOADL),.CI(CO_16));//[00088] SAL_17_(SA_17,SAB_17,CO_17) = SYNCNT(SCR_17,CLK,RES,LOADL,CO_16);

assign ENL_7 = ~((LORES & HINC)|(LORESL & CO_6));                               //[00090] ENL_7_(ENL_7) = AO2A(LORES,HINC,LORESL,CO_6);
assign ENL_8 = ~((LORES & CO_7)|(LORESL & HINC));                               //[00091] ENL_8_(ENL_8) = AO2A(LORES,CO_7,LORESL,HINC);
assign EN_7 = ~ENL_7;                                                           //[00092] EN_7_(EN_7) = N1A(ENL_7);
assign EN_8 = ~ENL_8;                                                           //[00093] EN_8_(EN_8) = N1A(ENL_8);

/* identify when the video mechanism is active */
/* vvactive is asserted for all lines in the picture and for refresh */
/* hvactive is leads border by eight ticks */
/* in low res the video mechanism is only active half the time */

assign LORES = ~(MODE_0 | MODE_1);                                              //[00100] LORES_(LORES) = NR2A(MODE_0,MODE_1);
assign LOACTIVE = ~(LORES & HC_3);                                              //[00101] LOACTIVE_(LOACTIVE) = ND2A(LORES,HC_3);
assign ACTIVEL = ~(VVACTIVE & HVACTIVE & LOACTIVE);                             //[00102] ACTIVEL_(ACTIVEL) = ND3A(VVACTIVE,HVACTIVE,LOACTIVE);
assign ACTIVE = ~ACTIVEL;                                                       //[00103] ACTIVE_(ACTIVE) = N1C(ACTIVEL);

/* the low screen address counter is incremented
when hc[0..2] is five or seven */

assign LINC = HC_0 & HC_2 & ACTIVE;                                             //[00108] LINC_(LINC) = AND3A(HC_0,HC_2,ACTIVE);

/* the high screen address counter is incremented every line */

assign HINC = HD1 & VVACTIVE;                                                   //[00112] HINC_(HINC) = AND2A(HD1,VVACTIVE);

/* vbusy[0] signals that ROM/DRAM cycles may not begin.
It is asserted from 1 to 7 */
/* vbusy[1] signals that SRAM/PSRAM cycles may not begin.
It is asserted from 3 to 7 */

assign HCB_0 = ~HC_0;                                                           //[00119] HCB_0_(HCB_0) = N1C(HC_0);
assign HCB_1 = ~HC_1;                                                           //[00120] HCB_1_(HCB_1) = N1C(HC_1);
assign HCB_2 = ~HC_2;                                                           //[00121] HCB_2_(HCB_2) = N1C(HC_2);
assign HCB_3 = ~HC_3;                                                           //[00122] HCB_3_(HCB_3) = N1C(HC_3);

assign ZEROL = ~(HCB_0 & HCB_1 & HCB_2);                                        //[00124] ZERO_(ZEROL) = ND3A(HCB_0,HCB_1,HCB_2);
assign THREE = ~(HCB_0 | HCB_1 | HC_2);                                         //[00125] THREE_(THREE) = NR3A(HCB_0,HCB_1,HC_2);
assign THREEL = ~(HC_0 & HC_1);                                                 //[00126] THREEL_(THREEL) = ND2A(HC_0,HC_1);
assign FOUR = ~(HC_0 | HC_1 | HCB_2);                                           //[00127] FOUR_(FOUR) = NR3A(HC_0,HC_1,HCB_2);
assign FIVE = ~(HCB_0 | HC_1 | HCB_2);                                          //[00128] FIVE_(FIVE) = NR3A(HCB_0,HC_1,HCB_2);
assign SIX = ~(HC_0 | HCB_1 | HCB_2);                                           //[00129] SIX_(SIX) = NR3A(HC_0,HCB_1,HCB_2);

assign DEC37 = ~(THREEL & HCB_2);                                               //[00131] DEC37L_(DEC37) = ND2A(THREEL,HCB_2);
assign VBUSYL_0 = ~(ZEROL & ACTIVE);                                            //[00132] VBUSYL_0_(VBUSYL_0) = ND2C(ZEROL,ACTIVE);

assign VBUSYL_1 = ~(DEC37 & ACTIVE);                                            //[00134] VBUSY_1_(VBUSYL_1) = ND2C(DEC37,ACTIVE);

/* pixld[0] & pixld[1] follow each other and must be glitch free */

assign DEC34L = ~(THREE | FOUR);                                                //[00138] DEC34L_(DEC34L) = NR2A(THREE,FOUR);
assign PIXLDD_0 = DEC34L | ACTIVEL;                                             //[00139] PIXLDD_0_(PIXLDD_0) = OR2A(DEC34L,ACTIVEL);
FD2A PIXLD_0__inst (.q(PIXLD_0),.qL(PIXLDL_0),.d(PIXLDD_0),.clk(CLK),.rL(RESL));//[00140] PIXLD_0_(PIXLD_0,PIXLDL_0) = FD2A(PIXLDD_0,CLK,RESL);
assign DEC56L = ~(FIVE | SIX);                                                  //[00141] DEC56L_(DEC56L) = NR2A(FIVE,SIX);
assign PIXLDD_1 = DEC56L | ACTIVEL;                                             //[00142] PIXLDD_1_(PIXLDD_1) = OR2A(DEC56L,ACTIVEL);
FD2A PIXLD_1__inst (.q(PIXLD_1),.qL(PIXLDL_1),.d(PIXLDD_1),.clk(CLK),.rL(RESL));//[00143] PIXLD_1_(PIXLD_1,PIXLDL_1) = FD2A(PIXLDD_1,CLK,RESL);

/* the screen address is enabled during counts 4 to 7 */

assign SAEN = ~(ACTIVEL | HCB_2);                                               //[00148] SAEN_(SAEN) = NR2C(ACTIVEL,HCB_2);

/* the pixel number depends on the mode */

assign LORESL = ~LORES;                                                         //[00152] LORESL_(LORESL) = N1A(LORES);
assign PIXADL_0 = ~((LORES & HC_2)|(LORESL & HC_1));                            //[00153] PIXADL_0_(PIXADL_0) = AO2B(LORES,HC_2,LORESL,HC_1);
assign PIXADL_1 = ~((LORES & HCB_3)|(LORESL & HC_2));                           //[00154] PIXADL_1_(PIXADL_1) = AO2B(LORES,HCB_3,LORESL,HC_2);
assign PIXAD_0 = PIXADL_0;                                                      //[00155] PIXAD_0_(PIXAD_0) = B1A(PIXADL_0);
assign PIXAD_1 = PIXADL_1;                                                      //[00156] PIXAD_1_(PIXAD_1) = B1A(PIXADL_1);

/* generate timing for PSRAM chip enable */

assign DEC46L = ~(FOUR | SIX);                                                  //[00160] DEC46L_(DEC46L) = NR2A(FOUR,SIX);

/* sample decode with two phases of the clock to get a pulse of 1.66 ticks */

assign CLKL = ~CLK;                                                             //[00164] CLKL_(CLKL) = N1C(CLK);
FD2A VCS_0__inst (.q(VCSL_0),.qL(VCS_0),.d(DEC46L),.clk(CLKL),.rL(RESL));       //[00165] VCS_0_(VCSL_0,VCS_0) = FD2A(DEC46L,CLKL,RESL);
FD2A VCS_1__inst (.q(VCSL_1),.qL(VCS_1),.d(DEC46L),.clk(CLK),.rL(RESL));        //[00166] VCS_1_(VCSL_1,VCS_1) = FD2A(DEC46L,CLK,RESL);

/* the type of screen ram determines the timing */

assign STATIC = ~PSUEDO;                                                        //[00170] STATIC_(STATIC) = N1A(PSUEDO);
assign SAENL = ~SAEN;                                                           //[00171] SAENL_(SAENL) = N1A(SAEN);

assign VCST_0 = ~(VCS_0 & SAEN);                                                //[00173] VCST_0_(VCST_0) = ND2A(VCS_0,SAEN);
assign VCST_1 = ~(VCS_1 & SAEN);                                                //[00174] VCST_1_(VCST_1) = ND2A(VCS_1,SAEN);
assign VCS = ~(VCST_0 & VCST_1);                                                //[00175] VCS_(VCS) = ND2A(VCST_0,VCST_1);
assign VOE = ~(VCST_0 & VCST_1);                                                //[00176] VOE_(VOE) = ND2A(VCST_0,VCST_1);

/* vholdL is asserted ahead of video fetch */

assign VHOLDL = ~(HVHOLD & VVACTIVE);                                           //[00180] VHOLDL_(VHOLDL) = ND2A(HVHOLD,VVACTIVE);

/* vcas and vras are generated from 17Mhz clock */

assign DEC45L = ~(FOUR | FIVE);                                                 //[00184] DEC45L_(DEC45L) = NR2A(FOUR,FIVE);
assign DEC45A = ~(DEC45L | ACTIVEL);                                            //[00185] DEC45A_(DEC45A) = NR2A(DEC45L,ACTIVEL);
FD2A VCAS__inst (.q(VCAS),.qL(VCASL),.d(DEC45A),.clk(CLKL),.rL(RESL));          //[00186] VCAS_(VCAS,VCASL) = FD2A(DEC45A,CLKL,RESL);
FD2A VRAS__inst (.q(VRAS),.qL(VRASL),.d(VCAS),.clk(CLKL),.rL(RESL));            //[00187] VRAS_(VRAS,VRASL) = FD2A(VCAS,CLKL,RESL);

endmodule                                                                       //[00190] END MODULE;