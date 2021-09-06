                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
stmem
19/10/88

State machine for the memory interface

This state machine controls the blitter memory interface

****************************************************************************/

module m_STMEM                                                                  //[00014] MODULE STMEM;
(                                                                               //[00014] MODULE STMEM;

    input    ACKINT,                                                            //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    CCLK,                                                              //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    COMCRQ,                                                            //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    IDSTWR,                                                            //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    INCRQ,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    INHIB,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    PARCRQ,                                                            //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    RESET,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    RES_0,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    RES_1,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    input    WAITL,                                                             //[00016] INPUTS	ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,RES_1,WAITL;
    output    CYCEND,                                                           //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    CYCST,                                                            //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    DATOEL,                                                           //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    ICYCEND,                                                          //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    ICYCST,                                                           //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    INCYCL,                                                           //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    PCEN,                                                             //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    UPDPCL,                                                           //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    BMREQ,                                                            //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    BRD,                                                              //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    BWR,                                                              //[00017] OUTPUTS	CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
    output    BWORD                                                             //[00018]    BWORD;
);                                                                              //[00014] MODULE STMEM;
                                                                                //[00019] LEVEL FUNCTION;
wire CCLKL;                                                                     //[00024] CCLKL_(CCLKL) = N1A(CCLK);
wire IDSTWRL;                                                                   //[00025] IDSTWRL_(IDSTWRL) = N1A(IDSTWR);
wire RESETL;                                                                    //[00026] RESETL_(RESETL) = N1A(RESET);
wire WAIT;                                                                      //[00027] WAITINV_(WAIT) = N1A(WAITL);
wire CYCRQ;                                                                     //[00031] CRQGEN_(CYCRQ) = OR3A(COMCRQ,PARCRQ,INCRQ);
wire MIL_0;                                                                     //[00033] IMI_0_(IMI_0) = ND3A(MIL_0,CYCRQ,ACKINT);
wire IMI_0;                                                                     //[00033] IMI_0_(IMI_0) = ND3A(MIL_0,CYCRQ,ACKINT);
wire MI_0;                                                                      //[00034] IMI_1_(IMI_1) = ND2A(MI_0,WAIT);
wire IMI_1;                                                                     //[00034] IMI_1_(IMI_1) = ND2A(MI_0,WAIT);
wire IMI_2;                                                                     //[00035] IMI_2_(IMI_2) = ND2B(IMI_0,IMI_1);
wire IMI_3;                                                                     //[00036] IMI_3_(IMI_3) = N1A(IMI_2);
wire MI_1;                                                                      //[00041] MILATCH_1_(MI_1,MIL_1) = FD2A(MI_0,CCLK,RESETL);
wire MIL_1;                                                                     //[00041] MILATCH_1_(MI_1,MIL_1) = FD2A(MI_0,CCLK,RESETL);
wire MREQT_0;                                                                   //[00051] MREQT_0_(MREQT_0) = ND2A(IDSTWR,INHIB);
wire MREQT_1;                                                                   //[00052] MREQT_1_(MREQT_1) = ND2A(IMI_2,MREQT_0);
wire BMREQL;                                                                    //[00053] MREQT_2_(BMREQL,BMREQ) = FD1A(MREQT_1,CCLK);
wire RWT_0;                                                                     //[00058] RWT_0_(RWT_0) = NR2A(IMI_2,MI_0);
wire RWT_1;                                                                     //[00059] RWT_1_(RWT_1) = NR2A(RWT_0,IDSTWR);
wire RWT_2;                                                                     //[00060] RWT_2_(RWT_2) = NR3A(RWT_0,IDSTWRL,INHIB);
wire BRDL;                                                                      //[00061] RDFF_(BRD,BRDL) = FD1A(RWT_1,CCLK);
wire BWRL;                                                                      //[00062] WRFF_(BWR,BWRL) = FD1A(RWT_2,CCLK);
wire CYCENDL;                                                                   //[00069] WRDT_0_(WRDT_0) = ND2A(BWORD,CYCENDL);
wire WRDT_0;                                                                    //[00069] WRDT_0_(WRDT_0) = ND2A(BWORD,CYCENDL);
wire WRDT_1;                                                                    //[00070] WRDT_1_(WRDT_1) = ND4A(ICYCST,INCRQ,RES_0,RES_1);
wire WRDT_2;                                                                    //[00071] WRDT_2_(WRDT_2) = ND2A(WRDT_0,WRDT_1);
wire BWORDL;                                                                    //[00072] WRDT_3_(BWORD,BWORDL) = FD2A(WRDT_2,CCLK,RESETL);
wire ICYCENDL;                                                                  //[00080] ICYCENDL_(ICYCENDL) = N1A(ICYCEND);
wire IWRD;                                                                      //[00087] IWRD_(IWRD,IWRDL) = FD1A(BWR,CCLKL);
wire IWRDL;                                                                     //[00087] IWRD_(IWRD,IWRDL) = FD1A(BWR,CCLKL);
wire PCNT_0;                                                                    //[00096] PCNT_0_(PCNT_0) = OR2A(COMCRQ,PARCRQ);
wire PCNT_1;                                                                    //[00097] PCNT_1_(PCNT_1) = ND2A(ICYCST,PCNT_0);
wire PCNT_2;                                                                    //[00098] PCNT_2_(PCNT_2) = ND2A(PCEN,CYCENDL);
wire PCNT_3;                                                                    //[00099] PCNT_3_(PCNT_3) = ND2A(PCNT_1,PCNT_2);
wire PCENL;                                                                     //[00100] PCEN_(PCEN,PCENL) = FD2A(PCNT_3,CCLK,RESETL);
wire PCNT_4;                                                                    //[00102] PCNT_4_(PCNT_4) = ND2A(PCEN,ICYCEND);
wire UPDPC;                                                                     //[00103] UPDPC_(UPDPCL,UPDPC) = FD1A(PCNT_4,CCLK);

/* Invert inputs as required */

assign CCLKL = ~CCLK;                                                           //[00024] CCLKL_(CCLKL) = N1A(CCLK);
assign IDSTWRL = ~IDSTWR;                                                       //[00025] IDSTWRL_(IDSTWRL) = N1A(IDSTWR);
assign RESETL = ~RESET;                                                         //[00026] RESETL_(RESETL) = N1A(RESET);
assign WAIT = ~WAITL;                                                           //[00027] WAITINV_(WAIT) = N1A(WAITL);

/* Decode next state */

assign CYCRQ = COMCRQ | PARCRQ | INCRQ;                                         //[00031] CRQGEN_(CYCRQ) = OR3A(COMCRQ,PARCRQ,INCRQ);

assign IMI_0 = ~(MIL_0 & CYCRQ & ACKINT);                                       //[00033] IMI_0_(IMI_0) = ND3A(MIL_0,CYCRQ,ACKINT);
assign IMI_1 = ~(MI_0 & WAIT);                                                  //[00034] IMI_1_(IMI_1) = ND2A(MI_0,WAIT);
assign IMI_2 = ~(IMI_0 & IMI_1);                                                //[00035] IMI_2_(IMI_2) = ND2B(IMI_0,IMI_1);
assign IMI_3 = ~IMI_2;                                                          //[00036] IMI_3_(IMI_3) = N1A(IMI_2);

/* The state latches */

FD2A MILATCH_0__inst (.q(MI_0),.qL(MIL_0),.d(IMI_2),.clk(CCLK),.rL(RESETL));    //[00040] MILATCH_0_(MI_0,MIL_0) = FD2A(IMI_2,CCLK,RESETL);
FD2A MILATCH_1__inst (.q(MI_1),.qL(MIL_1),.d(MI_0),.clk(CCLK),.rL(RESETL));     //[00041] MILATCH_1_(MI_1,MIL_1) = FD2A(MI_0,CCLK,RESETL);

/* Decodes from state */

/* mreq is given by T1 or TW, unless the cycle is a destination write and
inhibit is active, in which case it is suppressed.  This allows the two
tick timing of the memory interface to still be used during inhibited
writes to update addresses
	mreq = mi[0] . /(dstwr . inhib) */

assign MREQT_0 = ~(IDSTWR & INHIB);                                             //[00051] MREQT_0_(MREQT_0) = ND2A(IDSTWR,INHIB);
assign MREQT_1 = ~(IMI_2 & MREQT_0);                                            //[00052] MREQT_1_(MREQT_1) = ND2A(IMI_2,MREQT_0);
FD1A MREQT_2__inst (.q(BMREQL),.qL(BMREQ),.d(MREQT_1),.clk(CCLK));              //[00053] MREQT_2_(BMREQL,BMREQ) = FD1A(MREQT_1,CCLK);

/* rd and wr are active in T1, TW and T2.  Do these by synchronous decode
   rd = (mi[0] + mi[1]) . /idstwr
   wr = (mi[0] + mi[1]) . idstwr . /inhib */
assign RWT_0 = ~(IMI_2 | MI_0);                                                 //[00058] RWT_0_(RWT_0) = NR2A(IMI_2,MI_0);
assign RWT_1 = ~(RWT_0 | IDSTWR);                                               //[00059] RWT_1_(RWT_1) = NR2A(RWT_0,IDSTWR);
assign RWT_2 = ~(RWT_0 | IDSTWRL | INHIB);                                      //[00060] RWT_2_(RWT_2) = NR3A(RWT_0,IDSTWRL,INHIB);
FD1A RDFF__inst (.q(BRD),.qL(BRDL),.d(RWT_1),.clk(CCLK));                       //[00061] RDFF_(BRD,BRDL) = FD1A(RWT_1,CCLK);
FD1A WRFF__inst (.q(BWR),.qL(BWRL),.d(RWT_2),.clk(CCLK));                       //[00062] WRFF_(BWR,BWRL) = FD1A(RWT_2,CCLK);

/* word is active throughout the cycle for an inner loop generated memory
cycle when word resolution is set
	word := word . /cycend
	      + icycst . incrq . res[0] . res[1] */

assign WRDT_0 = ~(BWORD & CYCENDL);                                             //[00069] WRDT_0_(WRDT_0) = ND2A(BWORD,CYCENDL);
assign WRDT_1 = ~(ICYCST & INCRQ & RES_0 & RES_1);                              //[00070] WRDT_1_(WRDT_1) = ND4A(ICYCST,INCRQ,RES_0,RES_1);
assign WRDT_2 = ~(WRDT_0 & WRDT_1);                                             //[00071] WRDT_2_(WRDT_2) = ND2A(WRDT_0,WRDT_1);
FD2A WRDT_3__inst (.q(BWORD),.qL(BWORDL),.d(WRDT_2),.clk(CCLK),.rL(RESETL));    //[00072] WRDT_3_(BWORD,BWORDL) = FD2A(WRDT_2,CCLK,RESETL);

/* Cycle positions */

assign CYCEND = ~(MIL_1 | MI_0);                                                //[00076] CYCEGEN_(CYCEND) = NR2C(MIL_1,MI_0);
assign CYCENDL = ~CYCEND;                                                       //[00077] CYCENDL_(CYCENDL) = N1A(CYCEND);
assign CYCST = ~(MI_1 | MIL_0);                                                 //[00078] CYCSGEN_(CYCST) = NR2A(MI_1,MIL_0);
assign ICYCEND = ~(MIL_0 | IMI_2);                                              //[00079] ICYCEGEN_(ICYCEND) = NR2C(MIL_0,IMI_2);
assign ICYCENDL = ~ICYCEND;                                                     //[00080] ICYCENDL_(ICYCENDL) = N1A(ICYCEND);
assign ICYCST = ~(IMI_3 | MI_0);                                                //[00081] ICYCSTGEN_(ICYCST) = NR2C(IMI_3,MI_0);
assign INCYCL = ~(MI_0 | MI_1);                                                 //[00082] INCYCGEN_(INCYCL) = NR2A(MI_0,MI_1);

/* Internal data output enable is given by wr, however data is not enabled
for the first half tick of a write cycle  */

FD1A IWRD__inst (.q(IWRD),.qL(IWRDL),.d(BWR),.clk(CCLKL));                      //[00087] IWRD_(IWRD,IWRDL) = FD1A(BWR,CCLKL);
assign DATOEL = ~(BWR & IWRD);                                                  //[00088] DATOEL_(DATOEL) = ND2A(BWR,IWRD);

/* Blitter program address is enabled for a cycle requiested by comcrq or
parcrq, and the blitter program address is updated during the last cycle of
one of these memory cycles.
	pcen := pcen . /cycend
	       +icycst . (comcrq + parcrq) */

assign PCNT_0 = COMCRQ | PARCRQ;                                                //[00096] PCNT_0_(PCNT_0) = OR2A(COMCRQ,PARCRQ);
assign PCNT_1 = ~(ICYCST & PCNT_0);                                             //[00097] PCNT_1_(PCNT_1) = ND2A(ICYCST,PCNT_0);
assign PCNT_2 = ~(PCEN & CYCENDL);                                              //[00098] PCNT_2_(PCNT_2) = ND2A(PCEN,CYCENDL);
assign PCNT_3 = ~(PCNT_1 & PCNT_2);                                             //[00099] PCNT_3_(PCNT_3) = ND2A(PCNT_1,PCNT_2);
FD2A PCEN__inst (.q(PCEN),.qL(PCENL),.d(PCNT_3),.clk(CCLK),.rL(RESETL));        //[00100] PCEN_(PCEN,PCENL) = FD2A(PCNT_3,CCLK,RESETL);

assign PCNT_4 = ~(PCEN & ICYCEND);                                              //[00102] PCNT_4_(PCNT_4) = ND2A(PCEN,ICYCEND);
FD1A UPDPC__inst (.q(UPDPCL),.qL(UPDPC),.d(PCNT_4),.clk(CCLK));                 //[00103] UPDPC_(UPDPCL,UPDPC) = FD1A(PCNT_4,CCLK);

endmodule                                                                       //[00105] END MODULE;