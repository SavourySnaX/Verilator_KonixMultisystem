                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
innercnt
15/10/88

Blitter operation inner loop length counter

This a a synchronous down counter, with a register containing the programmed
value so that the counter could be reloaded.

****************************************************************************/

module m_INNERCNT                                                               //[00015] MODULE INNERCNT;
(                                                                               //[00015] MODULE INNERCNT;

    input    CCLK,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_0,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_1,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_2,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_3,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_4,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_5,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_6,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    ID_7,                                                              //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    LDINRL,                                                            //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    LDMODL,                                                            //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    LDICNTL,                                                           //[00017] INPUTS	CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,LDMODL,LDICNTL,
    input    INCLKL,                                                            //[00018]    INCLKL,RESET;
    input    RESET,                                                             //[00018]    INCLKL,RESET;
                                                                                //[00018]    INCLKL,RESET;
    output    INNER0,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_0,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_1,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_2,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_3,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_4,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_5,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_6,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_7,                                                           //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
    output    ICNT_8                                                            //[00019] OUTPUTS	INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,ICNT_8;
);                                                                              //[00015] MODULE INNERCNT;
                                                                                //[00020] LEVEL FUNCTION;
wire CCLKL;                                                                     //[00023] CCLKL_(CCLKL) = N1A(CCLK);
wire RESETL;                                                                    //[00024] RESETL_(RESETL) = N1A(RESET);
wire ICVAL_0;                                                                   //[00028] ICNTR_0_(ICVAL_0,ICVALL_0) = LD2A(ID_0,LDINRL);
wire ICVALL_0;                                                                  //[00028] ICNTR_0_(ICVAL_0,ICVALL_0) = LD2A(ID_0,LDINRL);
wire ICVAL_1;                                                                   //[00029] ICNTR_1_(ICVAL_1,ICVALL_1) = LD2A(ID_1,LDINRL);
wire ICVALL_1;                                                                  //[00029] ICNTR_1_(ICVAL_1,ICVALL_1) = LD2A(ID_1,LDINRL);
wire ICVAL_2;                                                                   //[00030] ICNTR_2_(ICVAL_2,ICVALL_2) = LD2A(ID_2,LDINRL);
wire ICVALL_2;                                                                  //[00030] ICNTR_2_(ICVAL_2,ICVALL_2) = LD2A(ID_2,LDINRL);
wire ICVAL_3;                                                                   //[00031] ICNTR_3_(ICVAL_3,ICVALL_3) = LD2A(ID_3,LDINRL);
wire ICVALL_3;                                                                  //[00031] ICNTR_3_(ICVAL_3,ICVALL_3) = LD2A(ID_3,LDINRL);
wire ICVAL_4;                                                                   //[00032] ICNTR_4_(ICVAL_4,ICVALL_4) = LD2A(ID_4,LDINRL);
wire ICVALL_4;                                                                  //[00032] ICNTR_4_(ICVAL_4,ICVALL_4) = LD2A(ID_4,LDINRL);
wire ICVAL_5;                                                                   //[00033] ICNTR_5_(ICVAL_5,ICVALL_5) = LD2A(ID_5,LDINRL);
wire ICVALL_5;                                                                  //[00033] ICNTR_5_(ICVAL_5,ICVALL_5) = LD2A(ID_5,LDINRL);
wire ICVAL_6;                                                                   //[00034] ICNTR_6_(ICVAL_6,ICVALL_6) = LD2A(ID_6,LDINRL);
wire ICVALL_6;                                                                  //[00034] ICNTR_6_(ICVAL_6,ICVALL_6) = LD2A(ID_6,LDINRL);
wire ICVAL_7;                                                                   //[00035] ICNTR_7_(ICVAL_7,ICVALL_7) = LD2A(ID_7,LDINRL);
wire ICVALL_7;                                                                  //[00035] ICNTR_7_(ICVAL_7,ICVALL_7) = LD2A(ID_7,LDINRL);
wire ICVAL_8;                                                                   //[00036] ICNTR_8_(ICVAL_8,ICVALL_8) = LD2A(ID_1,LDMODL);
wire ICVALL_8;                                                                  //[00036] ICNTR_8_(ICVAL_8,ICVALL_8) = LD2A(ID_1,LDMODL);
wire LDICNTDL;                                                                  //[00044] LDICNTD_(LDICNTDL,LDICNTD) = FD1A(LDICNTL,CCLKL);
wire LDICNTD;                                                                   //[00044] LDICNTD_(LDICNTDL,LDICNTD) = FD1A(LDICNTL,CCLKL);
wire LDICLKL;                                                                   //[00045] LDICLK_(LDICLKL) = OR2A(LDICNTL,LDICNTD);
wire ICLKL;                                                                     //[00049] ICLKL_(ICLKL) = AND2A(INCLKL,LDICLKL);
wire LDICNT;                                                                    //[00053] LDIINV_(LDICNT) = N1A(LDICNTL);
wire ICNTL_0;                                                                   //[00054] ICNT_0_(ICNT_0,ICNTL_0,CARRY_0) = LSCNTEL(ICVAL_0,LDICNT,LDICNTL,ICLKL,RESET,
wire CARRY_0;                                                                   //[00054] ICNT_0_(ICNT_0,ICNTL_0,CARRY_0) = LSCNTEL(ICVAL_0,LDICNT,LDICNTL,ICLKL,RESET,
wire ICNTL_1;                                                                   //[00056] ICNT_1_(ICNT_1,ICNTL_1,CARRY_1) = LSCNTEL(ICVAL_1,LDICNT,LDICNTL,ICLKL,CARRY_0,
wire CARRY_1;                                                                   //[00056] ICNT_1_(ICNT_1,ICNTL_1,CARRY_1) = LSCNTEL(ICVAL_1,LDICNT,LDICNTL,ICLKL,CARRY_0,
wire ICNTL_2;                                                                   //[00058] ICNT_2_(ICNT_2,ICNTL_2,CARRY_2) = LSCNTEL(ICVAL_2,LDICNT,LDICNTL,ICLKL,CARRY_1,
wire CARRY_2;                                                                   //[00058] ICNT_2_(ICNT_2,ICNTL_2,CARRY_2) = LSCNTEL(ICVAL_2,LDICNT,LDICNTL,ICLKL,CARRY_1,
wire ICNTL_3;                                                                   //[00060] ICNT_3_(ICNT_3,ICNTL_3,CARRY_3) = LSCNTEL(ICVAL_3,LDICNT,LDICNTL,ICLKL,CARRY_2,
wire CARRY_3;                                                                   //[00060] ICNT_3_(ICNT_3,ICNTL_3,CARRY_3) = LSCNTEL(ICVAL_3,LDICNT,LDICNTL,ICLKL,CARRY_2,
wire ICNTL_4;                                                                   //[00062] ICNT_4_(ICNT_4,ICNTL_4,CARRY_4) = LSCNTEL(ICVAL_4,LDICNT,LDICNTL,ICLKL,CARRY_3,
wire CARRY_4;                                                                   //[00062] ICNT_4_(ICNT_4,ICNTL_4,CARRY_4) = LSCNTEL(ICVAL_4,LDICNT,LDICNTL,ICLKL,CARRY_3,
wire ICNTL_5;                                                                   //[00064] ICNT_5_(ICNT_5,ICNTL_5,CARRY_5) = LSCNTEL(ICVAL_5,LDICNT,LDICNTL,ICLKL,CARRY_4,
wire CARRY_5;                                                                   //[00064] ICNT_5_(ICNT_5,ICNTL_5,CARRY_5) = LSCNTEL(ICVAL_5,LDICNT,LDICNTL,ICLKL,CARRY_4,
wire ICNTL_6;                                                                   //[00066] ICNT_6_(ICNT_6,ICNTL_6,CARRY_6) = LSCNTEL(ICVAL_6,LDICNT,LDICNTL,ICLKL,CARRY_5,
wire CARRY_6;                                                                   //[00066] ICNT_6_(ICNT_6,ICNTL_6,CARRY_6) = LSCNTEL(ICVAL_6,LDICNT,LDICNTL,ICLKL,CARRY_5,
wire ICNTL_7;                                                                   //[00068] ICNT_7_(ICNT_7,ICNTL_7,CARRY_7) = LSCNTEL(ICVAL_7,LDICNT,LDICNTL,ICLKL,CARRY_6,
wire CARRY_7;                                                                   //[00068] ICNT_7_(ICNT_7,ICNTL_7,CARRY_7) = LSCNTEL(ICVAL_7,LDICNT,LDICNTL,ICLKL,CARRY_6,
wire ICNTL_8;                                                                   //[00070] ICNT_8_(ICNT_8,ICNTL_8,CARRY_8) = LSCNTEL(ICVAL_8,LDICNT,LDICNTL,ICLKL,CARRY_7,
wire CARRY_8;                                                                   //[00070] ICNT_8_(ICNT_8,ICNTL_8,CARRY_8) = LSCNTEL(ICVAL_8,LDICNT,LDICNTL,ICLKL,CARRY_7,
wire IN0T;                                                                      //[00075] IN0T_(IN0T) = NR2A(ICNT_0,ICNT_1);
wire INNER0L;                                                                   //[00076] IN0GEN_(INNER0L) = ND8A(IN0T,ICNTL_2,ICNTL_3,ICNTL_4,ICNTL_5,ICNTL_6,ICNTL_7,

assign CCLKL = ~CCLK;                                                           //[00023] CCLKL_(CCLKL) = N1A(CCLK);
assign RESETL = ~RESET;                                                         //[00024] RESETL_(RESETL) = N1A(RESET);

/* The Inner count value register */

LD2A ICNTR_0__inst (.q(ICVAL_0),.qL(ICVALL_0),.d(ID_0),.en(LDINRL));            //[00028] ICNTR_0_(ICVAL_0,ICVALL_0) = LD2A(ID_0,LDINRL);
LD2A ICNTR_1__inst (.q(ICVAL_1),.qL(ICVALL_1),.d(ID_1),.en(LDINRL));            //[00029] ICNTR_1_(ICVAL_1,ICVALL_1) = LD2A(ID_1,LDINRL);
LD2A ICNTR_2__inst (.q(ICVAL_2),.qL(ICVALL_2),.d(ID_2),.en(LDINRL));            //[00030] ICNTR_2_(ICVAL_2,ICVALL_2) = LD2A(ID_2,LDINRL);
LD2A ICNTR_3__inst (.q(ICVAL_3),.qL(ICVALL_3),.d(ID_3),.en(LDINRL));            //[00031] ICNTR_3_(ICVAL_3,ICVALL_3) = LD2A(ID_3,LDINRL);
LD2A ICNTR_4__inst (.q(ICVAL_4),.qL(ICVALL_4),.d(ID_4),.en(LDINRL));            //[00032] ICNTR_4_(ICVAL_4,ICVALL_4) = LD2A(ID_4,LDINRL);
LD2A ICNTR_5__inst (.q(ICVAL_5),.qL(ICVALL_5),.d(ID_5),.en(LDINRL));            //[00033] ICNTR_5_(ICVAL_5,ICVALL_5) = LD2A(ID_5,LDINRL);
LD2A ICNTR_6__inst (.q(ICVAL_6),.qL(ICVALL_6),.d(ID_6),.en(LDINRL));            //[00034] ICNTR_6_(ICVAL_6,ICVALL_6) = LD2A(ID_6,LDINRL);
LD2A ICNTR_7__inst (.q(ICVAL_7),.qL(ICVALL_7),.d(ID_7),.en(LDINRL));            //[00035] ICNTR_7_(ICVAL_7,ICVALL_7) = LD2A(ID_7,LDINRL);
LD2A ICNTR_8__inst (.q(ICVAL_8),.qL(ICVALL_8),.d(ID_1),.en(LDMODL));            //[00036] ICNTR_8_(ICVAL_8,ICVALL_8) = LD2A(ID_1,LDMODL);

/* Inner counter load - as the inner counter is a synchronous counter
loaded in one tick it is necessary to synthesize a load clock which will
have a suitable rising edge within the load signal.  This is given by
producing a delayed version off the back edge of the clock and making
the clock active (low) only during the first half of the cycle */

FD1A LDICNTD__inst (.q(LDICNTDL),.qL(LDICNTD),.d(LDICNTL),.clk(CCLKL));         //[00044] LDICNTD_(LDICNTDL,LDICNTD) = FD1A(LDICNTL,CCLKL);
assign LDICLKL = LDICNTL | LDICNTD;                                             //[00045] LDICLK_(LDICLKL) = OR2A(LDICNTL,LDICNTD);

/* From this, the counter clock */

assign ICLKL = INCLKL & LDICLKL;                                                //[00049] ICLKL_(ICLKL) = AND2A(INCLKL,LDICLKL);

/* The Inner counter */

assign LDICNT = ~LDICNTL;                                                       //[00053] LDIINV_(LDICNT) = N1A(LDICNTL);
LSCNTEL ICNT_0__inst (.Q(ICNT_0),.QL(ICNTL_0),.CO(CARRY_0),.D(ICVAL_0),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(RESET),.RSTL(RESETL));//[00054] ICNT_0_(ICNT_0,ICNTL_0,CARRY_0) = LSCNTEL(ICVAL_0,LDICNT,LDICNTL,ICLKL,RESET,
                                                                                //[00055]    RESETL);
LSCNTEL ICNT_1__inst (.Q(ICNT_1),.QL(ICNTL_1),.CO(CARRY_1),.D(ICVAL_1),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_0),.RSTL(RESETL));//[00056] ICNT_1_(ICNT_1,ICNTL_1,CARRY_1) = LSCNTEL(ICVAL_1,LDICNT,LDICNTL,ICLKL,CARRY_0,
                                                                                //[00057]    RESETL);
LSCNTEL ICNT_2__inst (.Q(ICNT_2),.QL(ICNTL_2),.CO(CARRY_2),.D(ICVAL_2),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_1),.RSTL(RESETL));//[00058] ICNT_2_(ICNT_2,ICNTL_2,CARRY_2) = LSCNTEL(ICVAL_2,LDICNT,LDICNTL,ICLKL,CARRY_1,
                                                                                //[00059]    RESETL);
LSCNTEL ICNT_3__inst (.Q(ICNT_3),.QL(ICNTL_3),.CO(CARRY_3),.D(ICVAL_3),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_2),.RSTL(RESETL));//[00060] ICNT_3_(ICNT_3,ICNTL_3,CARRY_3) = LSCNTEL(ICVAL_3,LDICNT,LDICNTL,ICLKL,CARRY_2,
                                                                                //[00061]    RESETL);
LSCNTEL ICNT_4__inst (.Q(ICNT_4),.QL(ICNTL_4),.CO(CARRY_4),.D(ICVAL_4),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_3),.RSTL(RESETL));//[00062] ICNT_4_(ICNT_4,ICNTL_4,CARRY_4) = LSCNTEL(ICVAL_4,LDICNT,LDICNTL,ICLKL,CARRY_3,
                                                                                //[00063]    RESETL);
LSCNTEL ICNT_5__inst (.Q(ICNT_5),.QL(ICNTL_5),.CO(CARRY_5),.D(ICVAL_5),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_4),.RSTL(RESETL));//[00064] ICNT_5_(ICNT_5,ICNTL_5,CARRY_5) = LSCNTEL(ICVAL_5,LDICNT,LDICNTL,ICLKL,CARRY_4,
                                                                                //[00065]    RESETL);
LSCNTEL ICNT_6__inst (.Q(ICNT_6),.QL(ICNTL_6),.CO(CARRY_6),.D(ICVAL_6),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_5),.RSTL(RESETL));//[00066] ICNT_6_(ICNT_6,ICNTL_6,CARRY_6) = LSCNTEL(ICVAL_6,LDICNT,LDICNTL,ICLKL,CARRY_5,
                                                                                //[00067]    RESETL);
LSCNTEL ICNT_7__inst (.Q(ICNT_7),.QL(ICNTL_7),.CO(CARRY_7),.D(ICVAL_7),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_6),.RSTL(RESETL));//[00068] ICNT_7_(ICNT_7,ICNTL_7,CARRY_7) = LSCNTEL(ICVAL_7,LDICNT,LDICNTL,ICLKL,CARRY_6,
                                                                                //[00069]    RESETL);
LSCNTEL ICNT_8__inst (.Q(ICNT_8),.QL(ICNTL_8),.CO(CARRY_8),.D(ICVAL_8),.LD(LDICNT),.LDL(LDICNTL),.CLK(ICLKL),.CI(CARRY_7),.RSTL(RESETL));//[00070] ICNT_8_(ICNT_8,ICNTL_8,CARRY_8) = LSCNTEL(ICVAL_8,LDICNT,LDICNTL,ICLKL,CARRY_7,
                                                                                //[00071]    RESETL);

/* Generate Inner0 */

assign IN0T = ~(ICNT_0 | ICNT_1);                                               //[00075] IN0T_(IN0T) = NR2A(ICNT_0,ICNT_1);
assign INNER0L = ~(IN0T & ICNTL_2 & ICNTL_3 & ICNTL_4 & ICNTL_5 & ICNTL_6 & ICNTL_7 & ICNTL_8);//[00076] IN0GEN_(INNER0L) = ND8A(IN0T,ICNTL_2,ICNTL_3,ICNTL_4,ICNTL_5,ICNTL_6,ICNTL_7,
                                                                                //[00077]    ICNTL_8);
assign INNER0 = ~INNER0L;                                                       //[00078] INNER0_(INNER0) = N1A(INNER0L);

endmodule                                                                       //[00080] END MODULE;