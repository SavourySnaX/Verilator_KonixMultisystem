                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
addradd
26/9/88

Address Adder

****************************************************************************/

module m_ADDRADD                                                                //[00012] MODULE ADDRADD;
(                                                                               //[00012] MODULE ADDRADD;

    input    ADDAM1,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_0,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_1,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_2,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_3,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_4,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_5,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_6,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_7,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_8,                                                            //[00014] INPUTS	ADDAM1,ADDA_0,ADDA_1,ADDA_2,ADDA_3,ADDA_4,ADDA_5,ADDA_6,ADDA_7,ADDA_8,
    input    ADDA_9,                                                            //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_10,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_11,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_12,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_13,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_14,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_15,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_16,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_17,                                                           //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
    input    ADDA_18,                                                           //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDA_19,                                                           //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDBM1,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_0,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_1,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_2,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_3,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_4,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_5,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_6,                                                            //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
    input    ADDB_7,                                                            //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    ADDB_8,                                                            //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    CARRYIN_0,                                                         //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    CARRYIN_1,                                                         //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    CINH6,                                                             //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    CINH7,                                                             //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    CINH15,                                                            //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    HISIGN,                                                            //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    input    VHISIGN,                                                           //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
                                                                                //[00015]    ADDA_9,ADDA_10,ADDA_11,ADDA_12,ADDA_13,ADDA_14,ADDA_15,ADDA_16,ADDA_17,
                                                                                //[00016]    ADDA_18,ADDA_19,ADDBM1,ADDB_0,ADDB_1,ADDB_2,ADDB_3,ADDB_4,ADDB_5,ADDB_6,
                                                                                //[00017]    ADDB_7,ADDB_8,CARRYIN_0,CARRYIN_1,CINH6,CINH7,CINH15,HISIGN,VHISIGN;
    output    ADDQM1,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_0,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_1,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_2,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_3,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_4,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_5,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_6,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_7,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_8,                                                           //[00018] OUTPUTS	ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,ADDQ_7,ADDQ_8,
    output    ADDQ_9,                                                           //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_10,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_11,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_12,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_13,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_14,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_15,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_16,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_17,                                                          //[00019]    ADDQ_9,ADDQ_10,ADDQ_11,ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,ADDQ_16,ADDQ_17,
    output    ADDQ_18,                                                          //[00020]    ADDQ_18,ADDQ_19,CARRYOUT;
    output    ADDQ_19,                                                          //[00020]    ADDQ_18,ADDQ_19,CARRYOUT;
    output    CARRYOUT                                                          //[00020]    ADDQ_18,ADDQ_19,CARRYOUT;
);                                                                              //[00012] MODULE ADDRADD;
                                                                                //[00021] LEVEL FUNCTION;
wire CINH6L;                                                                    //[00026] CINH6L_(CINH6L) = N1A(CINH6);
wire CINH7L;                                                                    //[00027] CINH7L_(CINH7L) = N1A(CINH7);
wire CINH15L;                                                                   //[00028] CINH15L_(CINH15L) = N1A(CINH15);
wire CRY_1;                                                                     //[00038] ADDER_0_(CRY_1,ADDQ_6,ADDQ_5,ADDQ_4,ADDQ_3,ADDQ_2,ADDQ_1,ADDQ_0,ADDQM1)
wire CRYL_2;                                                                    //[00044] CRYINH6L_(CRYL_2) = AO2C(CINH6,CARRYIN_1,CINH6L,CRY_1);
wire CRY_2;                                                                     //[00045] CRY2INV_(CRY_2) = N1C(CRYL_2);
wire CRYL_3;                                                                    //[00055] CRYINH3L_(CRYL_3) = AO2C(CINH7,CARRYIN_1,CINH7L,CARRYOUT);
wire CRY_3;                                                                     //[00056] CRY3INV_(CRY_3) = N1C (CRYL_3);
wire CRY_5;                                                                     //[00067] ADDER_3_(CRY_5,ADDQ_15,ADDQ_14,ADDQ_13,ADDQ_12,ADDQ_11,ADDQ_10,ADDQ_9,ADDQ_8)
wire CRY_6;                                                                     //[00073] CRYINH15_(CRY_6) = AND2C(CINH15L,CRY_5);
wire CRY_7;                                                                     //[00077] ADDER5_(CRY_7,ADDQ_19,ADDQ_18,ADDQ_17,ADDQ_16) = FA4C(CRY_6,ADDA_19,ADDA_18,

/* Invert control bits as required */

assign CINH6L = ~CINH6;                                                         //[00026] CINH6L_(CINH6L) = N1A(CINH6);
assign CINH7L = ~CINH7;                                                         //[00027] CINH7L_(CINH7L) = N1A(CINH7);
assign CINH15L = ~CINH15;                                                       //[00028] CINH15L_(CINH15L) = N1A(CINH15);

/* Add bits -1 to 6, using the carry in if required */

/*
ADDER0_(ADDQM1,ADDQ_0,ADDQ_1,ADDQ_2,CRY_0) = FULLADD4(ADDAM1,ADDA_0,ADDA_1,
   ADDA_2,ADDBM1,ADDB_0,ADDB_1,ADDB_2,CARRYIN_0);
ADDER1_(ADDQ_3,ADDQ_4,ADDQ_5,ADDQ_6,CRY_1) = FULLADD4(ADDA_3,ADDA_4,ADDA_5,
   ADDA_6,ADDB_3,ADDB_4,ADDB_5,ADDB_6,CRY_0);
*/
FA8 ADDER_0__inst (.CO(CRY_1),.SUM_7(ADDQ_6),.SUM_6(ADDQ_5),.SUM_5(ADDQ_4),.SUM_4(ADDQ_3),.SUM_3(ADDQ_2),.SUM_2(ADDQ_1),.SUM_1(ADDQ_0),.SUM_0(ADDQM1),.CI(CARRYIN_0),.A_7(ADDA_6),.A_6(ADDA_5),.A_5(ADDA_4),.A_4(ADDA_3),.A_3(ADDA_2),.A_2(ADDA_1),.A_1(ADDA_0),.A_0(ADDAM1),.B_7(ADDB_6),.B_6(ADDB_5),.B_5(ADDB_4),.B_4(ADDB_3),.B_3(ADDB_2),.B_2(ADDB_1),.B_1(ADDB_0),.B_0(ADDBM1));//[00038] ADDER_0_(CRY_1,ADDQ_6,ADDQ_5,ADDQ_4,ADDQ_3,ADDQ_2,ADDQ_1,ADDQ_0,ADDQM1)
                                                                                //[00039]    = FA8(CARRYIN_0, ADDA_6, ADDA_5, ADDA_4, ADDA_3, ADDA_2, ADDA_1, ADDA_0,
                                                                                //[00040]    ADDAM1,ADDB_6,ADDB_5,ADDB_4,ADDB_3,ADDB_2,ADDB_1,ADDB_0,ADDBM1);

/* Inhibit carry and inject sign if required from 6-7 */

assign CRYL_2 = ~((CINH6 & CARRYIN_1)|(CINH6L & CRY_1));                        //[00044] CRYINH6L_(CRYL_2) = AO2C(CINH6,CARRYIN_1,CINH6L,CRY_1);
assign CRY_2 = ~CRYL_2;                                                         //[00045] CRY2INV_(CRY_2) = N1C(CRYL_2);

/* Add bit 7
   The carry output from this stage is used to generate the borrow term
   for line draw computattion. */

FULLADD ADDER2__inst (.Q(ADDQ_7),.CO(CARRYOUT),.A(ADDA_7),.B(ADDB_7),.CI(CRY_2));//[00051] ADDER2_(ADDQ_7,CARRYOUT) = FULLADD(ADDA_7,ADDB_7,CRY_2);

/* Inhibit carry and inject carry if required from 7-8. */

assign CRYL_3 = ~((CINH7 & CARRYIN_1)|(CINH7L & CARRYOUT));                     //[00055] CRYINH3L_(CRYL_3) = AO2C(CINH7,CARRYIN_1,CINH7L,CARRYOUT);
assign CRY_3 = ~CRYL_3;                                                         //[00056] CRY3INV_(CRY_3) = N1C (CRYL_3);

/* Perform the addition on bits 8-15.  Note that the B input is the same for
   bits 9-15, and is given by hisign.  */

/*
ADDER3_(ADDQ_8,ADDQ_9,ADDQ_10,ADDQ_11,CRY_4) = FULLADD4(ADDA_8,ADDA_9,ADDA_10,
   ADDA_11,ADDB_8,HISIGN,HISIGN,HISIGN,CRY_3);
ADDER4_(ADDQ_12,ADDQ_13,ADDQ_14,ADDQ_15,CRY_5) = FULLADD4(ADDA_12,ADDA_13,
   ADDA_14,ADDA_15,HISIGN,HISIGN,HISIGN,HISIGN,CRY_4);
*/
FA8 ADDER_3__inst (.CO(CRY_5),.SUM_7(ADDQ_15),.SUM_6(ADDQ_14),.SUM_5(ADDQ_13),.SUM_4(ADDQ_12),.SUM_3(ADDQ_11),.SUM_2(ADDQ_10),.SUM_1(ADDQ_9),.SUM_0(ADDQ_8),.CI(CRY_3),.A_7(ADDA_15),.A_6(ADDA_14),.A_5(ADDA_13),.A_4(ADDA_12),.A_3(ADDA_11),.A_2(ADDA_10),.A_1(ADDA_9),.A_0(ADDA_8),.B_7(HISIGN),.B_6(HISIGN),.B_5(HISIGN),.B_4(HISIGN),.B_3(HISIGN),.B_2(HISIGN),.B_1(HISIGN),.B_0(ADDB_8));//[00067] ADDER_3_(CRY_5,ADDQ_15,ADDQ_14,ADDQ_13,ADDQ_12,ADDQ_11,ADDQ_10,ADDQ_9,ADDQ_8)
                                                                                //[00068]    = FA8(CRY_3,ADDA_15,ADDA_14,ADDA_13, ADDA_12,ADDA_11,ADDA_10, ADDA_9,
                                                                                //[00069]    ADDA_8,HISIGN,HISIGN,HISIGN,HISIGN,HISIGN,HISIGN,HISIGN,ADDB_8);

/* Inhibit carry from bits 15 to 16 if required */

assign CRY_6 = CINH15L & CRY_5;                                                 //[00073] CRYINH15_(CRY_6) = AND2C(CINH15L,CRY_5);

/* Perform the addition on bits 17-19 */

FA4C ADDER5__inst (.CO(CRY_7),.SUM_3(ADDQ_19),.SUM_2(ADDQ_18),.SUM_1(ADDQ_17),.SUM_0(ADDQ_16),.CI(CRY_6),.A_3(ADDA_19),.A_2(ADDA_18),.A_1(ADDA_17),.A_0(ADDA_16),.B_3(VHISIGN),.B_2(VHISIGN),.B_1(VHISIGN),.B_0(VHISIGN));//[00077] ADDER5_(CRY_7,ADDQ_19,ADDQ_18,ADDQ_17,ADDQ_16) = FA4C(CRY_6,ADDA_19,ADDA_18,
                                                                                //[00078]    ADDA_17,ADDA_16,VHISIGN,VHISIGN,VHISIGN,VHISIGN);

endmodule                                                                       //[00080] END MODULE;