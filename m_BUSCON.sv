                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
buscon
20/10/88

Bus Control and IO decoding

****************************************************************************/

module m_BUSCON                                                                 //[00012] MODULE BUSCON;
(                                                                               //[00012] MODULE BUSCON;

    input    inD_0,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    inD_3,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    inD_4,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    inD_5,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    inD_6,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    inD_7,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    A_0,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    A_1,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    A_2,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    A_3,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    A_4,                                                               //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    BCSL,                                                              //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    HLDAL,                                                             //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    DSPBRQL,                                                           //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    ID_0,                                                              //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    INTL,                                                              //[00014] INPUTS	D_0,D_3,D_4,D_5,D_6,D_7,A_0,A_1,A_2,A_3,A_4,BCSL,HLDAL,DSPBRQL,ID_0,INTL,
    input    IORDL,                                                             //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    input    IOWRL,                                                             //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    input    INCYCL,                                                            //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    input    RESET,                                                             //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    input    RUN,                                                               //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    input    STOP,                                                              //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
                                                                                //[00015]    IORDL,IOWRL,INCYCL,RESET,RUN,STOP;
    output    outD_0,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    outD_3,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    outD_4,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    outD_5,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    outD_6,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    outD_7,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_0,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_3,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_4,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_5,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_6,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    enD_7,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    ACKINT,                                                           //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    BHOLDL,                                                           //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    BUSOE,                                                            //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    CMDWRL,                                                           //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    CONWRL,                                                           //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    DSPBAKL,                                                          //[00016] OUTPUTS	D_0,D_3,D_4,D_5,D_6,D_7,ACKINT,BHOLDL,BUSOE,CMDWRL,CONWRL,DSPBAKL,
    output    DSTRDL_0,                                                         //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    DSTRDL_1,                                                         //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    DSTRDL_2,                                                         //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    INCRDL,                                                           //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    OUTCRDL,                                                          //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    PCWRL_0,                                                          //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    PCWRL_1,                                                          //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    PCWRL_2,                                                          //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    SRCRDL_0,                                                         //[00017]    DSTRDL_0,DSTRDL_1,DSTRDL_2,INCRDL,OUTCRDL,PCWRL_0,PCWRL_1,PCWRL_2,SRCRDL_0,
    output    SRCRDL_1,                                                         //[00018]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL;
    output    SRCRDL_2,                                                         //[00018]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL;
    output    STRD,                                                             //[00018]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL;
    output    TESTWRL                                                           //[00018]    SRCRDL_1,SRCRDL_2,STRD,TESTWRL;
);                                                                              //[00012] MODULE BUSCON;
                                                                                //[00019] LEVEL FUNCTION;
wire INCYC;                                                                     //[00022] INCYCINV_(INCYC) = N1A(INCYCL);
wire DSPBRQ;                                                                    //[00023] DSPBRQINV_(DSPBRQ) = N1A(DSPBRQL);
wire RESETL;                                                                    //[00024] RESETL_(RESETL) = N1A(RESET);
wire STOPL;                                                                     //[00025] STOPL_(STOPL) = N1A(STOP);
wire BUSREQL;                                                                   //[00030] BUSREQL_(BUSREQL) = ND2A(RUN,STOPL);
wire BUSREQ;                                                                    //[00031] BUSREQ_(BUSREQ) = N1A(BUSREQL);
wire IMASK;                                                                     //[00035] FINT_(FINT) = NR2A(INTL,IMASK);
wire FINT;                                                                      //[00035] FINT_(FINT) = NR2A(INTL,IMASK);
wire FINTL;                                                                     //[00036] FINTL_(FINTL) = N1A(FINT);
wire CBRQT;                                                                     //[00040] CBRQT_(CBRQT) = ND2A(FINTL,BUSREQ);
wire DSPBAK;                                                                    //[00045] DBAGEN_(DSPBAK) = NR3A(DSPBRQL,HLDAL,INCYC);
wire AL_0;                                                                      //[00079] AINV_0_(AL_0) = N1B(A_0);
wire AL_1;                                                                      //[00080] AINV_1_(AL_1) = N1B(A_1);
wire AL_2;                                                                      //[00081] AINV_2_(AL_2) = N1B(A_2);
wire AL_3;                                                                      //[00082] AINV_3_(AL_3) = N1B(A_3);
wire AL_4;                                                                      //[00083] AINV_4_(AL_4) = N1B(A_4);
wire BRD;                                                                       //[00084] BRD_(BRD) = NR2A(BCSL,IORDL);
wire BWR;                                                                       //[00085] BWR_(BWR) = NR2C(BCSL,IOWRL);
wire STRDL;                                                                     //[00093] STRDL_(STRDL) = ND6A(AL_0,A_1,A_2,AL_3,AL_4,BRD);
wire OUTCRDT;                                                                   //[00095] OUTCRDT_(OUTCRDT) = ND2A(AL_3,AL_4);
wire PCWRTL_0;                                                                  //[00098] PCWRTL_0_(PCWRTL_0) = ND6A(AL_0,AL_1,AL_2,AL_3,A_4,BWR);
wire PCWRTL_1;                                                                  //[00099] PCWRTL_1_(PCWRTL_1) = ND6A(A_0,AL_1,AL_2,AL_3,A_4,BWR);
wire PCWRTL_2;                                                                  //[00100] PCWRTL_2_(PCWRTL_2) = ND6A(AL_0,A_1,AL_2,AL_3,A_4,BWR);
wire CONWRTL;                                                                   //[00106] CONWRTL_(CONWRTL) = ND6A(AL_0,AL_1,A_2,AL_3,A_4,BWR);
wire TESTWRTL;                                                                  //[00109] TESTWRTL_(TESTWRTL) = ND6A(A_0,A_1,A_2,A_3,A_4,BWR);
wire ISTOPL;                                                                    //[00118] ISTOPL_(ISTOPL) = ND3A(RUN,FINT,BHOLDL);
wire IMASKL;                                                                    //[00130] IMASK_(IMASK,IMASKL) = LD2A(ID_0,CONWRL);

assign INCYC = ~INCYCL;                                                         //[00022] INCYCINV_(INCYC) = N1A(INCYCL);
assign DSPBRQ = ~DSPBRQL;                                                       //[00023] DSPBRQINV_(DSPBRQ) = N1A(DSPBRQL);
assign RESETL = ~RESET;                                                         //[00024] RESETL_(RESETL) = N1A(RESET);
assign STOPL = ~STOP;                                                           //[00025] STOPL_(STOPL) = N1A(STOP);

/* Internal bus reques busreq occurs as soon as the run bit is set, and
is disabled if the inner loop goes into its stop state */

assign BUSREQL = ~(RUN & STOPL);                                                //[00030] BUSREQL_(BUSREQL) = ND2A(RUN,STOPL);
assign BUSREQ = ~BUSREQL;                                                       //[00031] BUSREQ_(BUSREQ) = N1A(BUSREQL);

/* Interrupts are filtered by the imask flag */

assign FINT = ~(INTL | IMASK);                                                  //[00035] FINT_(FINT) = NR2A(INTL,IMASK);
assign FINTL = ~FINT;                                                           //[00036] FINTL_(FINTL) = N1A(FINT);

/* CPU Bus Request */

assign CBRQT = ~(FINTL & BUSREQ);                                               //[00040] CBRQT_(CBRQT) = ND2A(FINTL,BUSREQ);
assign BHOLDL = DSPBRQL & INCYCL & CBRQT;                                       //[00041] CBRQGEN_(BHOLDL) = AND3A(DSPBRQL,INCYCL,CBRQT);

/* DSP Bus Acknowledge */

assign DSPBAK = ~(DSPBRQL | HLDAL | INCYC);                                     //[00045] DBAGEN_(DSPBAK) = NR3A(DSPBRQL,HLDAL,INCYC);
assign DSPBAKL = ~DSPBAK;                                                       //[00046] DSPBAKL_(DSPBAKL) = N1C(DSPBAK);

/* Internal Acknowledge */

assign ACKINT = ~(DSPBRQ | HLDAL | FINT | BUSREQL);                             //[00050] IAKGEN_(ACKINT) = NR4A(DSPBRQ,HLDAL,FINT,BUSREQL);

/* The address is enabled onto the bus whenever a hold acknowlwdge is
received (even if not requested!), unless the DSP owns the bus.  This
is given by:
	busoe = hlda . /dspbak  */

assign BUSOE = ~(HLDAL | DSPBAK);                                               //[00057] BUSOE_(BUSOE) = NR2C(HLDAL,DSPBAK);

/* IO Decoding
Blitter IO is given by a chip select signal bcsL, and iordL and iowrL
control lines.  The blitter has 32 IO locations available to it, not
all of which are used.  So that there are no un-acknowledged locations,
which would leave the bus undriven, the outer counter address decode
is expanded to fill the available IO space.
	A43210
	 00000	Destination byte 0 read / Program byte 0 write
	 00001	Destination byte 1 read / Program byte 1 write
	 00010	Destination byte 2 read / Program byte 2 write
	 00011	Source byte 0 read / Command register write
	 00100	Source byte 1 read / Control register write
	 00101	Source byte 2 read
	 00110	Status read
	 00111	Inner counter read
	 x1xxx }Outer counter read
	 1xxxx }
	 11111	Test mode register write (used at top level)
*/

assign AL_0 = ~A_0;                                                             //[00079] AINV_0_(AL_0) = N1B(A_0);
assign AL_1 = ~A_1;                                                             //[00080] AINV_1_(AL_1) = N1B(A_1);
assign AL_2 = ~A_2;                                                             //[00081] AINV_2_(AL_2) = N1B(A_2);
assign AL_3 = ~A_3;                                                             //[00082] AINV_3_(AL_3) = N1B(A_3);
assign AL_4 = ~A_4;                                                             //[00083] AINV_4_(AL_4) = N1B(A_4);
assign BRD = ~(BCSL | IORDL);                                                   //[00084] BRD_(BRD) = NR2A(BCSL,IORDL);
assign BWR = ~(BCSL | IOWRL);                                                   //[00085] BWR_(BWR) = NR2C(BCSL,IOWRL);

assign DSTRDL_0 = ~(AL_0 & AL_1 & AL_2 & AL_3 & AL_4 & BRD);                    //[00087] DSTRDL_0_(DSTRDL_0) = ND6A(AL_0,AL_1,AL_2,AL_3,AL_4,BRD);
assign DSTRDL_1 = ~(A_0 & AL_1 & AL_2 & AL_3 & AL_4 & BRD);                     //[00088] DSTRDL_1_(DSTRDL_1) = ND6A(A_0,AL_1,AL_2,AL_3,AL_4,BRD);
assign DSTRDL_2 = ~(AL_0 & A_1 & AL_2 & AL_3 & AL_4 & BRD);                     //[00089] DSTRDL_2_(DSTRDL_2) = ND6A(AL_0,A_1,AL_2,AL_3,AL_4,BRD);
assign SRCRDL_0 = ~(A_0 & A_1 & AL_2 & AL_3 & AL_4 & BRD);                      //[00090] SRCRDL_0_(SRCRDL_0) = ND6A(A_0,A_1,AL_2,AL_3,AL_4,BRD);
assign SRCRDL_1 = ~(AL_0 & AL_1 & A_2 & AL_3 & AL_4 & BRD);                     //[00091] SRCRDL_1_(SRCRDL_1) = ND6A(AL_0,AL_1,A_2,AL_3,AL_4,BRD);
assign SRCRDL_2 = ~(A_0 & AL_1 & A_2 & AL_3 & AL_4 & BRD);                      //[00092] SRCRDL_2_(SRCRDL_2) = ND6A(A_0,AL_1,A_2,AL_3,AL_4,BRD);
assign STRDL = ~(AL_0 & A_1 & A_2 & AL_3 & AL_4 & BRD);                         //[00093] STRDL_(STRDL) = ND6A(AL_0,A_1,A_2,AL_3,AL_4,BRD);
assign INCRDL = ~(A_0 & A_1 & A_2 & AL_3 & AL_4 & BRD);                         //[00094] INCRDL_(INCRDL) = ND6A(A_0,A_1,A_2,AL_3,AL_4,BRD);
assign OUTCRDT = ~(AL_3 & AL_4);                                                //[00095] OUTCRDT_(OUTCRDT) = ND2A(AL_3,AL_4);
assign OUTCRDL = ~(OUTCRDT & BRD);                                              //[00096] OUTCRDL_(OUTCRDL) = ND2A(OUTCRDT,BRD);

assign PCWRTL_0 = ~(AL_0 & AL_1 & AL_2 & AL_3 & A_4 & BWR);                     //[00098] PCWRTL_0_(PCWRTL_0) = ND6A(AL_0,AL_1,AL_2,AL_3,A_4,BWR);
assign PCWRTL_1 = ~(A_0 & AL_1 & AL_2 & AL_3 & A_4 & BWR);                      //[00099] PCWRTL_1_(PCWRTL_1) = ND6A(A_0,AL_1,AL_2,AL_3,A_4,BWR);
assign PCWRTL_2 = ~(AL_0 & A_1 & AL_2 & AL_3 & A_4 & BWR);                      //[00100] PCWRTL_2_(PCWRTL_2) = ND6A(AL_0,A_1,AL_2,AL_3,A_4,BWR);
assign PCWRL_0 = PCWRTL_0 & RESETL;                                             //[00101] PCWRL_0_(PCWRL_0) = AND2A(PCWRTL_0,RESETL);
assign PCWRL_1 = PCWRTL_1 & RESETL;                                             //[00102] PCWRL_1_(PCWRL_1) = AND2A(PCWRTL_1,RESETL);
assign PCWRL_2 = PCWRTL_2 & RESETL;                                             //[00103] PCWRL_2_(PCWRL_2) = AND2A(PCWRTL_2,RESETL);

assign CMDWRL = ~(A_0 & A_1 & AL_2 & AL_3 & A_4 & BWR);                         //[00105] CMDWRL_(CMDWRL) = ND6C(A_0,A_1,AL_2,AL_3,A_4,BWR);
assign CONWRTL = ~(AL_0 & AL_1 & A_2 & AL_3 & A_4 & BWR);                       //[00106] CONWRTL_(CONWRTL) = ND6A(AL_0,AL_1,A_2,AL_3,A_4,BWR);
assign CONWRL = CONWRTL & RESETL;                                               //[00107] CONWRL_(CONWRL) = AND2A(CONWRTL,RESETL);

assign TESTWRTL = ~(A_0 & A_1 & A_2 & A_3 & A_4 & BWR);                         //[00109] TESTWRTL_(TESTWRTL) = ND6A(A_0,A_1,A_2,A_3,A_4,BWR);
assign TESTWRL = TESTWRTL & RESETL;                                             //[00110] TESTWRL_(TESTWRL) = AND2A(TESTWRTL,RESETL);

/* The blitter status read port (part of) */

assign STRD = ~STRDL;                                                           //[00114] STRD_(STRD) = N1A(STRDL);

/* Interrupt stop is true if run is active, int is active and bus hold
is inactive */
assign ISTOPL = ~(RUN & FINT & BHOLDL);                                         //[00118] ISTOPL_(ISTOPL) = ND3A(RUN,FINT,BHOLDL);
assign outD_0 = ~ISTOPL;                                           //[00119] STAT_0_(D_0) = BTS5A(ISTOPL,STRD);
assign enD_0 = STRD;                                           //[00119] STAT_0_(D_0) = BTS5A(ISTOPL,STRD);

assign outD_3 = (~STRD);                                             //[00121] STAT_3_(D_3) = BTS5A(STRD,STRD);
assign outD_4 = (~STRD);                                             //[00122] STAT_4_(D_4) = BTS5A(STRD,STRD);
assign outD_5 = (~STRD);                                             //[00123] STAT_5_(D_5) = BTS5A(STRD,STRD);
assign outD_6 = (~STRD);                                             //[00124] STAT_6_(D_6) = BTS5A(STRD,STRD);
assign outD_7 = (~STRD);                                             //[00125] STAT_7_(D_7) = BTS5A(STRD,STRD);
assign enD_3 = STRD;                                             //[00121] STAT_3_(D_3) = BTS5A(STRD,STRD);
assign enD_4 = STRD;                                             //[00122] STAT_4_(D_4) = BTS5A(STRD,STRD);
assign enD_5 = STRD;                                             //[00123] STAT_5_(D_5) = BTS5A(STRD,STRD);
assign enD_6 = STRD;                                             //[00124] STAT_6_(D_6) = BTS5A(STRD,STRD);
assign enD_7 = STRD;                                             //[00125] STAT_7_(D_7) = BTS5A(STRD,STRD);

/* The blitter control register.  The remainder of this register lies
within the state block */

LD2A IMASK__inst (.q(IMASK),.qL(IMASKL),.d(ID_0),.en(CONWRL));                  //[00130] IMASK_(IMASK,IMASKL) = LD2A(ID_0,CONWRL);

endmodule                                                                       //[00132] END MODULE;