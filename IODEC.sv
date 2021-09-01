                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	iodec-hdl					*
*	25/10/88					*
********************************************************/

/*
This module is the io decode in the SLIPSTREAM chip on the ACW
*/

module IODEC                                                                    //[00014] MODULE IODEC;
(                                                                               //[00014] MODULE IODEC;

    input    RESETL_0,                                                          //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    CLK,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    IOML,                                                              //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    VRD,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    VWR,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_0,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_1,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_2,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_3,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_4,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_5,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_6,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    input    A_7,                                                               //[00016] INPUTS	RESETL_0,CLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7;
    output    IORDL,                                                            //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    IOWRL,                                                            //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    BCSL,                                                             //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    JOYL_0,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    JOYL_1,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    JOYL_2,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    SSIORD,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    INTL,                                                             //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    INTH,                                                             //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    STARTL,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    STARTH,                                                           //[00017] OUTPUTS	IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTL,INTH,STARTL,STARTH,
    output    HCNTL,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    HCNTH,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    VCNTL,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    VCNTH,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    SCRL_0,                                                           //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    SCRL_1,                                                           //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    SCRL_2,                                                           //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    MODE,                                                             //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    BORDL,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    BORDH,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    TRANS,                                                            //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    MASK,                                                             //[00018]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
    output    INDEX,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    ENDL,                                                             //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    ENDH,                                                             //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    MEMLD,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    DIAGL_0,                                                          //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    DIAG_1,                                                           //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    LPL_0,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    LPL_1,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    LPL_2,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    LPL_3,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    STATL,                                                            //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    LCD,                                                              //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    ACK,                                                              //[00019]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
    output    DIS,                                                              //[00020]    DIS,GPIOL_0,GPIOL_1;
    output    GPIOL_0,                                                          //[00020]    DIS,GPIOL_0,GPIOL_1;
    output    GPIOL_1                                                           //[00020]    DIS,GPIOL_0,GPIOL_1;
);                                                                              //[00014] MODULE IODEC;
                                                                                //[00021] LEVEL FUNCTION;
                                                                                //[00022] DEFINE
wire RESET;                                                                     //[00024] RESET_(RESET) = N1A(RESETL_0);
wire RESETL;                                                                    //[00025] RESETL_(RESETL) = N1B(RESET);
wire IOM;                                                                       //[00029] IOM_(IOM) = N1A(IOML);
wire AL_0;                                                                      //[00039] AL_0_(AL_0) = N1C(A_0);
wire AL_1;                                                                      //[00040] AL_1_(AL_1) = N1C(A_1);
wire AL_2;                                                                      //[00041] AL_2_(AL_2) = N1C(A_2);
wire AL_3;                                                                      //[00042] AL_3_(AL_3) = N1C(A_3);
wire AL_4;                                                                      //[00043] AL_4_(AL_4) = N1C(A_4);
wire AL_5;                                                                      //[00044] AL_5_(AL_5) = N1C(A_5);
wire AL_6;                                                                      //[00045] AL_6_(AL_6) = N1C(A_6);
wire VCS;                                                                       //[00046] VCS_(VCS) = NR4A(A_5,A_6,A_7,IOML);
wire VCSL;                                                                      //[00047] VCSL_(VCSL) = N1A(VCS);
wire BCS;                                                                       //[00048] BCS_(BCS) = NR4A(AL_5,A_6,A_7,IOML);
wire RDWR;                                                                      //[00059] RDWR_(RDWR) = OR2A(VWR,VRD);
wire IORWL;                                                                     //[00060] IORWL_(IORWL) = ND2A(RDWR,IOM);
wire SSIOL;                                                                     //[00066] SSIOL_(SSIOL) = NR2A(BCS,VCS);
wire VRDL;                                                                      //[00067] VRDL_(VRDL) = N1A(VRD);
wire RDEC_0;                                                                    //[00072] RDEC_0_(RDEC_0) = NR2C(VCSL,VRDL);
wire WDEC_0;                                                                    //[00073] WDEC_0_(WDEC_0) = NR4C(VCSL,A_3,A_4,IOWRL);
wire WDEC_1;                                                                    //[00074] WDEC_1_(WDEC_1) = NR4C(VCSL,AL_3,A_4,IOWRL);
wire WDEC_2;                                                                    //[00075] WDEC_2_(WDEC_2) = NR4C(VCSL,A_3,AL_4,IOWRL);
assign RESET = ~RESETL_0;                                                       //[00024] RESET_(RESET) = N1A(RESETL_0);
assign RESETL = ~RESET;                                                         //[00025] RESETL_(RESETL) = N1B(RESET);

/* generate an IO write strobe */

assign IOM = ~IOML;                                                             //[00029] IOM_(IOM) = N1A(IOML);
assign IOWRL = ~(IOM & VWR);                                                    //[00030] IOWRL_0_(IOWRL) = ND2A(IOM,VWR);

/* generate the IO read strobe */

assign IORDL = ~(IOM & VRD);                                                    //[00034] IORDL_(IORDL) = ND2A(IOM,VRD);

/* generate vid and blitter 'chip' selects */
/* Vid appears between 0-1fh, Blitter between 20h-3fh */

assign AL_0 = ~A_0;                                                             //[00039] AL_0_(AL_0) = N1C(A_0);
assign AL_1 = ~A_1;                                                             //[00040] AL_1_(AL_1) = N1C(A_1);
assign AL_2 = ~A_2;                                                             //[00041] AL_2_(AL_2) = N1C(A_2);
assign AL_3 = ~A_3;                                                             //[00042] AL_3_(AL_3) = N1C(A_3);
assign AL_4 = ~A_4;                                                             //[00043] AL_4_(AL_4) = N1C(A_4);
assign AL_5 = ~A_5;                                                             //[00044] AL_5_(AL_5) = N1C(A_5);
assign AL_6 = ~A_6;                                                             //[00045] AL_6_(AL_6) = N1C(A_6);
assign VCS = ~(A_5 | A_6 | A_7 | IOML);                                         //[00046] VCS_(VCS) = NR4A(A_5,A_6,A_7,IOML);
assign VCSL = ~VCS;                                                             //[00047] VCSL_(VCSL) = N1A(VCS);
assign BCS = ~(AL_5 | A_6 | A_7 | IOML);                                        //[00048] BCS_(BCS) = NR4A(AL_5,A_6,A_7,IOML);
assign BCSL = ~BCS;                                                             //[00049] BCSL_(BCSL) = N1A(BCS);

/* joysticks appear between 40h-4fh and 50h-5fh */

assign JOYL_0 = A_4 | A_5 | AL_6 | A_7 | IORDL;                                 //[00053] JOYL_0_(JOYL_0) = OR5A(A_4,A_5,AL_6,A_7,IORDL);
assign JOYL_1 = AL_4 | A_5 | AL_6 | A_7 | IORDL;                                //[00054] JOYL_1_(JOYL_1) = OR5A(AL_4,A_5,AL_6,A_7,IORDL);
assign JOYL_2 = A_4 | A_5 | AL_6 | A_7 | IOWRL;                                 //[00055] JOYL_2_(JOYL_2) = OR5A(A_4,A_5,AL_6,A_7,IOWRL);

/* The general purpose IO decodes are between 60h-6fh and 70h-7fh */

assign RDWR = VWR | VRD;                                                        //[00059] RDWR_(RDWR) = OR2A(VWR,VRD);
assign IORWL = ~(RDWR & IOM);                                                   //[00060] IORWL_(IORWL) = ND2A(RDWR,IOM);
assign GPIOL_0 = A_4 | AL_5 | AL_6 | A_7 | IORWL;                               //[00061] GPIOL_0_(GPIOL_0) = OR5A(A_4,AL_5,AL_6,A_7,IORWL);
assign GPIOL_1 = AL_4 | AL_5 | AL_6 | A_7 | IORWL;                              //[00062] GPIOL_1_(GPIOL_1) = OR5A(AL_4,AL_5,AL_6,A_7,IORWL);

/* ssiord is asserted during slipstream IO reads..ie vid and blit */

assign SSIOL = ~(BCS | VCS);                                                    //[00066] SSIOL_(SSIOL) = NR2A(BCS,VCS);
assign VRDL = ~VRD;                                                             //[00067] VRDL_(VRDL) = N1A(VRD);
assign SSIORD = ~(SSIOL | VRDL);                                                //[00068] SSIORD_(SSIORD) = NR2A(SSIOL,VRDL);

/* now generate the individual decodes */

assign RDEC_0 = ~(VCSL | VRDL);                                                 //[00072] RDEC_0_(RDEC_0) = NR2C(VCSL,VRDL);
assign WDEC_0 = ~(VCSL | A_3 | A_4 | IOWRL);                                    //[00073] WDEC_0_(WDEC_0) = NR4C(VCSL,A_3,A_4,IOWRL);
assign WDEC_1 = ~(VCSL | AL_3 | A_4 | IOWRL);                                   //[00074] WDEC_1_(WDEC_1) = NR4C(VCSL,AL_3,A_4,IOWRL);
assign WDEC_2 = ~(VCSL | A_3 | AL_4 | IOWRL);                                   //[00075] WDEC_2_(WDEC_2) = NR4C(VCSL,A_3,AL_4,IOWRL);

assign LPL_0 = ~(RDEC_0 & AL_0 & AL_1 & AL_2);                                  //[00077] LPL_0_(LPL_0) = ND4A(RDEC_0,AL_0,AL_1,AL_2);
assign LPL_1 = ~(RDEC_0 & A_0 & AL_1 & AL_2);                                   //[00078] LPL_1_(LPL_1) = ND4A(RDEC_0,A_0,AL_1,AL_2);
assign LPL_2 = ~(RDEC_0 & AL_0 & A_1 & AL_2);                                   //[00079] LPL_2_(LPL_2) = ND4A(RDEC_0,AL_0,A_1,AL_2);
assign LPL_3 = ~(RDEC_0 & A_0 & A_1 & AL_2);                                    //[00080] LPL_3_(LPL_3) = ND4A(RDEC_0,A_0,A_1,AL_2);
assign STATL = ~(RDEC_0 & A_2);                                                 //[00081] STATL_(STATL) = ND2A(RDEC_0,A_2);

assign INTL = ~(RESETL & ~(WDEC_0 & AL_0 & AL_1 & AL_2));                       //[00083] INTLL_(INTL) = N4AND(RESETL,WDEC_0,AL_0,AL_1,AL_2);
assign INTH = ~(RESETL & ~(WDEC_0 & A_0 & AL_1 & AL_2));                        //[00084] INTHL_(INTH) = N4AND(RESETL,WDEC_0,A_0,AL_1,AL_2);
assign STARTL = ~(RESETL & ~(WDEC_0 & AL_0 & A_1 & AL_2));                      //[00085] STARTLL_(STARTL) = N4AND(RESETL,WDEC_0,AL_0,A_1,AL_2);
assign STARTH = ~(RESETL & ~(WDEC_0 & A_0 & A_1 & AL_2));                       //[00086] STARTHL_(STARTH) = N4AND(RESETL,WDEC_0,A_0,A_1,AL_2);
assign HCNTL = ~(RESETL & ~(WDEC_0 & AL_0 & AL_1 & A_2));                       //[00087] HCNTLL_(HCNTL) = N4AND(RESETL,WDEC_0,AL_0,AL_1,A_2);
assign HCNTH = ~(RESETL & ~(WDEC_0 & A_0 & AL_1 & A_2));                        //[00088] HCNTHL_(HCNTH) = N4AND(RESETL,WDEC_0,A_0,AL_1,A_2);
assign VCNTL = ~(RESETL & ~(WDEC_0 & AL_0 & A_1 & A_2));                        //[00089] VCNTLL_(VCNTL) = N4AND(RESETL,WDEC_0,AL_0,A_1,A_2);
assign VCNTH = ~(RESETL & ~(WDEC_0 & A_0 & A_1 & A_2));                         //[00090] VCNTHL_(VCNTH) = N4AND(RESETL,WDEC_0,A_0,A_1,A_2);

assign SCRL_0 = ~(RESETL & ~(WDEC_1 & AL_0 & AL_1 & AL_2));                     //[00092] SCRLL_0_(SCRL_0) = N4AND(RESETL,WDEC_1,AL_0,AL_1,AL_2);
assign SCRL_1 = ~(RESETL & ~(WDEC_1 & A_0 & AL_1 & AL_2));                      //[00093] SCRLL_1_(SCRL_1) = N4AND(RESETL,WDEC_1,A_0,AL_1,AL_2);
assign SCRL_2 = ~(RESETL & ~(WDEC_1 & AL_0 & A_1 & AL_2));                      //[00094] SCRLL_2_(SCRL_2) = N4AND(RESETL,WDEC_1,AL_0,A_1,AL_2);
assign ACK = ~(RESETL & ~(WDEC_1 & A_0 & A_1 & AL_2));                          //[00095] ACKL_(ACK) = N4AND(RESETL,WDEC_1,A_0,A_1,AL_2);
assign MODE = ~(RESETL & ~(WDEC_1 & AL_0 & AL_1 & A_2));                        //[00096] MODEL_(MODE) = N4AND(RESETL,WDEC_1,AL_0,AL_1,A_2);
assign BORDL = ~(RESETL & ~(WDEC_1 & A_0 & AL_1 & A_2));                        //[00097] BORDLL_(BORDL) = N4AND(RESETL,WDEC_1,A_0,AL_1,A_2);
assign BORDH = ~(RESETL & ~(WDEC_1 & AL_0 & A_1 & A_2));                        //[00098] BORDHL_(BORDH) = N4AND(RESETL,WDEC_1,AL_0,A_1,A_2);
assign MASK = ~(RESETL & ~(WDEC_1 & A_0 & A_1 & A_2));                          //[00099] MASKL_(MASK) = N4AND(RESETL,WDEC_1,A_0,A_1,A_2);

assign INDEX = ~(RESETL & ~(WDEC_2 & AL_0 & AL_1 & AL_2));                      //[00101] INDEXL_(INDEX) = N4AND(RESETL,WDEC_2,AL_0,AL_1,AL_2);
assign ENDL = ~(RESETL & ~(WDEC_2 & A_0 & AL_1 & AL_2));                        //[00102] ENDLL_(ENDL) = N4AND(RESETL,WDEC_2,A_0,AL_1,AL_2);
assign ENDH = ~(RESETL & ~(WDEC_2 & AL_0 & A_1 & AL_2));                        //[00103] ENDHL_(ENDH) = N4AND(RESETL,WDEC_2,AL_0,A_1,AL_2);
assign MEMLD = ~(RESETL & ~(WDEC_2 & A_0 & A_1 & AL_2));                        //[00104] MEML_(MEMLD) = N4AND(RESETL,WDEC_2,A_0,A_1,AL_2);
assign LCD = ~(RESETL & ~(WDEC_2 & AL_0 & AL_1 & A_2));                         //[00105] LCDL_(LCD) = N4AND(RESETL,WDEC_2,AL_0,AL_1,A_2);
assign DIAGL_0 = ~(WDEC_2 & A_0 & AL_1 & A_2);                                  //[00106] DIAGL_0_(DIAGL_0) = ND4A(WDEC_2,A_0,AL_1,A_2);
assign DIAG_1 = ~(RESETL & DIAGL_0);                                            //[00107] DIAGL_1_(DIAG_1) = ND2C(RESETL,DIAGL_0);
assign DIS = ~(RESETL & ~(WDEC_2 & AL_0 & A_1 & A_2));                          //[00108] DISL_(DIS) = N4AND(RESETL,WDEC_2,AL_0,A_1,A_2);
assign TRANS = ~(RESETL & ~(WDEC_2 & A_0 & A_1 & A_2));                         //[00109] TRANSL_(TRANS) = N4AND(RESETL,WDEC_2,A_0,A_1,A_2);

/* NB diagL[0] is not asserted during reset, diag[1] is! */

endmodule                                                                       //[00113] END MODULE;