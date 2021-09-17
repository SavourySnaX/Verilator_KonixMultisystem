                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	vcnt-hdl					*
*	2/11/88						*
********************************************************/

/*
This module is the vertical timebase in the SLIPSTREAM chip on the ACW
*/

module m_VCNT                                                                   //[00017] MODULE VCNT;
(                                                                               //[00017] MODULE VCNT;

    input    inD_0,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_1,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_2,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_3,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_4,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_5,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_6,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    inD_7,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    RESETL_0,                                                          //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    CLK,                                                               //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_0,                                                              //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_1,                                                              //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_2,                                                              //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_3,                                                              //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_4,                                                              //[00019] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CLK,WD_0,WD_1,WD_2,WD_3,WD_4,
    input    WD_5,                                                              //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    WD_6,                                                              //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    WD_7,                                                              //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    VCNTL,                                                             //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    VCNTH,                                                             //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    LPL_2,                                                             //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    LPL_3,                                                             //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    VLOCK,                                                             //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    NTSC,                                                              //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    GENLOCK,                                                           //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    STARTL,                                                            //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    STARTH,                                                            //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    ENDL,                                                              //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
    input    ENDH,                                                              //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    INTL,                                                              //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    INTH,                                                              //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    HBORDER,                                                           //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    HBLANKING,                                                         //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    HVSYNC,                                                            //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    LPCLK,                                                             //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    HD1,                                                               //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    DIAG,                                                              //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    LORES,                                                             //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    input    HINT,                                                              //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
                                                                                //[00020]    WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,STARTL,STARTH,ENDL,
                                                                                //[00021]    ENDH,INTL,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,DIAG,LORES,HINT;
    output    outD_0,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_1,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_2,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_3,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_4,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_5,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_6,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    outD_7,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_0,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_1,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_2,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_3,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_4,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_5,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_6,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    enD_7,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    VVACTIVE,                                                         //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    VSYNC,                                                            //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    VINT,                                                             //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    BORDER,                                                           //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    BLANKING,                                                         //[00022] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
    output    STARTD,                                                           //[00023]    STARTD,NEXTV;
    output    NEXTV                                                             //[00023]    STARTD,NEXTV;
);                                                                              //[00017] MODULE VCNT;
                                                                                //[00024] LEVEL FUNCTION;
wire RESETL;                                                                    //[00029] RESETL_(RESETL) = B3A(RESETL_0);
wire RES;                                                                       //[00030] RES_(RES) = N1A(RESETL);
wire VCNT_8;                                                                    //[00034] VCNT_8_(VCNT_8,VCNTL_8) = LD1A(WD_0,VCNTH);
wire VCNTL_8;                                                                   //[00034] VCNT_8_(VCNT_8,VCNTL_8) = LD1A(WD_0,VCNTH);
wire HDD;                                                                       //[00041] HDD_(HDD) = NR2A(HD1,DIAG);
wire HD1D;                                                                      //[00042] HD1D_(HD1D) = NR2C(HDD,RES);
wire VCNTLBL;                                                                   //[00046] VCNTLBL_(VCNTLBL) = N1C(VCNTL);
wire VC_0;                                                                      //[00047] Q_0_(VC_0,VCB_0,CO_0) = SYNCNT(WD_0,CLK,NEXTV,VCNTLBL,HD1D);
wire VCB_0;                                                                     //[00047] Q_0_(VC_0,VCB_0,CO_0) = SYNCNT(WD_0,CLK,NEXTV,VCNTLBL,HD1D);
wire CO_0;                                                                      //[00047] Q_0_(VC_0,VCB_0,CO_0) = SYNCNT(WD_0,CLK,NEXTV,VCNTLBL,HD1D);
wire VC_1;                                                                      //[00048] Q_1_(VC_1,VCB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTV,VCNTLBL,CO_0);
wire VCB_1;                                                                     //[00048] Q_1_(VC_1,VCB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTV,VCNTLBL,CO_0);
wire CO_1;                                                                      //[00048] Q_1_(VC_1,VCB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTV,VCNTLBL,CO_0);
wire VC_2;                                                                      //[00049] Q_2_(VC_2,VCB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTV,VCNTLBL,CO_1);
wire VCB_2;                                                                     //[00049] Q_2_(VC_2,VCB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTV,VCNTLBL,CO_1);
wire CO_2;                                                                      //[00049] Q_2_(VC_2,VCB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTV,VCNTLBL,CO_1);
wire VC_3;                                                                      //[00050] Q_3_(VC_3,VCB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTV,VCNTLBL,CO_2);
wire VCB_3;                                                                     //[00050] Q_3_(VC_3,VCB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTV,VCNTLBL,CO_2);
wire CO_3;                                                                      //[00050] Q_3_(VC_3,VCB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTV,VCNTLBL,CO_2);
wire VC_4;                                                                      //[00051] Q_4_(VC_4,VCB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTV,VCNTLBL,CO_3);
wire VCB_4;                                                                     //[00051] Q_4_(VC_4,VCB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTV,VCNTLBL,CO_3);
wire CO_4;                                                                      //[00051] Q_4_(VC_4,VCB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTV,VCNTLBL,CO_3);
wire VC_5;                                                                      //[00052] Q_5_(VC_5,VCB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTV,VCNTLBL,CO_4);
wire VCB_5;                                                                     //[00052] Q_5_(VC_5,VCB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTV,VCNTLBL,CO_4);
wire CO_5;                                                                      //[00052] Q_5_(VC_5,VCB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTV,VCNTLBL,CO_4);
wire VC_6;                                                                      //[00053] Q_6_(VC_6,VCB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTV,VCNTLBL,CO_5);
wire VCB_6;                                                                     //[00053] Q_6_(VC_6,VCB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTV,VCNTLBL,CO_5);
wire CO_6;                                                                      //[00053] Q_6_(VC_6,VCB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTV,VCNTLBL,CO_5);
wire VC_7;                                                                      //[00054] Q_7_(VC_7,VCB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTV,VCNTLBL,CO_6);
wire VCB_7;                                                                     //[00054] Q_7_(VC_7,VCB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTV,VCNTLBL,CO_6);
wire CO_7;                                                                      //[00054] Q_7_(VC_7,VCB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTV,VCNTLBL,CO_6);
wire VC_8;                                                                      //[00055] Q_8_(VC_8,VCB_8,CO_8) = SYNCNT(VCNT_8,CLK,NEXTV,VCNTLBL,CO_7);
wire VCB_8;                                                                     //[00055] Q_8_(VC_8,VCB_8,CO_8) = SYNCNT(VCNT_8,CLK,NEXTV,VCNTLBL,CO_7);
wire CO_8;                                                                      //[00055] Q_8_(VC_8,VCB_8,CO_8) = SYNCNT(VCNT_8,CLK,NEXTV,VCNTLBL,CO_7);
wire INT_0;                                                                     //[00078] INT_0_(INT_0,INTB_0) = LD1A(WD_0,INTL);
wire INTB_0;                                                                    //[00078] INT_0_(INT_0,INTB_0) = LD1A(WD_0,INTL);
wire INT_1;                                                                     //[00079] INT_1_(INT_1,INTB_1) = LD1A(WD_1,INTL);
wire INTB_1;                                                                    //[00079] INT_1_(INT_1,INTB_1) = LD1A(WD_1,INTL);
wire INT_2;                                                                     //[00080] INT_2_(INT_2,INTB_2) = LD1A(WD_2,INTL);
wire INTB_2;                                                                    //[00080] INT_2_(INT_2,INTB_2) = LD1A(WD_2,INTL);
wire INT_3;                                                                     //[00081] INT_3_(INT_3,INTB_3) = LD1A(WD_3,INTL);
wire INTB_3;                                                                    //[00081] INT_3_(INT_3,INTB_3) = LD1A(WD_3,INTL);
wire INT_4;                                                                     //[00082] INT_4_(INT_4,INTB_4) = LD1A(WD_4,INTL);
wire INTB_4;                                                                    //[00082] INT_4_(INT_4,INTB_4) = LD1A(WD_4,INTL);
wire INT_5;                                                                     //[00083] INT_5_(INT_5,INTB_5) = LD1A(WD_5,INTL);
wire INTB_5;                                                                    //[00083] INT_5_(INT_5,INTB_5) = LD1A(WD_5,INTL);
wire INT_6;                                                                     //[00084] INT_6_(INT_6,INTB_6) = LD1A(WD_6,INTL);
wire INTB_6;                                                                    //[00084] INT_6_(INT_6,INTB_6) = LD1A(WD_6,INTL);
wire INT_7;                                                                     //[00085] INT_7_(INT_7,INTB_7) = LD1A(WD_7,INTL);
wire INTB_7;                                                                    //[00085] INT_7_(INT_7,INTB_7) = LD1A(WD_7,INTL);
wire INT_8;                                                                     //[00086] INT_8_(INT_8,INTB_8) = LD1A(WD_0,INTH);
wire INTB_8;                                                                    //[00086] INT_8_(INT_8,INTB_8) = LD1A(WD_0,INTH);
wire VD13;                                                                      //[00091] VD13_(VD13) = AND10(HD1D,VCB_8,VCB_7,VCB_6,VCB_5,VCB_4,VC_3,VC_2,VCB_1,VC_0);
wire VD16;                                                                      //[00093] VD16_(VD16) = AND10(HD1D,VCB_8,VCB_7,VCB_6,VCB_5,VC_4,VCB_3,VCB_2,VCB_1,VCB_0);
wire VD303;                                                                     //[00095] VD303_(VD303) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VCB_4,VC_3,VC_2,VC_1,VC_0);
wire VD308;                                                                     //[00097] VD308_(VD308) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VC_4,VCB_3,VC_2,VCB_1,VCB_0);
wire VD311;                                                                     //[00099] VD311_(VD311) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VC_4,VCB_3,VC_2,VC_1,VC_0);
wire VD255;                                                                     //[00101] VD255_(VD255) = AND10(HD1D,VCB_8,VC_7,VC_6,VC_5,VC_4,VC_3,VC_2,VC_1,VC_0);
wire VD258;                                                                     //[00103] VD258_(VD258) = AND10(HD1D,VC_8,VCB_7,VCB_6,VCB_5,VCB_4,VCB_3,VCB_2,VC_1,
wire VD261;                                                                     //[00106] VD261_(VD261) = AND10(HD1D,VC_8,VCB_7,VCB_6,VCB_5,VCB_4,VCB_3,VC_2,VCB_1,VC_0);
wire PAL;                                                                       //[00109] PAL_(PAL) = N1A(NTSC);
wire VBENDL;                                                                    //[00113] VBENDL_(VBENDL) = AO2A(PAL,VD303,NTSC,VD255);
wire VBEND;                                                                     //[00114] VBEND_(VBEND) = N1A(VBENDL);
wire VBSTARTL;                                                                  //[00115] VBSTARTL_(VBSTARTL) = AO2A(PAL,VD16,NTSC,VD13);
wire VBSTART;                                                                   //[00116] VBSRART_(VBSTART) = N1A(VBSTARTL);
wire VSSTL;                                                                     //[00120] VSSTL_(VSSTL) = AO2A(PAL,VD308,NTSC,VD258);
wire VSST;                                                                      //[00121] VSST_(VSST) = N1A(VSSTL);
wire VSENDL;                                                                    //[00122] VSENDL_(VSENDL) = AO2A(PAL,VD311,NTSC,VD261);
wire VLOCKD;                                                                    //[00127] VLOCKD_(VLOCKD,VLOCKDL) = FD2A(VLOCK,CLK,RESETL);
wire VLOCKDL;                                                                   //[00127] VLOCKD_(VLOCKD,VLOCKDL) = FD2A(VLOCK,CLK,RESETL);
wire VLOCKL;                                                                    //[00128] VLOCKL_(VLOCKL) = ND2A(GENLOCK,VLOCKD);
wire VVSYNC;                                                                    //[00133] VVSYNC_(VVSYNC,VVSYNCL) = JK(VSST,NEXTV,RES,CLK);
wire VVSYNCL;                                                                   //[00133] VVSYNC_(VVSYNC,VVSYNCL) = JK(VSST,NEXTV,RES,CLK);
wire VSYNCDL;                                                                   //[00134] VSYNCDL_(VSYNCDL) = ND2A(HVSYNC,VVSYNC);
wire VBLANKING;                                                                 //[00139] VBLANKING_(VBLANKING,VBLANKINGL) = JK(VBEND,VBSTART,RES,CLK);
wire VBLANKINGL;                                                                //[00139] VBLANKING_(VBLANKING,VBLANKINGL) = JK(VBEND,VBSTART,RES,CLK);
wire START_0;                                                                   //[00145] START_0_(START_0,STARTB_0) = LD1A(WD_0,STARTL);
wire STARTB_0;                                                                  //[00145] START_0_(START_0,STARTB_0) = LD1A(WD_0,STARTL);
wire START_1;                                                                   //[00146] START_1_(START_1,STARTB_1) = LD1A(WD_1,STARTL);
wire STARTB_1;                                                                  //[00146] START_1_(START_1,STARTB_1) = LD1A(WD_1,STARTL);
wire START_2;                                                                   //[00147] START_2_(START_2,STARTB_2) = LD1A(WD_2,STARTL);
wire STARTB_2;                                                                  //[00147] START_2_(START_2,STARTB_2) = LD1A(WD_2,STARTL);
wire START_3;                                                                   //[00148] START_3_(START_3,STARTB_3) = LD1A(WD_3,STARTL);
wire STARTB_3;                                                                  //[00148] START_3_(START_3,STARTB_3) = LD1A(WD_3,STARTL);
wire START_4;                                                                   //[00149] START_4_(START_4,STARTB_4) = LD1A(WD_4,STARTL);
wire STARTB_4;                                                                  //[00149] START_4_(START_4,STARTB_4) = LD1A(WD_4,STARTL);
wire START_5;                                                                   //[00150] START_5_(START_5,STARTB_5) = LD1A(WD_5,STARTL);
wire STARTB_5;                                                                  //[00150] START_5_(START_5,STARTB_5) = LD1A(WD_5,STARTL);
wire START_6;                                                                   //[00151] START_6_(START_6,STARTB_6) = LD1A(WD_6,STARTL);
wire STARTB_6;                                                                  //[00151] START_6_(START_6,STARTB_6) = LD1A(WD_6,STARTL);
wire START_7;                                                                   //[00152] START_7_(START_7,STARTB_7) = LD1A(WD_7,STARTL);
wire STARTB_7;                                                                  //[00152] START_7_(START_7,STARTB_7) = LD1A(WD_7,STARTL);
wire START_8;                                                                   //[00153] STARTH_8_(START_8,STARTB_8) = LD1A(WD_0,STARTH);
wire STARTB_8;                                                                  //[00153] STARTH_8_(START_8,STARTB_8) = LD1A(WD_0,STARTH);
wire END_0;                                                                     //[00157] END_0_(END_0,ENDB_0) = LD1A(WD_0,ENDL);
wire ENDB_0;                                                                    //[00157] END_0_(END_0,ENDB_0) = LD1A(WD_0,ENDL);
wire END_1;                                                                     //[00158] END_1_(END_1,ENDB_1) = LD1A(WD_1,ENDL);
wire ENDB_1;                                                                    //[00158] END_1_(END_1,ENDB_1) = LD1A(WD_1,ENDL);
wire END_2;                                                                     //[00159] END_2_(END_2,ENDB_2) = LD1A(WD_2,ENDL);
wire ENDB_2;                                                                    //[00159] END_2_(END_2,ENDB_2) = LD1A(WD_2,ENDL);
wire END_3;                                                                     //[00160] END_3_(END_3,ENDB_3) = LD1A(WD_3,ENDL);
wire ENDB_3;                                                                    //[00160] END_3_(END_3,ENDB_3) = LD1A(WD_3,ENDL);
wire END_4;                                                                     //[00161] END_4_(END_4,ENDB_4) = LD1A(WD_4,ENDL);
wire ENDB_4;                                                                    //[00161] END_4_(END_4,ENDB_4) = LD1A(WD_4,ENDL);
wire END_5;                                                                     //[00162] END_5_(END_5,ENDB_5) = LD1A(WD_5,ENDL);
wire ENDB_5;                                                                    //[00162] END_5_(END_5,ENDB_5) = LD1A(WD_5,ENDL);
wire END_6;                                                                     //[00163] END_6_(END_6,ENDB_6) = LD1A(WD_6,ENDL);
wire ENDB_6;                                                                    //[00163] END_6_(END_6,ENDB_6) = LD1A(WD_6,ENDL);
wire END_7;                                                                     //[00164] END_7_(END_7,ENDB_7) = LD1A(WD_7,ENDL);
wire ENDB_7;                                                                    //[00164] END_7_(END_7,ENDB_7) = LD1A(WD_7,ENDL);
wire END_8;                                                                     //[00165] ENDH_8_(END_8,ENDB_8) = LD1A(WD_0,ENDH);
wire ENDB_8;                                                                    //[00165] ENDH_8_(END_8,ENDB_8) = LD1A(WD_0,ENDH);
wire ENDD;                                                                      //[00166] ENDD_(ENDD) = EQU9(END_0,END_1,END_2,END_3,END_4,END_5,END_6,END_7,END_8,VC_0,
wire VBORDERL;                                                                  //[00171] VBORDER_(VBORDERL,VBORDER) = JK(STARTD,ENDD,RES,CLK);
wire VBORDER;                                                                   //[00171] VBORDER_(VBORDERL,VBORDER) = JK(STARTD,ENDD,RES,CLK);
wire HBORDERL;                                                                  //[00172] HBORDERL_(HBORDERL) = N1A(HBORDER);
wire LORESL;                                                                    //[00184] LORESL_(LORESL) = N1A(LORES);
wire REF4;                                                                      //[00185] REF4_(REF4) = ND2A(LORESL,VC_1);
wire REFACTIVEL;                                                                //[00186] REFACTIVEL_(REFACTIVEL) = ND5A(VCB_2,VCB_3,VCB_4,VCB_5,REF4);

/* buffer the clock and reset */

assign RESETL = RESETL_0;                                                       //[00029] RESETL_(RESETL) = B3A(RESETL_0);
assign RES = ~RESETL;                                                           //[00030] RES_(RES) = N1A(RESETL);

/* latch the msb of the vertical count */

LD1A VCNT_8__inst (.q(VCNT_8),.qL(VCNTL_8),.d(WD_0),.en(VCNTH));                //[00034] VCNT_8_(VCNT_8,VCNTL_8) = LD1A(WD_0,VCNTH);

/* the vertical counter usually increments when the horizontal
count is one (hd1). For test purposes the counter may count every clock
cycle by setting diag. Reset is added to the decode for 'hd1d' to
help define the JKs after reset */

assign HDD = ~(HD1 | DIAG);                                                     //[00041] HDD_(HDD) = NR2A(HD1,DIAG);
assign HD1D = ~(HDD | RES);                                                     //[00042] HD1D_(HD1D) = NR2C(HDD,RES);

/* the vertical counter */

assign VCNTLBL = ~VCNTL;                                                        //[00046] VCNTLBL_(VCNTLBL) = N1C(VCNTL);
SYNCNT Q_0__inst (.Q(VC_0),.QB(VCB_0),.CO(CO_0),.D(WD_0),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(HD1D));//[00047] Q_0_(VC_0,VCB_0,CO_0) = SYNCNT(WD_0,CLK,NEXTV,VCNTLBL,HD1D);
SYNCNT Q_1__inst (.Q(VC_1),.QB(VCB_1),.CO(CO_1),.D(WD_1),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_0));//[00048] Q_1_(VC_1,VCB_1,CO_1) = SYNCNT(WD_1,CLK,NEXTV,VCNTLBL,CO_0);
SYNCNT Q_2__inst (.Q(VC_2),.QB(VCB_2),.CO(CO_2),.D(WD_2),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_1));//[00049] Q_2_(VC_2,VCB_2,CO_2) = SYNCNT(WD_2,CLK,NEXTV,VCNTLBL,CO_1);
SYNCNT Q_3__inst (.Q(VC_3),.QB(VCB_3),.CO(CO_3),.D(WD_3),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_2));//[00050] Q_3_(VC_3,VCB_3,CO_3) = SYNCNT(WD_3,CLK,NEXTV,VCNTLBL,CO_2);
SYNCNT Q_4__inst (.Q(VC_4),.QB(VCB_4),.CO(CO_4),.D(WD_4),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_3));//[00051] Q_4_(VC_4,VCB_4,CO_4) = SYNCNT(WD_4,CLK,NEXTV,VCNTLBL,CO_3);
SYNCNT Q_5__inst (.Q(VC_5),.QB(VCB_5),.CO(CO_5),.D(WD_5),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_4));//[00052] Q_5_(VC_5,VCB_5,CO_5) = SYNCNT(WD_5,CLK,NEXTV,VCNTLBL,CO_4);
SYNCNT Q_6__inst (.Q(VC_6),.QB(VCB_6),.CO(CO_6),.D(WD_6),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_5));//[00053] Q_6_(VC_6,VCB_6,CO_6) = SYNCNT(WD_6,CLK,NEXTV,VCNTLBL,CO_5);
SYNCNT Q_7__inst (.Q(VC_7),.QB(VCB_7),.CO(CO_7),.D(WD_7),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_6));//[00054] Q_7_(VC_7,VCB_7,CO_7) = SYNCNT(WD_7,CLK,NEXTV,VCNTLBL,CO_6);
SYNCNT Q_8__inst (.Q(VC_8),.QB(VCB_8),.CO(CO_8),.D(VCNT_8),.CLK(CLK),.CLR(NEXTV),.LDL(VCNTLBL),.CI(CO_7));//[00055] Q_8_(VC_8,VCB_8,CO_8) = SYNCNT(VCNT_8,CLK,NEXTV,VCNTLBL,CO_7);

/* the light pen register */

wire latchD_0,latchDL_0;
wire latchD_1,latchDL_1;
wire latchD_2,latchDL_2;
wire latchD_3,latchDL_3;
wire latchD_4,latchDL_4;
wire latchD_5,latchDL_5;
wire latchD_6,latchDL_6;
wire latchD_7,latchDL_7;

LD1A DL_0_inst(.q(latchD_0),.qL(latchDL_0),.d(VCB_0),.en(LPCLK));
LD1A DL_1_inst(.q(latchD_1),.qL(latchDL_1),.d(VCB_1),.en(LPCLK));
LD1A DL_2_inst(.q(latchD_2),.qL(latchDL_2),.d(VCB_2),.en(LPCLK));
LD1A DL_3_inst(.q(latchD_3),.qL(latchDL_3),.d(VCB_3),.en(LPCLK));
LD1A DL_4_inst(.q(latchD_4),.qL(latchDL_4),.d(VCB_4),.en(LPCLK));
LD1A DL_5_inst(.q(latchD_5),.qL(latchDL_5),.d(VCB_5),.en(LPCLK));
LD1A DL_6_inst(.q(latchD_6),.qL(latchDL_6),.d(VCB_6),.en(LPCLK));
LD1A DL_7_inst(.q(latchD_7),.qL(latchDL_7),.d(VCB_7),.en(LPCLK));
LD1A DH_0_inst(.q(latchD_0),.qL(latchDL_0),.d(VCB_8),.en(LPCLK));
//ZTLATCH1 DL_0__inst (.QB(D_0),.D(VCB_0),.CLK(LPCLK),.ENL(LPL_2));               //[00059] DL_0_(D_0) = ZTLATCH1(D_0,VCB_0,LPCLK,LPL_2);
//ZTLATCH1 DL_1__inst (.QB(D_1),.D(VCB_1),.CLK(LPCLK),.ENL(LPL_2));               //[00060] DL_1_(D_1) = ZTLATCH1(D_1,VCB_1,LPCLK,LPL_2);
//ZTLATCH1 DL_2__inst (.QB(D_2),.D(VCB_2),.CLK(LPCLK),.ENL(LPL_2));               //[00061] DL_2_(D_2) = ZTLATCH1(D_2,VCB_2,LPCLK,LPL_2);
//ZTLATCH1 DL_3__inst (.QB(D_3),.D(VCB_3),.CLK(LPCLK),.ENL(LPL_2));               //[00062] DL_3_(D_3) = ZTLATCH1(D_3,VCB_3,LPCLK,LPL_2);
//ZTLATCH1 DL_4__inst (.QB(D_4),.D(VCB_4),.CLK(LPCLK),.ENL(LPL_2));               //[00063] DL_4_(D_4) = ZTLATCH1(D_4,VCB_4,LPCLK,LPL_2);
//ZTLATCH1 DL_5__inst (.QB(D_5),.D(VCB_5),.CLK(LPCLK),.ENL(LPL_2));               //[00064] DL_5_(D_5) = ZTLATCH1(D_5,VCB_5,LPCLK,LPL_2);
//ZTLATCH1 DL_6__inst (.QB(D_6),.D(VCB_6),.CLK(LPCLK),.ENL(LPL_2));               //[00065] DL_6_(D_6) = ZTLATCH1(D_6,VCB_6,LPCLK,LPL_2);
//ZTLATCH1 DL_7__inst (.QB(D_7),.D(VCB_7),.CLK(LPCLK),.ENL(LPL_2));               //[00066] DL_7_(D_7) = ZTLATCH1(D_7,VCB_7,LPCLK,LPL_2);
//ZTLATCH1 DH_0__inst (.QB(D_0),.D(VCB_8),.CLK(LPCLK),.ENL(LPL_3));               //[00067] DH_0_(D_0) = ZTLATCH1(D_0,VCB_8,LPCLK,LPL_3);

assign outD_0 = ((~LPL_2) & latchD_0) | ((~LPL_3) & latchD_0);
assign outD_1 = ((~LPL_2) & latchD_1) | ((~LPL_3) & RESETL);
assign outD_2 = ((~LPL_2) & latchD_2) | ((~LPL_3) & RESETL);
assign outD_3 = ((~LPL_2) & latchD_3) | ((~LPL_3) & RESETL);
assign outD_4 = ((~LPL_2) & latchD_4) | ((~LPL_3) & RESETL);
assign outD_5 = ((~LPL_2) & latchD_5) | ((~LPL_3) & RESETL);
assign outD_6 = ((~LPL_2) & latchD_6) | ((~LPL_3) & RESETL);
assign outD_7 = ((~LPL_2) & latchD_7) | ((~LPL_3) & RESETL);

assign enD_0 = (~LPL_2) | (~LPL_3);
assign enD_1 = (~LPL_2) | (~LPL_3);
assign enD_2 = (~LPL_2) | (~LPL_3);                                            //[00098] DH_2_(D_2) = MACZINVB1(RESETL,LPL_3);
assign enD_3 = (~LPL_2) | (~LPL_3);                                            //[00099] DH_3_(D_3) = MACZINVB1(RESETL,LPL_3);
assign enD_4 = (~LPL_2) | (~LPL_3);                                            //[00100] DH_4_(D_4) = MACZINVB1(RESETL,LPL_3);
assign enD_5 = (~LPL_2) | (~LPL_3);                                            //[00101] DH_5_(D_5) = MACZINVB1(RESETL,LPL_3);
assign enD_6 = (~LPL_2) | (~LPL_3);                                            //[00102] DH_6_(D_6) = MACZINVB1(RESETL,LPL_3);
assign enD_7 = (~LPL_2) | (~LPL_3);                                            //[00103] DH_7_(D_7) = MACZINVB1(RESETL,LPL_3);

/* the interupt register */

LD1A INT_0__inst (.q(INT_0),.qL(INTB_0),.d(WD_0),.en(INTL));                    //[00078] INT_0_(INT_0,INTB_0) = LD1A(WD_0,INTL);
LD1A INT_1__inst (.q(INT_1),.qL(INTB_1),.d(WD_1),.en(INTL));                    //[00079] INT_1_(INT_1,INTB_1) = LD1A(WD_1,INTL);
LD1A INT_2__inst (.q(INT_2),.qL(INTB_2),.d(WD_2),.en(INTL));                    //[00080] INT_2_(INT_2,INTB_2) = LD1A(WD_2,INTL);
LD1A INT_3__inst (.q(INT_3),.qL(INTB_3),.d(WD_3),.en(INTL));                    //[00081] INT_3_(INT_3,INTB_3) = LD1A(WD_3,INTL);
LD1A INT_4__inst (.q(INT_4),.qL(INTB_4),.d(WD_4),.en(INTL));                    //[00082] INT_4_(INT_4,INTB_4) = LD1A(WD_4,INTL);
LD1A INT_5__inst (.q(INT_5),.qL(INTB_5),.d(WD_5),.en(INTL));                    //[00083] INT_5_(INT_5,INTB_5) = LD1A(WD_5,INTL);
LD1A INT_6__inst (.q(INT_6),.qL(INTB_6),.d(WD_6),.en(INTL));                    //[00084] INT_6_(INT_6,INTB_6) = LD1A(WD_6,INTL);
LD1A INT_7__inst (.q(INT_7),.qL(INTB_7),.d(WD_7),.en(INTL));                    //[00085] INT_7_(INT_7,INTB_7) = LD1A(WD_7,INTL);
LD1A INT_8__inst (.q(INT_8),.qL(INTB_8),.d(WD_0),.en(INTH));                    //[00086] INT_8_(INT_8,INTB_8) = LD1A(WD_0,INTH);

assign VINT = (INT_0 ~^ VC_0) & (INT_1 ~^ VC_1) & (INT_2 ~^ VC_2) & (INT_3 ~^ VC_3) & (INT_4 ~^ VC_4) & (INT_5 ~^ VC_5) & (INT_6 ~^ VC_6) & (INT_7 ~^ VC_7) & (INT_8 ~^ VC_8) & HINT;//[00088] VINT_(VINT) = EQU9(INT_0,INT_1,INT_2,INT_3,INT_4,INT_5,INT_6,INT_7,INT_8,VC_0,
                                                                                //[00089]    VC_1,VC_2,VC_3,VC_4,VC_5,VC_6,VC_7,VC_8,HINT);

assign VD13 = HD1D & VCB_8 & VCB_7 & VCB_6 & VCB_5 & VCB_4 & VC_3 & VC_2 & VCB_1 & VC_0;//[00091] VD13_(VD13) = AND10(HD1D,VCB_8,VCB_7,VCB_6,VCB_5,VCB_4,VC_3,VC_2,VCB_1,VC_0);

assign VD16 = HD1D & VCB_8 & VCB_7 & VCB_6 & VCB_5 & VC_4 & VCB_3 & VCB_2 & VCB_1 & VCB_0;//[00093] VD16_(VD16) = AND10(HD1D,VCB_8,VCB_7,VCB_6,VCB_5,VC_4,VCB_3,VCB_2,VCB_1,VCB_0);

assign VD303 = HD1D & VC_8 & VCB_7 & VCB_6 & VC_5 & VCB_4 & VC_3 & VC_2 & VC_1 & VC_0;//[00095] VD303_(VD303) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VCB_4,VC_3,VC_2,VC_1,VC_0);

assign VD308 = HD1D & VC_8 & VCB_7 & VCB_6 & VC_5 & VC_4 & VCB_3 & VC_2 & VCB_1 & VCB_0;//[00097] VD308_(VD308) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VC_4,VCB_3,VC_2,VCB_1,VCB_0);

assign VD311 = HD1D & VC_8 & VCB_7 & VCB_6 & VC_5 & VC_4 & VCB_3 & VC_2 & VC_1 & VC_0;//[00099] VD311_(VD311) = AND10(HD1D,VC_8,VCB_7,VCB_6,VC_5,VC_4,VCB_3,VC_2,VC_1,VC_0);

assign VD255 = HD1D & VCB_8 & VC_7 & VC_6 & VC_5 & VC_4 & VC_3 & VC_2 & VC_1 & VC_0;//[00101] VD255_(VD255) = AND10(HD1D,VCB_8,VC_7,VC_6,VC_5,VC_4,VC_3,VC_2,VC_1,VC_0);

assign VD258 = HD1D & VC_8 & VCB_7 & VCB_6 & VCB_5 & VCB_4 & VCB_3 & VCB_2 & VC_1 & VCB_0;//[00103] VD258_(VD258) = AND10(HD1D,VC_8,VCB_7,VCB_6,VCB_5,VCB_4,VCB_3,VCB_2,VC_1,
                                                                                //[00104]    VCB_0);

assign VD261 = HD1D & VC_8 & VCB_7 & VCB_6 & VCB_5 & VCB_4 & VCB_3 & VC_2 & VCB_1 & VC_0;//[00106] VD261_(VD261) = AND10(HD1D,VC_8,VCB_7,VCB_6,VCB_5,VCB_4,VCB_3,VC_2,VCB_1,VC_0);

assign PAL = ~NTSC;                                                             //[00109] PAL_(PAL) = N1A(NTSC);

/* decode for blanking changes for ntsc */

assign VBENDL = ~((PAL & VD303)|(NTSC & VD255));                                //[00113] VBENDL_(VBENDL) = AO2A(PAL,VD303,NTSC,VD255);
assign VBEND = ~VBENDL;                                                         //[00114] VBEND_(VBEND) = N1A(VBENDL);
assign VBSTARTL = ~((PAL & VD16)|(NTSC & VD13));                                //[00115] VBSTARTL_(VBSTARTL) = AO2A(PAL,VD16,NTSC,VD13);
assign VBSTART = ~VBSTARTL;                                                     //[00116] VBSRART_(VBSTART) = N1A(VBSTARTL);

/* likewise decodes for vertical sync */

assign VSSTL = ~((PAL & VD308)|(NTSC & VD258));                                 //[00120] VSSTL_(VSSTL) = AO2A(PAL,VD308,NTSC,VD258);
assign VSST = ~VSSTL;                                                           //[00121] VSST_(VSST) = N1A(VSSTL);
assign VSENDL = ~((PAL & VD311)|(NTSC & VD261));                                //[00122] VSENDL_(VSENDL) = AO2A(PAL,VD311,NTSC,VD261);

/* The last decode is combined with the vertical lock input so they
have an equivalent effect */

FD2A VLOCKD__inst (.q(VLOCKD),.qL(VLOCKDL),.d(VLOCK),.clk(CLK),.rL(RESETL));    //[00127] VLOCKD_(VLOCKD,VLOCKDL) = FD2A(VLOCK,CLK,RESETL);
assign VLOCKL = ~(GENLOCK & VLOCKD);                                            //[00128] VLOCKL_(VLOCKL) = ND2A(GENLOCK,VLOCKD);
assign NEXTV = ~(VLOCKL & VSENDL);                                              //[00129] NEXTV_(NEXTV) = ND2A(VLOCKL,VSENDL);

/* generate vertical sync but disable when genlocking */

JK VVSYNC__inst (.q(VVSYNC),.qL(VVSYNCL),.j(VSST),.k(NEXTV),.r(RES),.clk(CLK)); //[00133] VVSYNC_(VVSYNC,VVSYNCL) = JK(VSST,NEXTV,RES,CLK);
assign VSYNCDL = ~(HVSYNC & VVSYNC);                                            //[00134] VSYNCDL_(VSYNCDL) = ND2A(HVSYNC,VVSYNC);
assign VSYNC = ~(VSYNCDL | GENLOCK);                                            //[00135] VSYNC_(VSYNC) = NR2A(VSYNCDL,GENLOCK);

/* generate blanking */

JK VBLANKING__inst (.q(VBLANKING),.qL(VBLANKINGL),.j(VBEND),.k(VBSTART),.r(RES),.clk(CLK));//[00139] VBLANKING_(VBLANKING,VBLANKINGL) = JK(VBEND,VBSTART,RES,CLK);
assign BLANKING = HBLANKING | VBLANKING;                                        //[00140] BLANKING_(BLANKING) = OR2A(HBLANKING,VBLANKING);

/* start and end registers */

LD1A START_0__inst (.q(START_0),.qL(STARTB_0),.d(WD_0),.en(STARTL));            //[00145] START_0_(START_0,STARTB_0) = LD1A(WD_0,STARTL);
LD1A START_1__inst (.q(START_1),.qL(STARTB_1),.d(WD_1),.en(STARTL));            //[00146] START_1_(START_1,STARTB_1) = LD1A(WD_1,STARTL);
LD1A START_2__inst (.q(START_2),.qL(STARTB_2),.d(WD_2),.en(STARTL));            //[00147] START_2_(START_2,STARTB_2) = LD1A(WD_2,STARTL);
LD1A START_3__inst (.q(START_3),.qL(STARTB_3),.d(WD_3),.en(STARTL));            //[00148] START_3_(START_3,STARTB_3) = LD1A(WD_3,STARTL);
LD1A START_4__inst (.q(START_4),.qL(STARTB_4),.d(WD_4),.en(STARTL));            //[00149] START_4_(START_4,STARTB_4) = LD1A(WD_4,STARTL);
LD1A START_5__inst (.q(START_5),.qL(STARTB_5),.d(WD_5),.en(STARTL));            //[00150] START_5_(START_5,STARTB_5) = LD1A(WD_5,STARTL);
LD1A START_6__inst (.q(START_6),.qL(STARTB_6),.d(WD_6),.en(STARTL));            //[00151] START_6_(START_6,STARTB_6) = LD1A(WD_6,STARTL);
LD1A START_7__inst (.q(START_7),.qL(STARTB_7),.d(WD_7),.en(STARTL));            //[00152] START_7_(START_7,STARTB_7) = LD1A(WD_7,STARTL);
LD1A STARTH_8__inst (.q(START_8),.qL(STARTB_8),.d(WD_0),.en(STARTH));           //[00153] STARTH_8_(START_8,STARTB_8) = LD1A(WD_0,STARTH);
assign STARTD = (START_0 ~^ VC_0) & (START_1 ~^ VC_1) & (START_2 ~^ VC_2) & (START_3 ~^ VC_3) & (START_4 ~^ VC_4) & (START_5 ~^ VC_5) & (START_6 ~^ VC_6) & (START_7 ~^ VC_7) & (START_8 ~^ VC_8) & HD1D;//[00154] STARTD_(STARTD) = EQU9(START_0,START_1,START_2,START_3,START_4,START_5,START_6,
                                                                                //[00155]    START_7,START_8,VC_0,VC_1,VC_2,VC_3,VC_4,VC_5,VC_6,VC_7,VC_8,HD1D);

LD1A END_0__inst (.q(END_0),.qL(ENDB_0),.d(WD_0),.en(ENDL));                    //[00157] END_0_(END_0,ENDB_0) = LD1A(WD_0,ENDL);
LD1A END_1__inst (.q(END_1),.qL(ENDB_1),.d(WD_1),.en(ENDL));                    //[00158] END_1_(END_1,ENDB_1) = LD1A(WD_1,ENDL);
LD1A END_2__inst (.q(END_2),.qL(ENDB_2),.d(WD_2),.en(ENDL));                    //[00159] END_2_(END_2,ENDB_2) = LD1A(WD_2,ENDL);
LD1A END_3__inst (.q(END_3),.qL(ENDB_3),.d(WD_3),.en(ENDL));                    //[00160] END_3_(END_3,ENDB_3) = LD1A(WD_3,ENDL);
LD1A END_4__inst (.q(END_4),.qL(ENDB_4),.d(WD_4),.en(ENDL));                    //[00161] END_4_(END_4,ENDB_4) = LD1A(WD_4,ENDL);
LD1A END_5__inst (.q(END_5),.qL(ENDB_5),.d(WD_5),.en(ENDL));                    //[00162] END_5_(END_5,ENDB_5) = LD1A(WD_5,ENDL);
LD1A END_6__inst (.q(END_6),.qL(ENDB_6),.d(WD_6),.en(ENDL));                    //[00163] END_6_(END_6,ENDB_6) = LD1A(WD_6,ENDL);
LD1A END_7__inst (.q(END_7),.qL(ENDB_7),.d(WD_7),.en(ENDL));                    //[00164] END_7_(END_7,ENDB_7) = LD1A(WD_7,ENDL);
LD1A ENDH_8__inst (.q(END_8),.qL(ENDB_8),.d(WD_0),.en(ENDH));                   //[00165] ENDH_8_(END_8,ENDB_8) = LD1A(WD_0,ENDH);
assign ENDD = (END_0 ~^ VC_0) & (END_1 ~^ VC_1) & (END_2 ~^ VC_2) & (END_3 ~^ VC_3) & (END_4 ~^ VC_4) & (END_5 ~^ VC_5) & (END_6 ~^ VC_6) & (END_7 ~^ VC_7) & (END_8 ~^ VC_8) & HD1D;//[00166] ENDD_(ENDD) = EQU9(END_0,END_1,END_2,END_3,END_4,END_5,END_6,END_7,END_8,VC_0,
                                                                                //[00167]    VC_1,VC_2,VC_3,VC_4,VC_5,VC_6,VC_7,VC_8,HD1D);

/* border is active outside these lines */

JK VBORDER__inst (.q(VBORDERL),.qL(VBORDER),.j(STARTD),.k(ENDD),.r(RES),.clk(CLK));//[00171] VBORDER_(VBORDERL,VBORDER) = JK(STARTD,ENDD,RES,CLK);
assign HBORDERL = ~HBORDER;                                                     //[00172] HBORDERL_(HBORDERL) = N1A(HBORDER);
assign BORDER = ~(VBORDERL & HBORDERL);                                         //[00173] BORDER_(BORDER) = ND2A(VBORDERL,HBORDERL);

/* Video is always active on certain lines in order to refresh memory */

/* The psuedo static ram chips are the most demanding, 256 cycles in 4ms,
4ms is approximately 64 video lines, refresh must occur on line 0 to force
refresh while genlocking. A low res. line refreshes 64 rows, a medium or high
res. line refreshes 128 rows so:-

every 64 lines starting at line zero the video is active for 2 or 4 lines */

assign LORESL = ~LORES;                                                         //[00184] LORESL_(LORESL) = N1A(LORES);
assign REF4 = ~(LORESL & VC_1);                                                 //[00185] REF4_(REF4) = ND2A(LORESL,VC_1);
assign REFACTIVEL = ~(VCB_2 & VCB_3 & VCB_4 & VCB_5 & REF4);                    //[00186] REFACTIVEL_(REFACTIVEL) = ND5A(VCB_2,VCB_3,VCB_4,VCB_5,REF4);

assign VVACTIVE = ~(REFACTIVEL & VBORDER);                                      //[00188] VVACTIVE_(VVACTIVE) = ND2A(REFACTIVEL,VBORDER);

endmodule                                                                       //[00190] END MODULE;