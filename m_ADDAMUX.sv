                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
addamux
22/9/88

Address adder A input multiplexer

****************************************************************************/

module m_ADDAMUX                                                                //[00012] MODULE ADDAMUX;
(                                                                               //[00012] MODULE ADDAMUX;

    input    SAL_0,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_1,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_2,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_3,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_4,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_5,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_6,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_7,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_8,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_9,                                                             //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_10,                                                            //[00014] INPUTS	SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,SAL_9,SAL_10,
    input    SAL_11,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_12,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_13,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_14,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_15,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_16,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_17,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_18,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    SAL_19,                                                            //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    DAL_0,                                                             //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    DAL_1,                                                             //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
    input    DAL_2,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_3,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_4,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_5,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_6,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_7,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_8,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_9,                                                             //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_10,                                                            //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_11,                                                            //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_12,                                                            //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_13,                                                            //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
    input    DAL_14,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    DAL_15,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    DAL_16,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    DAL_17,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    DAL_18,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    DAL_19,                                                            //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_0,                                                             //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_1,                                                             //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_2,                                                             //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_3,                                                             //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_4,                                                             //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
    input    PCL_5,                                                             //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_6,                                                             //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_7,                                                             //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_8,                                                             //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_9,                                                             //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_10,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_11,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_12,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_13,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_14,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_15,                                                            //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
    input    PCL_16,                                                            //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    PCL_17,                                                            //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    PCL_18,                                                            //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    PCL_19,                                                            //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    UPDSRCL,                                                           //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    UPDPCL,                                                            //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    SAM1L,                                                             //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    input    DAM1L,                                                             //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
                                                                                //[00015]    SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,DAL_0,DAL_1,
                                                                                //[00016]    DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,DAL_12,DAL_13,
                                                                                //[00017]    DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,PCL_3,PCL_4,
                                                                                //[00018]    PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,PCL_15,
                                                                                //[00019]    PCL_16,PCL_17,PCL_18,PCL_19,UPDSRCL,UPDPCL,SAM1L,DAM1L;
    output    ADDAM1,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_0,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_1,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_2,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_3,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_4,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_5,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_6,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_7,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_8,                                                           //[00020] OUTPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    output    ADDA_9,                                                           //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_10,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_11,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_12,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_13,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_14,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_15,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_16,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_17,                                                          //[00021]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    output    ADDA_18,                                                          //[00022]    ADDA_18,ADDA_19;
    output    ADDA_19                                                           //[00022]    ADDA_18,ADDA_19;
);                                                                              //[00012] MODULE ADDAMUX;
                                                                                //[00023] LEVEL FUNCTION;
wire SELPC;                                                                     //[00028] SELPC_(SELPC) = N1D(UPDPCL);
wire SELPCB;                                                                    //[00029] SELPCB_(SELPCB) = N1D(UPDPCL);
wire UPDSRC;                                                                    //[00030] UPDSRCL_(UPDSRC) = N1A(UPDSRCL);
wire SELDST;                                                                    //[00031] SELDST_(SELDST) = NR2C(UPDSRC,SELPC);
wire SELDSTB;                                                                   //[00032] SELDSTB_(SELDSTB) = NR2C(UPDSRC,SELPC);
wire SELSRC;                                                                    //[00033] SELSRC_(SELSRC) = NR2C(UPDSRCL,SELPC);
wire SELSRCB;                                                                   //[00034] SELSRCB_(SELSRCB) = NR2C(UPDSRCL,SELPC);

/* Generate the select signals, with separate enables on the low 8 bits */

assign SELPC = ~UPDPCL;                                                         //[00028] SELPC_(SELPC) = N1D(UPDPCL);
assign SELPCB = ~UPDPCL;                                                        //[00029] SELPCB_(SELPCB) = N1D(UPDPCL);
assign UPDSRC = ~UPDSRCL;                                                       //[00030] UPDSRCL_(UPDSRC) = N1A(UPDSRCL);
assign SELDST = ~(UPDSRC | SELPC);                                              //[00031] SELDST_(SELDST) = NR2C(UPDSRC,SELPC);
assign SELDSTB = ~(UPDSRC | SELPC);                                             //[00032] SELDSTB_(SELDSTB) = NR2C(UPDSRC,SELPC);
assign SELSRC = ~(UPDSRCL | SELPC);                                             //[00033] SELSRC_(SELSRC) = NR2C(UPDSRCL,SELPC);
assign SELSRCB = ~(UPDSRCL | SELPC);                                            //[00034] SELSRCB_(SELSRCB) = NR2C(UPDSRCL,SELPC);

/* Perform the multiplexing */

assign ADDAM1 = ~((SELPCB & SELPCB) | (SELSRCB & SAM1L) | (SELDSTB & DAM1L));   //[00038] ADDAMUXM1_(ADDAM1) = AO11A(SELPCB,SELPCB,SELSRCB,SAM1L,SELDSTB,DAM1L);
assign ADDA_0 = ~((SELPCB & PCL_0) | (SELSRCB & SAL_0) | (SELDSTB & DAL_0));    //[00039] ADDAMUX_0_(ADDA_0) = AO11A(SELPCB,PCL_0,SELSRCB,SAL_0,SELDSTB,DAL_0);
assign ADDA_1 = ~((SELPCB & PCL_1) | (SELSRCB & SAL_1) | (SELDSTB & DAL_1));    //[00040] ADDAMUX_1_(ADDA_1) = AO11A(SELPCB,PCL_1,SELSRCB,SAL_1,SELDSTB,DAL_1);
assign ADDA_2 = ~((SELPCB & PCL_2) | (SELSRCB & SAL_2) | (SELDSTB & DAL_2));    //[00041] ADDAMUX_2_(ADDA_2) = AO11A(SELPCB,PCL_2,SELSRCB,SAL_2,SELDSTB,DAL_2);
assign ADDA_3 = ~((SELPCB & PCL_3) | (SELSRCB & SAL_3) | (SELDSTB & DAL_3));    //[00042] ADDAMUX_3_(ADDA_3) = AO11A(SELPCB,PCL_3,SELSRCB,SAL_3,SELDSTB,DAL_3);
assign ADDA_4 = ~((SELPCB & PCL_4) | (SELSRCB & SAL_4) | (SELDSTB & DAL_4));    //[00043] ADDAMUX_4_(ADDA_4) = AO11A(SELPCB,PCL_4,SELSRCB,SAL_4,SELDSTB,DAL_4);
assign ADDA_5 = ~((SELPCB & PCL_5) | (SELSRCB & SAL_5) | (SELDSTB & DAL_5));    //[00044] ADDAMUX_5_(ADDA_5) = AO11A(SELPCB,PCL_5,SELSRCB,SAL_5,SELDSTB,DAL_5);
assign ADDA_6 = ~((SELPCB & PCL_6) | (SELSRCB & SAL_6) | (SELDSTB & DAL_6));    //[00045] ADDAMUX_6_(ADDA_6) = AO11A(SELPCB,PCL_6,SELSRCB,SAL_6,SELDSTB,DAL_6);
assign ADDA_7 = ~((SELPC & PCL_7) | (SELSRC & SAL_7) | (SELDST & DAL_7));       //[00046] ADDAMUX_7_(ADDA_7) = AO11A(SELPC,PCL_7,SELSRC,SAL_7,SELDST,DAL_7);
assign ADDA_8 = ~((SELPC & PCL_8) | (SELSRC & SAL_8) | (SELDST & DAL_8));       //[00047] ADDAMUX_8_(ADDA_8) = AO11A(SELPC,PCL_8,SELSRC,SAL_8,SELDST,DAL_8);
assign ADDA_9 = ~((SELPC & PCL_9) | (SELSRC & SAL_9) | (SELDST & DAL_9));       //[00048] ADDAMUX_9_(ADDA_9) = AO11A(SELPC,PCL_9,SELSRC,SAL_9,SELDST,DAL_9);
assign ADDA_10 = ~((SELPC & PCL_10) | (SELSRC & SAL_10) | (SELDST & DAL_10));   //[00049] ADDAMUX_10_(ADDA_10) = AO11A(SELPC,PCL_10,SELSRC,SAL_10,SELDST,DAL_10);
assign ADDA_11 = ~((SELPC & PCL_11) | (SELSRC & SAL_11) | (SELDST & DAL_11));   //[00050] ADDAMUX_11_(ADDA_11) = AO11A(SELPC,PCL_11,SELSRC,SAL_11,SELDST,DAL_11);
assign ADDA_12 = ~((SELPC & PCL_12) | (SELSRC & SAL_12) | (SELDST & DAL_12));   //[00051] ADDAMUX_12_(ADDA_12) = AO11A(SELPC,PCL_12,SELSRC,SAL_12,SELDST,DAL_12);
assign ADDA_13 = ~((SELPC & PCL_13) | (SELSRC & SAL_13) | (SELDST & DAL_13));   //[00052] ADDAMUX_13_(ADDA_13) = AO11A(SELPC,PCL_13,SELSRC,SAL_13,SELDST,DAL_13);
assign ADDA_14 = ~((SELPC & PCL_14) | (SELSRC & SAL_14) | (SELDST & DAL_14));   //[00053] ADDAMUX_14_(ADDA_14) = AO11A(SELPC,PCL_14,SELSRC,SAL_14,SELDST,DAL_14);
assign ADDA_15 = ~((SELPC & PCL_15) | (SELSRC & SAL_15) | (SELDST & DAL_15));   //[00054] ADDAMUX_15_(ADDA_15) = AO11A(SELPC,PCL_15,SELSRC,SAL_15,SELDST,DAL_15);
assign ADDA_16 = ~((SELPC & PCL_16) | (SELSRC & SAL_16) | (SELDST & DAL_16));   //[00055] ADDAMUX_16_(ADDA_16) = AO11A(SELPC,PCL_16,SELSRC,SAL_16,SELDST,DAL_16);
assign ADDA_17 = ~((SELPC & PCL_17) | (SELSRC & SAL_17) | (SELDST & DAL_17));   //[00056] ADDAMUX_17_(ADDA_17) = AO11A(SELPC,PCL_17,SELSRC,SAL_17,SELDST,DAL_17);
assign ADDA_18 = ~((SELPC & PCL_18) | (SELSRC & SAL_18) | (SELDST & DAL_18));   //[00057] ADDAMUX_18_(ADDA_18) = AO11A(SELPC,PCL_18,SELSRC,SAL_18,SELDST,DAL_18);
assign ADDA_19 = ~((SELPC & PCL_19) | (SELSRC & SAL_19) | (SELDST & DAL_19));   //[00058] ADDAMUX_19_(ADDA_19) = AO11A(SELPC,PCL_19,SELSRC,SAL_19,SELDST,DAL_19);

endmodule                                                                       //[00060] END MODULE;