                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	clock-hdl					*
*	3/11/88						*
********************************************************/

/*
This module is the clock generator in the SLIPSTREAM chip on the ACW
*/

module m_CLOCK                                                                  //[00015] MODULE CLOCK;
(                                                                               //[00015] MODULE CLOCK;

    input    MCK,                                                               //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    VRD,                                                               //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    VWR,                                                               //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    NTSC,                                                              //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    FAST,                                                              //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    TSTCLK,                                                            //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    input    LP,                                                                //[00017] INPUTS	MCK,VRD,VWR,NTSC,FAST,TSTCLK,LP;
    output    PCLKL,                                                            //[00018] OUTPUTS	PCLKL,CCLK,CHROMAL,DQCLK;
    output    CCLK,                                                             //[00018] OUTPUTS	PCLKL,CCLK,CHROMAL,DQCLK;
    output    CHROMAL,                                                          //[00018] OUTPUTS	PCLKL,CCLK,CHROMAL,DQCLK;
    output    DQCLK                                                             //[00018] OUTPUTS	PCLKL,CCLK,CHROMAL,DQCLK;
);                                                                              //[00015] MODULE CLOCK;
                                                                                //[00019] LEVEL FUNCTION;
wire MCKL;                                                                      //[00043] MCKL_(MCKL) = N1B(MCK);
wire CA;                                                                        //[00047] CAT_(CAT) = ND2A(CA,CB);
wire CB;                                                                        //[00047] CAT_(CAT) = ND2A(CA,CB);
wire CAT;                                                                       //[00047] CAT_(CAT) = ND2A(CA,CB);
wire CKRSTL;                                                                    //[00048] CA_(CA,CAL) = FD2A (CAT, MCK, CKRSTL);
wire CAL;                                                                       //[00048] CA_(CA,CAL) = FD2A (CAT, MCK, CKRSTL);
wire CBL;                                                                       //[00049] CB_(CB,CBL) = FD2A (CA, MCK, CKRSTL);
wire CAD;                                                                       //[00053] CAD_(CAD,CADL) = FD2A (CA, MCKL, CKRSTL);
wire CADL;                                                                      //[00053] CAD_(CAD,CADL) = FD2A (CA, MCKL, CKRSTL);
wire TCB;                                                                       //[00057] TCB_(TCB) = N1A (CBL);		/* helps match path delays */
wire CCLKT;                                                                     //[00058] CCLKT_(CCLKT) = ND2A (CA,TCB);
wire CCLKU;                                                                     //[00059] CCLKD_(CCLKU) = ND2A (CAD, CCLKT);
wire CCLK0L;                                                                    //[00061] CCLK0L_(CCLK0L) = N1A(CCLKU);	/* 4 inverter delay on CCLK */
wire CCLK0;                                                                     //[00062] CCLK0_(CCLK0) = N1A (CCLK0L);
wire CCLK1L;                                                                    //[00063] CCLK1L_(CCLK1L) = N1A(CCLK0);
wire CCLKD;                                                                     //[00064] CCLK1_(CCLKD) = N1A (CCLK1L);
wire CBD;                                                                       //[00068] CBD_(CBD,CBDL) = FD2A (CB, MCKL, CKRSTL);
wire CBDL;                                                                      //[00068] CBD_(CBD,CBDL) = FD2A (CB, MCKL, CKRSTL);
wire TCA;                                                                       //[00069] TCA_(TCA) = N1C (CAL);
wire DCLKD;                                                                     //[00070] DCLD_(DCLKD) = ND2C (CBD, TCA);
wire CPTCA;                                                                     //[00074] CPTCA_(CPTCA) = N1A (CAL);
wire CLK6;                                                                      //[00075] CLK6_(CLK6) = ND2A (CPTCA, CAD);
wire TSTCLKL;                                                                   //[00083] TSTCLKL_(TSTCLKL) = N1A(TSTCLK);
wire LPL;                                                                       //[00088] LPL_(LPL) = N1A(LP);
wire DCLKL;                                                                     //[00089] DCLK_(DCLKL) = AO2C(TSTCLK,LPL,TSTCLKL,DCLKD);
wire SLOW;                                                                      //[00094] SLOW_(SLOW) = N1A(FAST);
wire X;                                                                         //[00095] PCLKL_(PCLKL) = AO2A(FAST,X,SLOW,CLK6);
wire XL;                                                                        //[00100] X_(X,XL) = FD2A(XL,MCKL,CKRSTL);
wire YL;                                                                        //[00101] Y_(Y,YL) = FD2A(YL,XL,CKRSTL);
wire Y;                                                                         //[00101] Y_(Y,YL) = FD2A(YL,XL,CKRSTL);
wire D;                                                                         //[00105] SHIFT1_(AL,A) = FD4A(D,MCKL,CKRSTL);
wire AL;                                                                        //[00105] SHIFT1_(AL,A) = FD4A(D,MCKL,CKRSTL);
wire A;                                                                         //[00105] SHIFT1_(AL,A) = FD4A(D,MCKL,CKRSTL);
wire B;                                                                         //[00106] SHIFT2_(B,BL) = FD2A(A,MCKL,CKRSTL);
wire BL;                                                                        //[00106] SHIFT2_(B,BL) = FD2A(A,MCKL,CKRSTL);
wire C;                                                                         //[00107] SHIFT3_(C,CL) = FD2A(B,MCKL,CKRSTL);
wire CL;                                                                        //[00107] SHIFT3_(C,CL) = FD2A(B,MCKL,CKRSTL);
wire AD;                                                                        //[00112] AD_(AD,ADL) = FD2A(A,MCK,CKRSTL);
wire ADL;                                                                       //[00112] AD_(AD,ADL) = FD2A(A,MCK,CKRSTL);
wire Z;                                                                         //[00113] Z_(Z) = ND2A(A,AD);
wire PAL;                                                                       //[00117] PAL_(PAL) = N1A(NTSC);

/* Clock Generation

Clocks are produced from a divide by 3 shift register, thus

	  |    --  3 tick cycle  --     |

XTAL	__/^^^^\____/^^^^\____/^^^^\____/^^^^\____
CA	^^^\_________/^^^^^^^^^^^^^^^^^^^\________
CB	^^^^^^^^^^^^^\_________/^^^^^^^^^^^^^^^^^^
DCA	^^^^^^^^\_________/^^^^^^^^^^^^^^^^^^^\___
DCB	^^^^^^^^^^^^^^^^^^\_________/^^^^^^^^^^^^^
CCLK	____/^^^^\_________/^^^^\_________/^^^^\__
DQCLK	____/^^^^^^^^^\____/^^^^^^^^^\____/^^^^^^^

The two shift register terms, CA and CB are delayed with the inverse of
XTAL to give DCA and DCB.  From these decodes give CCLK and DQCLK.  Paths
are matched for delay on CCLK.  The DQCLK rising edge to CCLK rising edge
setup is given by using C strength gates in the DQCLK path, and by the
extra delay of the CCLK buffer.
*/

assign MCKL = ~MCK;                                                             //[00043] MCKL_(MCKL) = N1B(MCK);

/* divide by three shift register */

assign CAT = ~(CA & CB);                                                        //[00047] CAT_(CAT) = ND2A(CA,CB);
FD2A CA__inst (.q(CA),.qL(CAL),.d(CAT),.clk(MCK),.rL(CKRSTL));                  //[00048] CA_(CA,CAL) = FD2A (CAT, MCK, CKRSTL);
FD2A CB__inst (.q(CB),.qL(CBL),.d(CA),.clk(MCK),.rL(CKRSTL));                   //[00049] CB_(CB,CBL) = FD2A (CA, MCK, CKRSTL);

/* delayed version of CA for cclk generation */

FD2A CAD__inst (.q(CAD),.qL(CADL),.d(CA),.clk(MCKL),.rL(CKRSTL));               //[00053] CAD_(CAD,CADL) = FD2A (CA, MCKL, CKRSTL);

/* from this comes non-test cclk */

assign TCB = ~CBL;                                                              //[00057] TCB_(TCB) = N1A (CBL);		/* helps match path delays */
assign CCLKT = ~(CA & TCB);                                                     //[00058] CCLKT_(CCLKT) = ND2A (CA,TCB);
assign CCLKU = ~(CAD & CCLKT);                                                  //[00059] CCLKD_(CCLKU) = ND2A (CAD, CCLKT);

assign CCLK0L = ~CCLKU;                                                         //[00061] CCLK0L_(CCLK0L) = N1A(CCLKU);	/* 4 inverter delay on CCLK */
assign CCLK0 = ~CCLK0L;                                                         //[00062] CCLK0_(CCLK0) = N1A (CCLK0L);
assign CCLK1L = ~CCLK0;                                                         //[00063] CCLK1L_(CCLK1L) = N1A(CCLK0);
assign CCLKD = ~CCLK1L;                                                         //[00064] CCLK1_(CCLKD) = N1A (CCLK1L);

/* DSP pervy clock requires a delayed version of B */

FD2A CBD__inst (.q(CBD),.qL(CBDL),.d(CB),.clk(MCKL),.rL(CKRSTL));               //[00068] CBD_(CBD,CBDL) = FD2A (CB, MCKL, CKRSTL);
assign TCA = ~CAL;                                                              //[00069] TCA_(TCA) = N1C (CAL);
assign DCLKD = ~(CBD & TCA);                                                    //[00070] DCLD_(DCLKD) = ND2C (CBD, TCA);

/* CPU clock */

assign CPTCA = ~CAL;                                                            //[00074] CPTCA_(CPTCA) = N1A (CAL);
assign CLK6 = ~(CPTCA & CAD);                                                   //[00075] CLK6_(CLK6) = ND2A (CPTCA, CAD);

/* test reset is a combination of vrd and vwr */

assign CKRSTL = ~(VRD & VWR);                                                   //[00079] CKRSTL_(CKRSTL) = ND2A(VRD,VWR);

/* For test purposes the external clock is used internally */

assign TSTCLKL = ~TSTCLK;                                                       //[00083] TSTCLKL_(TSTCLKL) = N1A(TSTCLK);
assign CCLK = ~((TSTCLK & MCK)|(TSTCLKL & CCLKD));                              //[00084] CCLK_(CCLK) = AO2C(TSTCLK,MCK,TSTCLKL,CCLKD);

/* For test purposes the lp input is used */

assign LPL = ~LP;                                                               //[00088] LPL_(LPL) = N1A(LP);
assign DCLKL = ~((TSTCLK & LPL)|(TSTCLKL & DCLKD));                             //[00089] DCLK_(DCLKL) = AO2C(TSTCLK,LPL,TSTCLKL,DCLKD);
assign DQCLK = ~DCLKL;                                                           //[00090] DQCLK_(DQCLK) = B1A(DCLKL);

/* the processor clock is either 6Mhz or 9Mhz */

assign SLOW = ~FAST;                                                            //[00094] SLOW_(SLOW) = N1A(FAST);
assign PCLKL = ~((FAST & X)|(SLOW & CLK6));                                     //[00095] PCLKL_(PCLKL) = AO2A(FAST,X,SLOW,CLK6);

/* The colour subcarrier is either mck/4 for PAL or mck/5 for NTSC */
/* divide by four */

FD2A X__inst (.q(X),.qL(XL),.d(XL),.clk(MCKL),.rL(CKRSTL));                     //[00100] X_(X,XL) = FD2A(XL,MCKL,CKRSTL);
FD2A Y__inst (.q(Y),.qL(YL),.d(YL),.clk(XL),.rL(CKRSTL));                       //[00101] Y_(Y,YL) = FD2A(YL,XL,CKRSTL);

/* divide by five */

FD4A SHIFT1__inst (.q(AL),.qL(A),.d(D),.clk(MCKL),.sL(CKRSTL));                 //[00105] SHIFT1_(AL,A) = FD4A(D,MCKL,CKRSTL);
FD2A SHIFT2__inst (.q(B),.qL(BL),.d(A),.clk(MCKL),.rL(CKRSTL));                 //[00106] SHIFT2_(B,BL) = FD2A(A,MCKL,CKRSTL);
FD2A SHIFT3__inst (.q(C),.qL(CL),.d(B),.clk(MCKL),.rL(CKRSTL));                 //[00107] SHIFT3_(C,CL) = FD2A(B,MCKL,CKRSTL);
assign D = ~((A & CL)|(AL & BL));                                               //[00108] SHFDEC_(D) = AO2A(A,CL,AL,BL);

/* sample 'a' with other edge of mck to get 50% duty cycle */

FD2A AD__inst (.q(AD),.qL(ADL),.d(A),.clk(MCK),.rL(CKRSTL));                    //[00112] AD_(AD,ADL) = FD2A(A,MCK,CKRSTL);
assign Z = ~(A & AD);                                                           //[00113] Z_(Z) = ND2A(A,AD);

/* select appropriate carrier */

assign PAL = ~NTSC;                                                             //[00117] PAL_(PAL) = N1A(NTSC);
assign CHROMAL = ~((PAL & Y)|(NTSC & Z));                                       //[00118] CHROMAL_(CHROMAL) = AO2A(PAL,Y,NTSC,Z);

endmodule                                                                       //[00120] END MODULE;