                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	hcnt-hdl					*
*	7/11/88						*
********************************************************/

/*
This module is the horizontal timebase in the SLIPSTREAM chip on the ACW
*/

module m_HCNT                                                                   //[00015] MODULE HCNT;
(                                                                               //[00015] MODULE HCNT;

    inout    D_0,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_1,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_2,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_3,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_4,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_5,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_6,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    inout    D_7,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    RESETL_0,                                                          //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    CLK,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_0,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_1,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_2,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_3,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_4,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_5,                                                              //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    WD_6,                                                              //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    WD_7,                                                              //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    HCNTL,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    HCNTH,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    LPL_0,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    LPL_1,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    LP,                                                                //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    HLOCK,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    NTSC,                                                              //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    GENLOCK,                                                           //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    OPEN,                                                              //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
    input    NEXTV,                                                             //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
                                                                                //[00018]    WD_5,WD_6,WD_7,HCNTL,HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV;
//    output    D_0,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_1,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_2,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_3,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_4,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_5,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_6,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
//    output    D_7,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HVACTIVE,                                                         //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HSYNC,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HC_0,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HC_1,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HC_2,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HC_3,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
    output    HBORDER,                                                          //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    HBLANKING,                                                        //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    HVSYNC,                                                           //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    LPSET,                                                            //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    LPCLK,                                                            //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    HD1,                                                              //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    HVHOLD,                                                           //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
    output    HINT                                                              //[00020]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT;
);                                                                              //[00015] MODULE HCNT;
                                                                                //[00021] LEVEL FUNCTION;
wire RESET;                                                                     //[00026] RESET_(RESET) = N1A(RESETL_0);
wire RESETL;                                                                    //[00027] RESETL_(RESETL) = N1C(RESET);
wire HCNT_8;                                                                    //[00031] HCNT_8_(HCNT_8,HCNTB_8) = LD1A(WD_0,HCNTH);
wire HCNTB_8;                                                                   //[00031] HCNT_8_(HCNT_8,HCNTB_8) = LD1A(WD_0,HCNTH);
wire HCNT_9;                                                                    //[00032] HCNT_9_(HCNT_9,HCNTB_9) = LD1A(WD_1,HCNTH);
wire HCNTB_9;                                                                   //[00032] HCNT_9_(HCNT_9,HCNTB_9) = LD1A(WD_1,HCNTH);
wire HCNTLBL;                                                                   //[00036] HCNTLBL_(HCNTLBL) = N1C(HCNTL);
wire NEXTH;                                                                     //[00037] Q_0_(HCI_0,HCIB_0) = SYNCNT0(WD_0,CLK,NEXTH,HCNTLBL);
wire HCI_0;                                                                     //[00037] Q_0_(HCI_0,HCIB_0) = SYNCNT0(WD_0,CLK,NEXTH,HCNTLBL);
wire HCIB_0;                                                                    //[00037] Q_0_(HCI_0,HCIB_0) = SYNCNT0(WD_0,CLK,NEXTH,HCNTLBL);
wire HCI_1;                                                                     //[00038] Q_1_(HCI_1,HCIB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTH,HCNTLBL,HCI_0);
wire HCIB_1;                                                                    //[00038] Q_1_(HCI_1,HCIB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTH,HCNTLBL,HCI_0);
wire CO_1;                                                                      //[00038] Q_1_(HCI_1,HCIB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTH,HCNTLBL,HCI_0);
wire HCI_2;                                                                     //[00039] Q_2_(HCI_2,HCIB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTH,HCNTLBL,CO_1);
wire HCIB_2;                                                                    //[00039] Q_2_(HCI_2,HCIB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTH,HCNTLBL,CO_1);
wire CO_2;                                                                      //[00039] Q_2_(HCI_2,HCIB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTH,HCNTLBL,CO_1);
wire HCI_3;                                                                     //[00040] Q_3_(HCI_3,HCIB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTH,HCNTLBL,CO_2);
wire HCIB_3;                                                                    //[00040] Q_3_(HCI_3,HCIB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTH,HCNTLBL,CO_2);
wire CO_3;                                                                      //[00040] Q_3_(HCI_3,HCIB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTH,HCNTLBL,CO_2);
wire HCI_4;                                                                     //[00041] Q_4_(HCI_4,HCIB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTH,HCNTLBL,CO_3);
wire HCIB_4;                                                                    //[00041] Q_4_(HCI_4,HCIB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTH,HCNTLBL,CO_3);
wire CO_4;                                                                      //[00041] Q_4_(HCI_4,HCIB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTH,HCNTLBL,CO_3);
wire HCI_5;                                                                     //[00042] Q_5_(HCI_5,HCIB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTH,HCNTLBL,CO_4);
wire HCIB_5;                                                                    //[00042] Q_5_(HCI_5,HCIB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTH,HCNTLBL,CO_4);
wire CO_5;                                                                      //[00042] Q_5_(HCI_5,HCIB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTH,HCNTLBL,CO_4);
wire HCI_6;                                                                     //[00043] Q_6_(HCI_6,HCIB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTH,HCNTLBL,CO_5);
wire HCIB_6;                                                                    //[00043] Q_6_(HCI_6,HCIB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTH,HCNTLBL,CO_5);
wire CO_6;                                                                      //[00043] Q_6_(HCI_6,HCIB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTH,HCNTLBL,CO_5);
wire HCI_7;                                                                     //[00044] Q_7_(HCI_7,HCIB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTH,HCNTLBL,CO_6);
wire HCIB_7;                                                                    //[00044] Q_7_(HCI_7,HCIB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTH,HCNTLBL,CO_6);
wire CO_7;                                                                      //[00044] Q_7_(HCI_7,HCIB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTH,HCNTLBL,CO_6);
wire HCI_8;                                                                     //[00045] Q_8_(HCI_8,HCIB_8,CO_8) = SYNCNT(HCNT_8,CLK,NEXTH,HCNTLBL,CO_7);
wire HCIB_8;                                                                    //[00045] Q_8_(HCI_8,HCIB_8,CO_8) = SYNCNT(HCNT_8,CLK,NEXTH,HCNTLBL,CO_7);
wire CO_8;                                                                      //[00045] Q_8_(HCI_8,HCIB_8,CO_8) = SYNCNT(HCNT_8,CLK,NEXTH,HCNTLBL,CO_7);
wire HCI_9;                                                                     //[00046] Q_9_(HCI_9,HCIB_9,CO_9) = SYNCNT(HCNT_9,CLK,NEXTH,HCNTLBL,CO_8);
wire HCIB_9;                                                                    //[00046] Q_9_(HCI_9,HCIB_9,CO_9) = SYNCNT(HCNT_9,CLK,NEXTH,HCNTLBL,CO_8);
wire CO_9;                                                                      //[00046] Q_9_(HCI_9,HCIB_9,CO_9) = SYNCNT(HCNT_9,CLK,NEXTH,HCNTLBL,CO_8);
wire HC_4;                                                                      //[00051] HC_4_(HC_4) = N1C(HCIB_4);
wire HC_5;                                                                      //[00052] HC_5_(HC_5) = N1C(HCIB_5);
wire HC_6;                                                                      //[00053] HC_6_(HC_6) = N1C(HCIB_6);
wire HC_7;                                                                      //[00054] HC_7_(HC_7) = N1C(HCIB_7);
wire HC_8;                                                                      //[00055] HC_8_(HC_8) = N1C(HCIB_8);
wire HC_9;                                                                      //[00056] HC_9_(HC_9) = N1C(HCIB_9);
wire HCB_0;                                                                     //[00057] HCB_0_(HCB_0) = N1C(HCI_0);
wire HCB_1;                                                                     //[00058] HCB_1_(HCB_1) = N1C(HCI_1);
wire HCB_2;                                                                     //[00059] HCB_2_(HCB_2) = N1C(HCI_2);
wire HCB_3;                                                                     //[00060] HCB_3_(HCB_3) = N1C(HCI_3);
wire HCB_4;                                                                     //[00061] HCB_4_(HCB_4) = N1C(HCI_4);
wire HCB_5;                                                                     //[00062] HCB_5_(HCB_5) = N1C(HCI_5);
wire HCB_6;                                                                     //[00063] HCB_6_(HCB_6) = N1C(HCI_6);
wire HCB_7;                                                                     //[00064] HCB_7_(HCB_7) = N1C(HCI_7);
wire HCB_8;                                                                     //[00065] HCB_8_(HCB_8) = N1C(HCI_8);
wire HCB_9;                                                                     //[00066] HCB_9_(HCB_9) = N1C(HCI_9);
wire RES;                                                                       //[00075] RES_(RES) = N1A(RESETL);
wire LPD;                                                                       //[00076] LPD_(LPD,LPDB) = FD1A(LP,CLK);
wire LPDB;                                                                      //[00076] LPD_(LPD,LPDB) = FD1A(LP,CLK);
wire LPJ;                                                                       //[00080] LPJ_(LPJ) = NR3A(LPDB,LPSET,RES);
wire LPQB;                                                                      //[00081] LPSET_(LPSET,LPQB) = JK(LPJ,NEXTV,RES,CLK);
wire LPIL;                                                                      //[00085] LPIL_(LPIL) = NR2A(LPJ,OPEN);
wire HD68;                                                                      //[00112] HD68_(HD68) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HCB_5,HCB_4,HCB_3,HC_2,HCB_1,
wire HD103;                                                                     //[00115] HD103_(HD103) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HCB_3,HC_2,HC_1,
wire HD111;                                                                     //[00118] HD111_(HD111) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HC_3,HC_2,HC_1,
wire HD119;                                                                     //[00121] HD119_(HD119) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HC_1,
wire HD623;                                                                     //[00124] HD623_(HD623) = AND11(RESETL,HC_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HC_3,HC_2,HC_1,
wire HD631;                                                                     //[00127] HD631_(HD631) = AND11(RESETL,HC_9,HCB_8,HCB_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HC_1,
wire HD643;                                                                     //[00130] HD643_(HD643) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HCB_5,HCB_4,HCB_3,HCB_2,HC_1,
wire HD682;                                                                     //[00133] HD682_(HD682) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HC_5,HCB_4,HC_3,HCB_2,HC_1,
wire BIT0;                                                                      //[00137]    BIT0);
wire HD700;                                                                     //[00136] HD700_(HD700) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HC_5,HC_4,HC_3,HC_2,HCB_1,
wire HD756;                                                                     //[00139] HD756_(HD756) = AND11(RESETL,HC_9,HCB_8,HC_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HCB_1,
wire PAL;                                                                       //[00144] PAL_(PAL) = N1A(NTSC);
wire HD756L;                                                                    //[00151] HD756L_(HD756L) = N1A(HD756);
wire HLOCKD;                                                                    //[00152] HLOCKD_(HLOCKD,HLOCKDL) = FD2A(HLOCK,CLK,RESETL);
wire HLOCKDL;                                                                   //[00152] HLOCKD_(HLOCKD,HLOCKDL) = FD2A(HLOCK,CLK,RESETL);
wire HLOCKL;                                                                    //[00153] HLOCKL_(HLOCKL) = ND2A(GENLOCK,HLOCKD);
wire HSYNCD;                                                                    //[00158] HSYNCDL_(HSYNCD,HSYNCDL) = JK(HD700,NEXTH,RES,CLK);
wire HSYNCDL;                                                                   //[00158] HSYNCDL_(HSYNCD,HSYNCDL) = JK(HD700,NEXTH,RES,CLK);
wire HVSYNCL;                                                                   //[00163] HVSYNC_(HVSYNC,HVSYNCL) = JK(HD700,HD643,RES,CLK);
wire HBORDERL;                                                                  //[00164] HBORDERL_(HBORDER,HBORDERL) = JK(HD631,HD119,RES,CLK);
wire HBLANKINGL;                                                                //[00165] HBLANKING_(HBLANKING,HBLANKINGL) = JK(HD682,HD68,RES,CLK);
wire HVACTIVEL;                                                                 //[00169] HVACTIVE_(HVACTIVE,HVACTIVEL) = FJK2A(HD111,HD623,CLK,RESETL);
wire HVHOLDL;                                                                   //[00175] HVHOLD_(HVHOLD,HVHOLDL) = JK(HD103,HD623,RES,CLK);

/* buffer the clock and reset */

assign RESET = ~RESETL_0;                                                       //[00026] RESET_(RESET) = N1A(RESETL_0);
assign RESETL = ~RESET;                                                         //[00027] RESETL_(RESETL) = N1C(RESET);

/* latch the high bits of the horizontal count */

LD1A HCNT_8__inst (.q(HCNT_8),.qL(HCNTB_8),.d(WD_0),.en(HCNTH));                //[00031] HCNT_8_(HCNT_8,HCNTB_8) = LD1A(WD_0,HCNTH);
LD1A HCNT_9__inst (.q(HCNT_9),.qL(HCNTB_9),.d(WD_1),.en(HCNTH));                //[00032] HCNT_9_(HCNT_9,HCNTB_9) = LD1A(WD_1,HCNTH);

/* Now the line counter */

assign HCNTLBL = ~HCNTL;                                                        //[00036] HCNTLBL_(HCNTLBL) = N1C(HCNTL);
SYNCNT0 Q_0__inst (.Q(HCI_0),.QB(HCIB_0),.D(WD_0),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL));//[00037] Q_0_(HCI_0,HCIB_0) = SYNCNT0(WD_0,CLK,NEXTH,HCNTLBL);
SYNCNT Q_1__inst (.Q(HCI_1),.QB(HCIB_1),.CO(CO_1),.D(WD_1),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(HCI_0));//[00038] Q_1_(HCI_1,HCIB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTH,HCNTLBL,HCI_0);
SYNCNT Q_2__inst (.Q(HCI_2),.QB(HCIB_2),.CO(CO_2),.D(WD_2),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_1));//[00039] Q_2_(HCI_2,HCIB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTH,HCNTLBL,CO_1);
SYNCNT Q_3__inst (.Q(HCI_3),.QB(HCIB_3),.CO(CO_3),.D(WD_3),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_2));//[00040] Q_3_(HCI_3,HCIB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTH,HCNTLBL,CO_2);
SYNCNT Q_4__inst (.Q(HCI_4),.QB(HCIB_4),.CO(CO_4),.D(WD_4),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_3));//[00041] Q_4_(HCI_4,HCIB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTH,HCNTLBL,CO_3);
SYNCNT Q_5__inst (.Q(HCI_5),.QB(HCIB_5),.CO(CO_5),.D(WD_5),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_4));//[00042] Q_5_(HCI_5,HCIB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTH,HCNTLBL,CO_4);
SYNCNT Q_6__inst (.Q(HCI_6),.QB(HCIB_6),.CO(CO_6),.D(WD_6),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_5));//[00043] Q_6_(HCI_6,HCIB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTH,HCNTLBL,CO_5);
SYNCNT Q_7__inst (.Q(HCI_7),.QB(HCIB_7),.CO(CO_7),.D(WD_7),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_6));//[00044] Q_7_(HCI_7,HCIB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTH,HCNTLBL,CO_6);
SYNCNT Q_8__inst (.Q(HCI_8),.QB(HCIB_8),.CO(CO_8),.D(HCNT_8),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_7));//[00045] Q_8_(HCI_8,HCIB_8,CO_8) = SYNCNT(HCNT_8,CLK,NEXTH,HCNTLBL,CO_7);
SYNCNT Q_9__inst (.Q(HCI_9),.QB(HCIB_9),.CO(CO_9),.D(HCNT_9),.CLK(CLK),.CLR(NEXTH),.LDL(HCNTLBL),.CI(CO_8));//[00046] Q_9_(HCI_9,HCIB_9,CO_9) = SYNCNT(HCNT_9,CLK,NEXTH,HCNTLBL,CO_8);
assign HC_0 = ~HCIB_0;                                                          //[00047] HC_0_(HC_0) = N1C(HCIB_0);
assign HC_1 = ~HCIB_1;                                                          //[00048] HC_1_(HC_1) = N1C(HCIB_1);
assign HC_2 = ~HCIB_2;                                                          //[00049] HC_2_(HC_2) = N1C(HCIB_2);
assign HC_3 = ~HCIB_3;                                                          //[00050] HC_3_(HC_3) = N1C(HCIB_3);
assign HC_4 = ~HCIB_4;                                                          //[00051] HC_4_(HC_4) = N1C(HCIB_4);
assign HC_5 = ~HCIB_5;                                                          //[00052] HC_5_(HC_5) = N1C(HCIB_5);
assign HC_6 = ~HCIB_6;                                                          //[00053] HC_6_(HC_6) = N1C(HCIB_6);
assign HC_7 = ~HCIB_7;                                                          //[00054] HC_7_(HC_7) = N1C(HCIB_7);
assign HC_8 = ~HCIB_8;                                                          //[00055] HC_8_(HC_8) = N1C(HCIB_8);
assign HC_9 = ~HCIB_9;                                                          //[00056] HC_9_(HC_9) = N1C(HCIB_9);
assign HCB_0 = ~HCI_0;                                                          //[00057] HCB_0_(HCB_0) = N1C(HCI_0);
assign HCB_1 = ~HCI_1;                                                          //[00058] HCB_1_(HCB_1) = N1C(HCI_1);
assign HCB_2 = ~HCI_2;                                                          //[00059] HCB_2_(HCB_2) = N1C(HCI_2);
assign HCB_3 = ~HCI_3;                                                          //[00060] HCB_3_(HCB_3) = N1C(HCI_3);
assign HCB_4 = ~HCI_4;                                                          //[00061] HCB_4_(HCB_4) = N1C(HCI_4);
assign HCB_5 = ~HCI_5;                                                          //[00062] HCB_5_(HCB_5) = N1C(HCI_5);
assign HCB_6 = ~HCI_6;                                                          //[00063] HCB_6_(HCB_6) = N1C(HCI_6);
assign HCB_7 = ~HCI_7;                                                          //[00064] HCB_7_(HCB_7) = N1C(HCI_7);
assign HCB_8 = ~HCI_8;                                                          //[00065] HCB_8_(HCB_8) = N1C(HCI_8);
assign HCB_9 = ~HCI_9;                                                          //[00066] HCB_9_(HCB_9) = N1C(HCI_9);

/* The following logic produces a pulse on lpj the the first time lp is
asserted each frame. This signal latches the current counter state.
The signal 'open' opens the light pen latches so that the counter can
be read */

/* sample the signal */

assign RES = ~RESETL;                                                           //[00075] RES_(RES) = N1A(RESETL);
FD1A LPD__inst (.q(LPD),.qL(LPDB),.d(LP),.clk(CLK));                            //[00076] LPD_(LPD,LPDB) = FD1A(LP,CLK);

/* lpj sets the latch */

assign LPJ = ~(LPDB | LPSET | RES);                                             //[00080] LPJ_(LPJ) = NR3A(LPDB,LPSET,RES);
JK LPSET__inst (.q(LPSET),.qL(LPQB),.j(LPJ),.k(NEXTV),.r(RES),.clk(CLK));       //[00081] LPSET_(LPSET,LPQB) = JK(LPJ,NEXTV,RES,CLK);

/* the latches are opened by lpj or 'open' , this will latch the next count*/

assign LPIL = ~(LPJ | OPEN);                                                    //[00085] LPIL_(LPIL) = NR2A(LPJ,OPEN);
assign LPCLK = ~LPIL;                                                           //[00086] LPCLK_(LPCLK) = N1C(LPIL);

ZTLATCH1 DL_0__inst (.QB(D_0),.D(HCB_0),.CLK(LPCLK),.ENL(LPL_0));               //[00088] DL_0_(D_0) = ZTLATCH1(D_0,HCB_0,LPCLK,LPL_0);
ZTLATCH1 DL_1__inst (.QB(D_1),.D(HCB_1),.CLK(LPCLK),.ENL(LPL_0));               //[00089] DL_1_(D_1) = ZTLATCH1(D_1,HCB_1,LPCLK,LPL_0);
ZTLATCH1 DL_2__inst (.QB(D_2),.D(HCB_2),.CLK(LPCLK),.ENL(LPL_0));               //[00090] DL_2_(D_2) = ZTLATCH1(D_2,HCB_2,LPCLK,LPL_0);
ZTLATCH1 DL_3__inst (.QB(D_3),.D(HCB_3),.CLK(LPCLK),.ENL(LPL_0));               //[00091] DL_3_(D_3) = ZTLATCH1(D_3,HCB_3,LPCLK,LPL_0);
ZTLATCH1 DL_4__inst (.QB(D_4),.D(HCB_4),.CLK(LPCLK),.ENL(LPL_0));               //[00092] DL_4_(D_4) = ZTLATCH1(D_4,HCB_4,LPCLK,LPL_0);
ZTLATCH1 DL_5__inst (.QB(D_5),.D(HCB_5),.CLK(LPCLK),.ENL(LPL_0));               //[00093] DL_5_(D_5) = ZTLATCH1(D_5,HCB_5,LPCLK,LPL_0);
ZTLATCH1 DL_6__inst (.QB(D_6),.D(HCB_6),.CLK(LPCLK),.ENL(LPL_0));               //[00094] DL_6_(D_6) = ZTLATCH1(D_6,HCB_6,LPCLK,LPL_0);
ZTLATCH1 DL_7__inst (.QB(D_7),.D(HCB_7),.CLK(LPCLK),.ENL(LPL_0));               //[00095] DL_7_(D_7) = ZTLATCH1(D_7,HCB_7,LPCLK,LPL_0);
ZTLATCH1 DH_0__inst (.QB(D_0),.D(HCB_8),.CLK(LPCLK),.ENL(LPL_1));               //[00096] DH_0_(D_0) = ZTLATCH1(D_0,HCB_8,LPCLK,LPL_1);
ZTLATCH1 DH_1__inst (.QB(D_1),.D(HCB_9),.CLK(LPCLK),.ENL(LPL_1));               //[00097] DH_1_(D_1) = ZTLATCH1(D_1,HCB_9,LPCLK,LPL_1);
assign D_2 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00098] DH_2_(D_2) = MACZINVB1(RESETL,LPL_1);
assign D_3 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00099] DH_3_(D_3) = MACZINVB1(RESETL,LPL_1);
assign D_4 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00100] DH_4_(D_4) = MACZINVB1(RESETL,LPL_1);
assign D_5 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00101] DH_5_(D_5) = MACZINVB1(RESETL,LPL_1);
assign D_6 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00102] DH_6_(D_6) = MACZINVB1(RESETL,LPL_1);
assign D_7 = ~LPL_1 ? RESETL : 1'bZ;                                            //[00103] DH_7_(D_7) = MACZINVB1(RESETL,LPL_1);

/* The decodes */

assign HD1 = RESETL & HCB_9 & HCB_8 & HCB_7 & HCB_6 & HCB_5 & HCB_4 & HCB_3 & HCB_2 & HCB_1 & HC_0;//[00109] HD1_(HD1) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HCB_6,HCB_5,HCB_4,HCB_3,HCB_2,HCB_1,
                                                                                //[00110]    HC_0);

assign HD68 = RESETL & HCB_9 & HCB_8 & HCB_7 & HC_6 & HCB_5 & HCB_4 & HCB_3 & HC_2 & HCB_1 & HCB_0;//[00112] HD68_(HD68) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HCB_5,HCB_4,HCB_3,HC_2,HCB_1,
                                                                                //[00113]    HCB_0);

assign HD103 = RESETL & HCB_9 & HCB_8 & HCB_7 & HC_6 & HC_5 & HCB_4 & HCB_3 & HC_2 & HC_1 & HC_0;//[00115] HD103_(HD103) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HCB_3,HC_2,HC_1,
                                                                                //[00116]    HC_0);

assign HD111 = RESETL & HCB_9 & HCB_8 & HCB_7 & HC_6 & HC_5 & HCB_4 & HC_3 & HC_2 & HC_1 & HC_0;//[00118] HD111_(HD111) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HC_3,HC_2,HC_1,
                                                                                //[00119]    HC_0);

assign HD119 = RESETL & HCB_9 & HCB_8 & HCB_7 & HC_6 & HC_5 & HC_4 & HCB_3 & HC_2 & HC_1 & HC_0;//[00121] HD119_(HD119) = AND11(RESETL,HCB_9,HCB_8,HCB_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HC_1,
                                                                                //[00122]    HC_0);

assign HD623 = RESETL & HC_9 & HCB_8 & HCB_7 & HC_6 & HC_5 & HCB_4 & HC_3 & HC_2 & HC_1 & HC_0;//[00124] HD623_(HD623) = AND11(RESETL,HC_9,HCB_8,HCB_7,HC_6,HC_5,HCB_4,HC_3,HC_2,HC_1,
                                                                                //[00125]    HC_0);

assign HD631 = RESETL & HC_9 & HCB_8 & HCB_7 & HC_6 & HC_5 & HC_4 & HCB_3 & HC_2 & HC_1 & HC_0;//[00127] HD631_(HD631) = AND11(RESETL,HC_9,HCB_8,HCB_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HC_1,
                                                                                //[00128]    HC_0);

assign HD643 = RESETL & HC_9 & HCB_8 & HC_7 & HCB_6 & HCB_5 & HCB_4 & HCB_3 & HCB_2 & HC_1 & HC_0;//[00130] HD643_(HD643) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HCB_5,HCB_4,HCB_3,HCB_2,HC_1,
                                                                                //[00131]    HC_0);

assign HD682 = RESETL & HC_9 & HCB_8 & HC_7 & HCB_6 & HC_5 & HCB_4 & HC_3 & HCB_2 & HC_1 & HCB_0;//[00133] HD682_(HD682) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HC_5,HCB_4,HC_3,HCB_2,HC_1,
                                                                                //[00134]    HCB_0);

assign HD700 = RESETL & HC_9 & HCB_8 & HC_7 & HCB_6 & HC_5 & HC_4 & HC_3 & HC_2 & HCB_1 & BIT0;//[00136] HD700_(HD700) = AND11(RESETL,HC_9,HCB_8,HC_7,HCB_6,HC_5,HC_4,HC_3,HC_2,HCB_1,
                                                                                //[00137]    BIT0);

assign HD756 = RESETL & HC_9 & HCB_8 & HC_7 & HC_6 & HC_5 & HC_4 & HCB_3 & HC_2 & HCB_1 & BIT0;//[00139] HD756_(HD756) = AND11(RESETL,HC_9,HCB_8,HC_7,HC_6,HC_5,HC_4,HCB_3,HC_2,HCB_1,
                                                                                //[00140]    BIT0);

/* NB the decodes for hsync and line length are one greater for ntsc */

assign PAL = ~NTSC;                                                             //[00144] PAL_(PAL) = N1A(NTSC);
assign BIT0 = ~((PAL & HC_0)|(NTSC & HCB_0));                                   //[00145] BIT0_(BIT0) = AO2A(PAL,HC_0,NTSC,HCB_0);

/* The last decode is combined with the horizontal lock input so they
have an equivalent effect */

assign HD756L = ~HD756;                                                         //[00151] HD756L_(HD756L) = N1A(HD756);
FD2A HLOCKD__inst (.q(HLOCKD),.qL(HLOCKDL),.d(HLOCK),.clk(CLK),.rL(RESETL));    //[00152] HLOCKD_(HLOCKD,HLOCKDL) = FD2A(HLOCK,CLK,RESETL);
assign HLOCKL = ~(GENLOCK & HLOCKD);                                            //[00153] HLOCKL_(HLOCKL) = ND2A(GENLOCK,HLOCKD);
assign NEXTH = ~(HLOCKL & HD756L);                                              //[00154] NEXTH_(NEXTH) = ND2C(HLOCKL,HD756L);

/* generate horizontal sync but disable when genlocking */

JK HSYNCDL__inst (.q(HSYNCD),.qL(HSYNCDL),.j(HD700),.k(NEXTH),.r(RES),.clk(CLK));//[00158] HSYNCDL_(HSYNCD,HSYNCDL) = JK(HD700,NEXTH,RES,CLK);
assign HSYNC = ~(HSYNCDL | GENLOCK);                                            //[00159] HSYNC_(HSYNC) = NR2A(HSYNCDL,GENLOCK);

/* generate other signals */

JK HVSYNC__inst (.q(HVSYNC),.qL(HVSYNCL),.j(HD700),.k(HD643),.r(RES),.clk(CLK));//[00163] HVSYNC_(HVSYNC,HVSYNCL) = JK(HD700,HD643,RES,CLK);
JK HBORDERL__inst (.q(HBORDER),.qL(HBORDERL),.j(HD631),.k(HD119),.r(RES),.clk(CLK));//[00164] HBORDERL_(HBORDER,HBORDERL) = JK(HD631,HD119,RES,CLK);
JK HBLANKING__inst (.q(HBLANKING),.qL(HBLANKINGL),.j(HD682),.k(HD68),.r(RES),.clk(CLK));//[00165] HBLANKING_(HBLANKING,HBLANKINGL) = JK(HD682,HD68,RES,CLK);

/* hvactive leads border by eight ticks */

FJK2A HVACTIVE__inst (.q(HVACTIVE),.qL(HVACTIVEL),.j(HD111),.k(HD623),.clk(CLK),.rL(RESETL));//[00169] HVACTIVE_(HVACTIVE,HVACTIVEL) = FJK2A(HD111,HD623,CLK,RESETL);

/* hvhold is asserted 6 microprocessor clocks before the first video cycle */

/* WARNING the response time of the 8088 is not known exactly */

JK HVHOLD__inst (.q(HVHOLD),.qL(HVHOLDL),.j(HD103),.k(HD623),.r(RES),.clk(CLK));//[00175] HVHOLD_(HVHOLD,HVHOLDL) = JK(HD103,HD623,RES,CLK);

/* interupts may occur at end of active area */

assign HINT = HD623;                                                            //[00179] HINT_(HINT) = B3A(HD623);

endmodule                                                                       //[00181] END MODULE;