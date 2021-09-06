                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
stinner
19/10/88

Blitter Inner Loop State Machine

****************************************************************************/

module m_STINNER                                                                //[00012] MODULE STINNER;
(                                                                               //[00012] MODULE STINNER;

    input    BORROW,                                                            //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    CCLK,                                                              //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    COLST,                                                             //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    CYCEND,                                                            //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    CYCST,                                                             //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    DAM1L,                                                             //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    DSTEN,                                                             //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    ICYCEND,                                                           //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    ICYCST,                                                            //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    ILDPATL,                                                           //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    INHIB,                                                             //[00014] INPUTS	BORROW,CCLK,COLST,CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,
    input    INLP,                                                              //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    INNER0,                                                            //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    IUPDDSTL,                                                          //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    IUPDSRCL,                                                          //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    LINDR,                                                             //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    RES_0,                                                             //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    RESET,                                                             //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    RESUME,                                                            //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    SAM1L,                                                             //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    SRCEN,                                                             //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    SRCENF,                                                            //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
    input    SRESET,                                                            //[00016]    SRESET;
                                                                                //[00015]    INLP,INNER0,IUPDDSTL,IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,
                                                                                //[00016]    SRESET;
    output    ADDBACKL,                                                         //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    ADDBLDL,                                                          //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    DSTWR,                                                            //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    IDSTWR,                                                           //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    INCLKL,                                                           //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    INCRQ,                                                            //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    IQUIET,                                                           //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    LDDSTL,                                                           //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    LDSRCL,                                                           //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    SRCLTOH,                                                          //[00017] OUTPUTS	ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,SRCLTOH,
    output    SRCRD,                                                            //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
    output    SSWAP,                                                            //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
    output    STOP,                                                             //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
    output    UPDDSTL,                                                          //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
    output    UPDSRCL,                                                          //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
    output    UPSLDL                                                            //[00018]    SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL;
);                                                                              //[00012] MODULE STINNER;
                                                                                //[00019] LEVEL FUNCTION;
wire CCLKL;                                                                     //[00024] CCLKINV_(CCLKL) = N1A(CCLK);
wire CYCENDL;                                                                   //[00025] CYCENDL_(CYCENDL) = N1A(CYCEND);
wire DSTENL;                                                                    //[00026] DSTENL_(DSTENL) = N1A(DSTEN);
wire INLPL;                                                                     //[00027] INLPL_(INLPL) = N1A(INLP);
wire INNER0L;                                                                   //[00028] INNER0L_(INNER0L) = N1A(INNER0);
wire LINDRL;                                                                    //[00029] LINDRL_(LINDRL) = N1A(LINDR);
wire RESUMEL;                                                                   //[00030] RESUMEL_(RESUMEL) = N1A(RESUME);
wire SRCENL;                                                                    //[00031] SRCENL_(SRCENL) = N1A(SRCEN);
wire SRCENFL;                                                                   //[00032] SRCENFL_(SRCENFL) = N1A(SRCENF);
wire SRESETL;                                                                   //[00033] SRESETL_(SRESETL) = N1A(SRESET);
wire COLSTOPL;                                                                  //[00035] COLSTOPL_(COLSTOPL) = ND2A(INHIB,COLST);
wire COLSTOP;                                                                   //[00036] COLSTOP_(COLSTOP) = N1A(COLSTOPL);
wire QUIET;                                                                     //[00040] QT0_(QT_0) = ND2A(QUIET,INLPL);
wire QT_0;                                                                      //[00040] QT0_(QT_0) = ND2A(QUIET,INLPL);
wire QT_1;                                                                      //[00041] QT1_(QT_1) = ND3A(DSTWR,CYCEND,INNER0);
wire QUIETL;                                                                    //[00043] QUIET_(QUIET,QUIETL) = FD4A(IQUIET,CCLK,SRESETL);
wire SRT_0;                                                                     //[00047] SRT0_(SRT_0) = ND3A(QUIET,INLP,SRCENF);
wire SRT_1;                                                                     //[00048] SRT1_(SRT_1) = ND3A(QUIET,INLP,SRCEN);
wire SRT_2;                                                                     //[00049] SRT2_(SRT_2) = ND2A(SRCRD,CYCENDL);
wire SRT_3;                                                                     //[00050] SRT3_(SRT_3) = ND4A(DSTWR,CYCEND,INNER0L,SRCEN);
wire ISRCRD;                                                                    //[00051] SRT4_(ISRCRD) = ND4A(SRT_0,SRT_1,SRT_2,SRT_3);
wire SRCRDL;                                                                    //[00052] SRCRD_(SRCRD,SRCRDL) = FD2A(ISRCRD,CCLK,SRESETL);
wire DRT_0;                                                                     //[00056] DRT0_(DRT_0) = ND5A(QUIET,INLP,DSTEN,SRCENL,SRCENFL);
wire DRT_1;                                                                     //[00057] DRT1_(DRT_1) = ND3A(SRCRD,CYCEND,DSTEN);
wire DSTRD;                                                                     //[00058] DRT2_(DRT_2) = ND2A(DSTRD,CYCENDL);
wire DRT_2;                                                                     //[00058] DRT2_(DRT_2) = ND2A(DSTRD,CYCENDL);
wire DRT_3;                                                                     //[00059] DRT3_(DRT_3) = ND5A(DSTWR,CYCEND,INNER0L,SRCENL,DSTEN);
wire IDSTRD;                                                                    //[00060] DRT4_(IDSTRD) = ND4A(DRT_0,DRT_1,DRT_2,DRT_3);
wire DSTRDL;                                                                    //[00061] DSTRD_(DSTRD,DSTRDL) = FD2A(IDSTRD,CCLK,SRESETL);
wire DWT_0;                                                                     //[00065] DWT0_(DWT_0) = ND5A(QUIET,INLP,DSTENL,SRCENL,SRCENFL);
wire DWT_1;                                                                     //[00066] DWT1_(DWT_1) = ND3A(DSTRD,CYCEND,COLSTOPL);
wire DWT_2;                                                                     //[00067] DWT2_(DWT_2) = ND4A(SRCRD,CYCEND,DSTENL,COLSTOPL);
wire DWT_3;                                                                     //[00068] DWT3_(DWT_3) = ND2A(DSTWR,CYCENDL);
wire DWT_4;                                                                     //[00069] DWT4_(DWT_4) = ND5A(DSTWR,CYCEND,INNER0L,DSTENL,SRCENL);
wire DWT_5;                                                                     //[00070] DWT5_(DWT_5) = ND2A(STOP,RESUME);
wire DSTWRL;                                                                    //[00072] DSTWR_(DSTWR,DSTWRL) = FD2A(IDSTWR,CCLK,SRESETL);
wire STT_0;                                                                     //[00076] STT0_(STT_0) = ND3A(DSTRD,CYCEND,COLSTOP);
wire STT_1;                                                                     //[00077] STT1_(STT_1) = ND4A(SRCRD,CYCEND,COLSTOP,DSTENL);
wire STT_2;                                                                     //[00078] STT2_(STT_2) = ND2A(STOP,RESUMEL);
wire ISTOP;                                                                     //[00079] STT3_(ISTOP) = ND3A(STT_0,STT_1,STT_2);
wire STOPL;                                                                     //[00080] STOP_(STOP,STOPL) = FD2A(ISTOP,CCLK,SRESETL);
wire IINCLKL;                                                                   //[00091] INCKGEN_(IINCLKL) = ND2A(ICYCST,IDSTWR);
wire INCLK;                                                                     //[00092] INCKLAT_(INCLKL,INCLK) = FD1A(IINCLKL,CCLK);
wire SUT_0;                                                                     //[00099] SUT_0_(SUT_0) = ND2A(SRCRD,ICYCEND);
wire SUT_1;                                                                     //[00100] SUT_1_(SUT_1) = ND3A(IDSTWR,ICYCST,LINDR);
wire SUT_2;                                                                     //[00101] SUT_2_(SUT_2) = ND3B(IUPDSRCL,SUT_0,SUT_1);
wire UPDSRC;                                                                    //[00102] UPDSRC_(UPDSRC,UPDSRCL) = FD1A(SUT_2,CCLK);
wire SUTL_3;                                                                    //[00108] SUT3_(SUTL_3,SUT_3) = FD1A(UPDSRCL,CCLKL);
wire SUT_3;                                                                     //[00108] SUT3_(SUTL_3,SUT_3) = FD1A(UPDSRCL,CCLKL);
wire SUT_4;                                                                     //[00109] SUT4_(SUT_4,SUTL_4) = FD1A(SUT_3,CCLK);
wire SUTL_4;                                                                    //[00109] SUT4_(SUT_4,SUTL_4) = FD1A(SUT_3,CCLK);
wire ABTL_0;                                                                    //[00124] ABD_0_(ABTL_0,ABT_0) = FD1A(ADDBACKL,CCLKL);
wire ABT_0;                                                                     //[00124] ABD_0_(ABTL_0,ABT_0) = FD1A(ADDBACKL,CCLKL);
wire ABT_1;                                                                     //[00125] ABT_1_(ABT_1,ABTL_1) = FD1A(ABT_0,CCLK);
wire ABTL_1;                                                                    //[00125] ABT_1_(ABT_1,ABTL_1) = FD1A(ABT_0,CCLK);
wire DUT_0;                                                                     //[00132] DUT_0_(DUT_0) = ND2A(DSTWR,ICYCEND);
wire DUT_1;                                                                     //[00133] DUT_1_(DUT_1) = ND2A(IUPDDSTL,DUT_0);
wire UPDDST;                                                                    //[00134] UPDDST_(UPDDST,UPDDSTL) = FD1A(DUT_1,CCLK);
wire LSTL;                                                                      //[00139] LDSTRM_(LSTL) = ND3A(ICYCEND,SRCRD,LINDRL);
wire ILDSRC;                                                                    //[00140] LDSGEN_(ILDSRC) = ND2A(ILDPATL,LSTL);
wire LDSRCT;                                                                    //[00141] LDSLATCH_(LDSRCT,LDSRCTL) = FD1A(ILDSRC,CCLK);
wire LDSRCTL;                                                                   //[00141] LDSLATCH_(LDSRCT,LDSRCTL) = FD1A(ILDSRC,CCLK);
wire LHT_0;                                                                     //[00148] LHT_0_(LHT_0,LHT_1) = FD1A(ILDPATL,CCLK);
wire LHT_1;                                                                     //[00148] LHT_0_(LHT_0,LHT_1) = FD1A(ILDPATL,CCLK);
wire LHT_2;                                                                     //[00149] LHT_2_(LHT_2) = ND2A(ILDPATL,LHT_0);
wire SRCLTOHL;                                                                  //[00150] SRCLTOH_(SRCLTOH,SRCLTOHL) = FD1A(LHT_2,CCLK);
wire LDTL;                                                                      //[00155] LDDDEC0_(LDTL) = ND2A(ICYCEND,DSTRD);
wire ILDDST;                                                                    //[00156] LDTGEN_(ILDDST) = ND2A(ILDPATL,LDTL);
wire LDDST;                                                                     //[00157] LDDLATCH_(LDDST,LDDSTL) = FD1A(ILDDST,CCLK);
wire NIBDIFL;                                                                   //[00163] SSWGEN_(SSWAP) = NR3C(NIBDIFL,RES_0,SRCENF);
wire STLDT;                                                                     //[00173] STLDT_(STLDT) = AND2A(SRCRD,CYCST);
wire STLDL;                                                                     //[00174] STLDL_(STLDL) = NR2A(STLDT,QUIET);
wire SAM1DL;                                                                    //[00175] SALATCH_(SAM1DL,SAM1D) = LD2A(SAM1L,STLDL);
wire SAM1D;                                                                     //[00175] SALATCH_(SAM1DL,SAM1D) = LD2A(SAM1L,STLDL);
wire DAM1;                                                                      //[00176] AINV_(DAM1) = N1A(DAM1L);

/* Invert inputs as required */

assign CCLKL = ~CCLK;                                                           //[00024] CCLKINV_(CCLKL) = N1A(CCLK);
assign CYCENDL = ~CYCEND;                                                       //[00025] CYCENDL_(CYCENDL) = N1A(CYCEND);
assign DSTENL = ~DSTEN;                                                         //[00026] DSTENL_(DSTENL) = N1A(DSTEN);
assign INLPL = ~INLP;                                                           //[00027] INLPL_(INLPL) = N1A(INLP);
assign INNER0L = ~INNER0;                                                       //[00028] INNER0L_(INNER0L) = N1A(INNER0);
assign LINDRL = ~LINDR;                                                         //[00029] LINDRL_(LINDRL) = N1A(LINDR);
assign RESUMEL = ~RESUME;                                                       //[00030] RESUMEL_(RESUMEL) = N1A(RESUME);
assign SRCENL = ~SRCEN;                                                         //[00031] SRCENL_(SRCENL) = N1A(SRCEN);
assign SRCENFL = ~SRCENF;                                                       //[00032] SRCENFL_(SRCENFL) = N1A(SRCENF);
assign SRESETL = ~SRESET;                                                       //[00033] SRESETL_(SRESETL) = N1A(SRESET);

assign COLSTOPL = ~(INHIB & COLST);                                             //[00035] COLSTOPL_(COLSTOPL) = ND2A(INHIB,COLST);
assign COLSTOP = ~COLSTOPL;                                                     //[00036] COLSTOP_(COLSTOP) = N1A(COLSTOPL);

/* Quiescent state of state machine - quiet */

assign QT_0 = ~(QUIET & INLPL);                                                 //[00040] QT0_(QT_0) = ND2A(QUIET,INLPL);
assign QT_1 = ~(DSTWR & CYCEND & INNER0);                                       //[00041] QT1_(QT_1) = ND3A(DSTWR,CYCEND,INNER0);
assign IQUIET = ~(QT_0 & QT_1);                                                 //[00042] QT2_(IQUIET) = ND2A(QT_0,QT_1);
FD4A QUIET__inst (.q(QUIET),.qL(QUIETL),.d(IQUIET),.clk(CCLK),.sL(SRESETL));    //[00043] QUIET_(QUIET,QUIETL) = FD4A(IQUIET,CCLK,SRESETL);

/* Source read cycle */

assign SRT_0 = ~(QUIET & INLP & SRCENF);                                        //[00047] SRT0_(SRT_0) = ND3A(QUIET,INLP,SRCENF);
assign SRT_1 = ~(QUIET & INLP & SRCEN);                                         //[00048] SRT1_(SRT_1) = ND3A(QUIET,INLP,SRCEN);
assign SRT_2 = ~(SRCRD & CYCENDL);                                              //[00049] SRT2_(SRT_2) = ND2A(SRCRD,CYCENDL);
assign SRT_3 = ~(DSTWR & CYCEND & INNER0L & SRCEN);                             //[00050] SRT3_(SRT_3) = ND4A(DSTWR,CYCEND,INNER0L,SRCEN);
assign ISRCRD = ~(SRT_0 & SRT_1 & SRT_2 & SRT_3);                               //[00051] SRT4_(ISRCRD) = ND4A(SRT_0,SRT_1,SRT_2,SRT_3);
FD2A SRCRD__inst (.q(SRCRD),.qL(SRCRDL),.d(ISRCRD),.clk(CCLK),.rL(SRESETL));    //[00052] SRCRD_(SRCRD,SRCRDL) = FD2A(ISRCRD,CCLK,SRESETL);

/* Destination read cycle */

assign DRT_0 = ~(QUIET & INLP & DSTEN & SRCENL & SRCENFL);                      //[00056] DRT0_(DRT_0) = ND5A(QUIET,INLP,DSTEN,SRCENL,SRCENFL);
assign DRT_1 = ~(SRCRD & CYCEND & DSTEN);                                       //[00057] DRT1_(DRT_1) = ND3A(SRCRD,CYCEND,DSTEN);
assign DRT_2 = ~(DSTRD & CYCENDL);                                              //[00058] DRT2_(DRT_2) = ND2A(DSTRD,CYCENDL);
assign DRT_3 = ~(DSTWR & CYCEND & INNER0L & SRCENL & DSTEN);                    //[00059] DRT3_(DRT_3) = ND5A(DSTWR,CYCEND,INNER0L,SRCENL,DSTEN);
assign IDSTRD = ~(DRT_0 & DRT_1 & DRT_2 & DRT_3);                               //[00060] DRT4_(IDSTRD) = ND4A(DRT_0,DRT_1,DRT_2,DRT_3);
FD2A DSTRD__inst (.q(DSTRD),.qL(DSTRDL),.d(IDSTRD),.clk(CCLK),.rL(SRESETL));    //[00061] DSTRD_(DSTRD,DSTRDL) = FD2A(IDSTRD,CCLK,SRESETL);

/* Destination write cycle */

assign DWT_0 = ~(QUIET & INLP & DSTENL & SRCENL & SRCENFL);                     //[00065] DWT0_(DWT_0) = ND5A(QUIET,INLP,DSTENL,SRCENL,SRCENFL);
assign DWT_1 = ~(DSTRD & CYCEND & COLSTOPL);                                    //[00066] DWT1_(DWT_1) = ND3A(DSTRD,CYCEND,COLSTOPL);
assign DWT_2 = ~(SRCRD & CYCEND & DSTENL & COLSTOPL);                           //[00067] DWT2_(DWT_2) = ND4A(SRCRD,CYCEND,DSTENL,COLSTOPL);
assign DWT_3 = ~(DSTWR & CYCENDL);                                              //[00068] DWT3_(DWT_3) = ND2A(DSTWR,CYCENDL);
assign DWT_4 = ~(DSTWR & CYCEND & INNER0L & DSTENL & SRCENL);                   //[00069] DWT4_(DWT_4) = ND5A(DSTWR,CYCEND,INNER0L,DSTENL,SRCENL);
assign DWT_5 = ~(STOP & RESUME);                                                //[00070] DWT5_(DWT_5) = ND2A(STOP,RESUME);
assign IDSTWR = ~(DWT_0 & DWT_1 & DWT_2 & DWT_3 & DWT_4 & DWT_5);               //[00071] DWT6_(IDSTWR) = ND6B(DWT_0,DWT_1,DWT_2,DWT_3,DWT_4,DWT_5);
FD2A DSTWR__inst (.q(DSTWR),.qL(DSTWRL),.d(IDSTWR),.clk(CCLK),.rL(SRESETL));    //[00072] DSTWR_(DSTWR,DSTWRL) = FD2A(IDSTWR,CCLK,SRESETL);

/* Collision stop state */

assign STT_0 = ~(DSTRD & CYCEND & COLSTOP);                                     //[00076] STT0_(STT_0) = ND3A(DSTRD,CYCEND,COLSTOP);
assign STT_1 = ~(SRCRD & CYCEND & COLSTOP & DSTENL);                            //[00077] STT1_(STT_1) = ND4A(SRCRD,CYCEND,COLSTOP,DSTENL);
assign STT_2 = ~(STOP & RESUMEL);                                               //[00078] STT2_(STT_2) = ND2A(STOP,RESUMEL);
assign ISTOP = ~(STT_0 & STT_1 & STT_2);                                        //[00079] STT3_(ISTOP) = ND3A(STT_0,STT_1,STT_2);
FD2A STOP__inst (.q(STOP),.qL(STOPL),.d(ISTOP),.clk(CCLK),.rL(SRESETL));        //[00080] STOP_(STOP,STOPL) = FD2A(ISTOP,CCLK,SRESETL);

/* Decodes from state */

/* Request a cycle for any of the three cycle types */

assign INCRQ = IDSTRD | ISRCRD | IDSTWR;                                        //[00086] INCRQ_(INCRQ) = OR3A(IDSTRD,ISRCRD,IDSTWR);

/* Inner count clock is a pulse one cycle long at the start of a destination
   write cycle.  */

assign IINCLKL = ~(ICYCST & IDSTWR);                                            //[00091] INCKGEN_(IINCLKL) = ND2A(ICYCST,IDSTWR);
FD1A INCKLAT__inst (.q(INCLKL),.qL(INCLK),.d(IINCLKL),.clk(CCLK));              //[00092] INCKLAT_(INCLKL,INCLK) = FD1A(IINCLKL,CCLK);

/* The source address register is updated in the last cycle of a source
address read.  It is also updated in the first cycle of a destination
write cycle in line draw mode, and can also be updated as part of the
outer loop, given by iupdsrcL */

assign SUT_0 = ~(SRCRD & ICYCEND);                                              //[00099] SUT_0_(SUT_0) = ND2A(SRCRD,ICYCEND);
assign SUT_1 = ~(IDSTWR & ICYCST & LINDR);                                      //[00100] SUT_1_(SUT_1) = ND3A(IDSTWR,ICYCST,LINDR);
assign SUT_2 = ~(IUPDSRCL & SUT_0 & SUT_1);                                     //[00101] SUT_2_(SUT_2) = ND3B(IUPDSRCL,SUT_0,SUT_1);
FD1A UPDSRC__inst (.q(UPDSRC),.qL(UPDSRCL),.d(SUT_2),.clk(CCLK));               //[00102] UPDSRC_(UPDSRC,UPDSRCL) = FD1A(SUT_2,CCLK);

/* A load strobe is produced from this active only for the second
half of the clock cycle.  This is because it can immediately follow
the previous source update (the add back) as with addbldL */

FD1A SUT3__inst (.q(SUTL_3),.qL(SUT_3),.d(UPDSRCL),.clk(CCLKL));                //[00108] SUT3_(SUTL_3,SUT_3) = FD1A(UPDSRCL,CCLKL);
FD1A SUT4__inst (.q(SUT_4),.qL(SUTL_4),.d(SUT_3),.clk(CCLK));                   //[00109] SUT4_(SUT_4,SUTL_4) = FD1A(SUT_3,CCLK);
assign UPSLDL = ~(SUT_3 & SUTL_4);                                              //[00110] UPSLDL_(UPSLDL) = ND2A(SUT_3,SUTL_4);

/* The source address can also perfrom the local addback in line
drawing mode.  This occurs on the last cycle of a line draw.  This
is an asynchronous signal as borrow does not become true until
after the first cycle of the write (which could immediately precede
the last */

assign ADDBACKL = ~(LINDR & DSTWR & BORROW & CYCEND);                           //[00118] ADDBACK_(ADDBACKL) = ND4A(LINDR,DSTWR,BORROW,CYCEND);

/* A load strobe is produced from this active only for the second
half of the clock cycle.  This is because it can immediately follow
the previous source update (the subtraction) */

FD1A ABD_0__inst (.q(ABTL_0),.qL(ABT_0),.d(ADDBACKL),.clk(CCLKL));              //[00124] ABD_0_(ABTL_0,ABT_0) = FD1A(ADDBACKL,CCLKL);
FD1A ABT_1__inst (.q(ABT_1),.qL(ABTL_1),.d(ABT_0),.clk(CCLK));                  //[00125] ABT_1_(ABT_1,ABTL_1) = FD1A(ABT_0,CCLK);
assign ADDBLDL = ~(ABT_0 & ABTL_1);                                             //[00126] ADDBLDL_(ADDBLDL) = ND2A(ABT_0,ABTL_1);

/* The destination address register update will always occur on
the last cycle of the destination write cycle.  It can also occur
in the outer loop, given by iupddstL */

assign DUT_0 = ~(DSTWR & ICYCEND);                                              //[00132] DUT_0_(DUT_0) = ND2A(DSTWR,ICYCEND);
assign DUT_1 = ~(IUPDDSTL & DUT_0);                                             //[00133] DUT_1_(DUT_1) = ND2A(IUPDDSTL,DUT_0);
FD1A UPDDST__inst (.q(UPDDST),.qL(UPDDSTL),.d(DUT_1),.clk(CCLK));               //[00134] UPDDST_(UPDDST,UPDDSTL) = FD1A(DUT_1,CCLK);

/* The source data register is loaded in the last cycle of the source
read cycle, when the pattern data is loaded and also at reset */

assign LSTL = ~(ICYCEND & SRCRD & LINDRL);                                      //[00139] LDSTRM_(LSTL) = ND3A(ICYCEND,SRCRD,LINDRL);
assign ILDSRC = ~(ILDPATL & LSTL);                                              //[00140] LDSGEN_(ILDSRC) = ND2A(ILDPATL,LSTL);
FD1A LDSLATCH__inst (.q(LDSRCT),.qL(LDSRCTL),.d(ILDSRC),.clk(CCLK));            //[00141] LDSLATCH_(LDSRCT,LDSRCTL) = FD1A(ILDSRC,CCLK);
assign LDSRCL = ~(LDSRCT | RESET);                                              //[00142] LDSRCL_(LDSRCL) = NR2C(LDSRCT,RESET);

/* When the source data register is loading pattern data, it must load
data from the low byte of the data bus into the high byte of the
register */

FD1A LHT_0__inst (.q(LHT_0),.qL(LHT_1),.d(ILDPATL),.clk(CCLK));                 //[00148] LHT_0_(LHT_0,LHT_1) = FD1A(ILDPATL,CCLK);
assign LHT_2 = ~(ILDPATL & LHT_0);                                              //[00149] LHT_2_(LHT_2) = ND2A(ILDPATL,LHT_0);
FD1A SRCLTOH__inst (.q(SRCLTOH),.qL(SRCLTOHL),.d(LHT_2),.clk(CCLK));            //[00150] SRCLTOH_(SRCLTOH,SRCLTOHL) = FD1A(LHT_2,CCLK);

/* The destination data register is loaded in the last cycle of the
destination read cycle, and again also when pattern data is loaded */

assign LDTL = ~(ICYCEND & DSTRD);                                               //[00155] LDDDEC0_(LDTL) = ND2A(ICYCEND,DSTRD);
assign ILDDST = ~(ILDPATL & LDTL);                                              //[00156] LDTGEN_(ILDDST) = ND2A(ILDPATL,LDTL);
FD1A LDDLATCH__inst (.q(LDDST),.qL(LDDSTL),.d(ILDDST),.clk(CCLK));              //[00157] LDDLATCH_(LDDST,LDDSTL) = FD1A(ILDDST,CCLK);

/* The two halves of the source data byte nust be swapped in hires or lores
if the -1 bits of the two addresses are different (given by nibdif, below).
It is inhibited if character painting is performed (srcenf) */

assign SSWAP = ~(NIBDIFL | RES_0 | SRCENF);                                     //[00163] SSWGEN_(SSWAP) = NR3C(NIBDIFL,RES_0,SRCENF);

/* Generate nibdif
This indicates that the nibble bits are different, and therefore the two
halves of the source data need to be swapped.  This requires that the source
address bit be latched at the start of the cycle as it may change part way
through an inner loop pass, when it is updated at the end of the source read
cycle.  It is loaded in the first tick of a source read, and also when the
state machine is inactive (in case there are no source reads) */

assign STLDT = SRCRD & CYCST;                                                   //[00173] STLDT_(STLDT) = AND2A(SRCRD,CYCST);
assign STLDL = ~(STLDT | QUIET);                                                //[00174] STLDL_(STLDL) = NR2A(STLDT,QUIET);
LD2A SALATCH__inst (.q(SAM1DL),.qL(SAM1D),.d(SAM1L),.en(STLDL));                //[00175] SALATCH_(SAM1DL,SAM1D) = LD2A(SAM1L,STLDL);
assign DAM1 = ~DAM1L;                                                           //[00176] AINV_(DAM1) = N1A(DAM1L);
assign NIBDIFL = ~((DAM1L & SAM1D)|(DAM1 & SAM1DL));                            //[00177] NDGEN_(NIBDIFL) = AO2B(DAM1L,SAM1D,DAM1,SAM1DL);

endmodule                                                                       //[00179] END MODULE;