                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	stat-hdl					*
*	28/10/88					*
********************************************************/

/*
This module contains the status,diagnostic and lcd registers in
the SLIPSTREAM chip on the ACW
*/

module m_STAT                                                                   //[00015] MODULE STAT;
(                                                                               //[00015] MODULE STAT;

    inout    D_0,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_1,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_2,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_3,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_4,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_5,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_6,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    inout    D_7,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    RESETL_0,                                                          //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    WD_0,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    WD_1,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    WD_2,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    WD_3,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    WD_4,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    STATL,                                                             //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,WD_2,WD_3,WD_4,STATL,
    input    DIAGL_0,                                                           //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    DIAG_1,                                                            //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    LCD,                                                               //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    LPSET,                                                             //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    PALL,                                                              //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    PSRAML,                                                            //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    FASTL,                                                             //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
    input    XTALL,                                                             //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
                                                                                //[00018]    DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL;
//    output    D_0,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_1,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_2,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_3,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_4,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_5,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_6,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
//    output    D_7,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    OPEN,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    NTSC,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    TESTENL,                                                          //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    PSUEDO,                                                           //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    VCEN,                                                             //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    TMODE,                                                            //[00019] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,
    output    FAST,                                                             //[00020]    FAST,TSTCLK,MO,DOEN;
    output    TSTCLK,                                                           //[00020]    FAST,TSTCLK,MO,DOEN;
    output    MO,                                                               //[00020]    FAST,TSTCLK,MO,DOEN;
    output    DOEN                                                              //[00020]    FAST,TSTCLK,MO,DOEN;
);                                                                              //[00015] MODULE STAT;
                                                                                //[00021] LEVEL FUNCTION;
wire CLK;                                                                       //[00026] CLK_(CLK) = N1A(XTALL);
wire RESET_0;                                                                   //[00027] RESET_0_(RESET_0) = N1A(RESETL_0);
wire RESET_1;                                                                   //[00028] RESETL_1_(RESET_1,RESETL_1) = FD4A(RESET_0,CLK,RESETL_0);
wire RESETL_1;                                                                  //[00028] RESETL_1_(RESET_1,RESETL_1) = FD4A(RESET_0,CLK,RESETL_0);
wire TESTEN;                                                                    //[00029] TESTEN_(TESTEN,TESTENL) = FD4A(RESET_1,CLK,RESETL_0);
wire STATIC;                                                                    //[00033] PSUEDO_(STATIC,PSUEDO) = LD1A(PSRAML,RESET_0);
wire SLOW;                                                                      //[00034] FAST_(SLOW,FAST) = LD1A(FASTL,RESET_0);
wire MODECLK;                                                                   //[00039] MODECLK_(MODECLK) = ND2A(RESETL_0,DIAGL_0);
wire MODEL;                                                                     //[00040] MODEL_(MODEL) = AO2A(RESET_1,PALL,TESTENL,WD_1);
wire PAL;                                                                       //[00041] NTSC_(PAL,NTSC) = LD1A(MODEL,MODECLK);
wire OPENL;                                                                     //[00045] OPEN_(OPEN,OPENL) = LD1A(WD_0,DIAG_1);
wire VCENL;                                                                     //[00046] VCEN_(VCEN,VCENL) = LD1A(WD_2,DIAG_1);
wire TSTCLKL;                                                                   //[00047] TSTCLK_(TSTCLK,TSTCLKL) = FD2A(WD_3,DIAGL_0,RESETL_0);
wire TMODEL;                                                                    //[00048] TMODE_(TMODE,TMODEL) = LD1A(WD_4,DIAG_1);
wire MOL;                                                                       //[00052] LCDD_(MO,MOL) = LD1A(WD_0,LCD);
wire DOENL;                                                                     //[00053] DOEN_(DOEN,DOENL) = LD1A(WD_1,LCD);
wire LPSETL;                                                                    //[00058] LPSETL_(LPSETL) = N1A(LPSET);

/* delay reset to enable pal,psram and fast inputs */

assign CLK = ~XTALL;                                                            //[00026] CLK_(CLK) = N1A(XTALL);
assign RESET_0 = ~RESETL_0;                                                     //[00027] RESET_0_(RESET_0) = N1A(RESETL_0);
FD4A RESETL_1__inst (.q(RESET_1),.qL(RESETL_1),.d(RESET_0),.clk(CLK),.sL(RESETL_0));//[00028] RESETL_1_(RESET_1,RESETL_1) = FD4A(RESET_0,CLK,RESETL_0);
FD4A TESTEN__inst (.q(TESTEN),.qL(TESTENL),.d(RESET_1),.clk(CLK),.sL(RESETL_0));//[00029] TESTEN_(TESTEN,TESTENL) = FD4A(RESET_1,CLK,RESETL_0);

/* latch the screen ram type and processor speed */

LD1A PSUEDO__inst (.q(STATIC),.qL(PSUEDO),.d(PSRAML),.en(RESET_0));             //[00033] PSUEDO_(STATIC,PSUEDO) = LD1A(PSRAML,RESET_0);
LD1A FAST__inst (.q(SLOW),.qL(FAST),.d(FASTL),.en(RESET_0));                    //[00034] FAST_(SLOW,FAST) = LD1A(FASTL,RESET_0);

/* latch the television mode */
/* NB this can also be written by the host */

assign MODECLK = ~(RESETL_0 & DIAGL_0);                                         //[00039] MODECLK_(MODECLK) = ND2A(RESETL_0,DIAGL_0);
assign MODEL = ~((RESET_1 & PALL)|(TESTENL & WD_1));                            //[00040] MODEL_(MODEL) = AO2A(RESET_1,PALL,TESTENL,WD_1);
LD1A NTSC__inst (.q(PAL),.qL(NTSC),.d(MODEL),.en(MODECLK));                     //[00041] NTSC_(PAL,NTSC) = LD1A(MODEL,MODECLK);

/* the other bits of the diagnostics register */

LD1A OPEN__inst (.q(OPEN),.qL(OPENL),.d(WD_0),.en(DIAG_1));                     //[00045] OPEN_(OPEN,OPENL) = LD1A(WD_0,DIAG_1);
LD1A VCEN__inst (.q(VCEN),.qL(VCENL),.d(WD_2),.en(DIAG_1));                     //[00046] VCEN_(VCEN,VCENL) = LD1A(WD_2,DIAG_1);
FD2A TSTCLK__inst (.q(TSTCLK),.qL(TSTCLKL),.d(WD_3),.clk(DIAGL_0),.rL(RESETL_0));//[00047] TSTCLK_(TSTCLK,TSTCLKL) = FD2A(WD_3,DIAGL_0,RESETL_0);
LD1A TMODE__inst (.q(TMODE),.qL(TMODEL),.d(WD_4),.en(DIAG_1));                  //[00048] TMODE_(TMODE,TMODEL) = LD1A(WD_4,DIAG_1);

/* the 'LCD' register */

LD1A LCDD__inst (.q(MO),.qL(MOL),.d(WD_0),.en(LCD));                            //[00052] LCDD_(MO,MOL) = LD1A(WD_0,LCD);
LD1A DOEN__inst (.q(DOEN),.qL(DOENL),.d(WD_1),.en(LCD));                        //[00053] DOEN_(DOEN,DOENL) = LD1A(WD_1,LCD);

/* the status register */

assign D_0 = ~STATL ? PAL : 1'bZ;                                               //[00057] D_0_(D_0) = MACZINVB1(PAL,STATL);
assign LPSETL = ~LPSET;                                                         //[00058] LPSETL_(LPSETL) = N1A(LPSET);
assign D_1 = ~STATL ? LPSETL : 1'bZ;                                            //[00059] D_1_(D_1) = MACZINVB1(LPSETL,STATL);
assign D_2 = ~STATL ? SLOW : 1'bZ;                                              //[00060] D_2_(D_2) = MACZINVB1(SLOW,STATL);
assign D_3 = ~STATL ? RESETL_1 : 1'bZ;                                          //[00061] D_3_(D_3) = MACZINVB1(RESETL_1,STATL);
assign D_4 = ~STATL ? RESETL_1 : 1'bZ;                                          //[00062] D_4_(D_4) = MACZINVB1(RESETL_1,STATL);
assign D_5 = ~STATL ? RESETL_1 : 1'bZ;                                          //[00063] D_5_(D_5) = MACZINVB1(RESETL_1,STATL);
assign D_6 = ~STATL ? RESETL_1 : 1'bZ;                                          //[00064] D_6_(D_6) = MACZINVB1(RESETL_1,STATL);
assign D_7 = ~STATL ? RESETL_1 : 1'bZ;                                          //[00065] D_7_(D_7) = MACZINVB1(RESETL_1,STATL);

endmodule                                                                       //[00068] END MODULE;