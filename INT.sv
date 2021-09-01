/********************************************************
*       int-hdl                                         *
*       25/10/88                                        *
********************************************************/

/*
This module is the interupt manager in the SLIPSTREAM chip on the ACW
*/

module INT
(
    inout   [7:0]   D,
    input           RESETL_0,
    input           CLK,
    input           VINTv,
    input   [2:0]   AIL,
    input           INTAL,
    input           ACK,
    input   [3:0]   WD,
    input           DIS,
    output          INTL
);

/* latch the disable bits */

wire [3:0] DISn,DISLn;
LD1A DIS_0_inst
(
	.q 	/*OUT*/ (DISn[0]),
	.qL	/*OUT*/	(DISLn[0]),
	.d	/* IN*/	(WD[0]),
	.en	/* IN*/	(DIS)
);
LD1A DIS_1_inst
(
	.q 	/*OUT*/ (DISn[1]),
	.qL	/*OUT*/	(DISLn[1]),
	.d	/* IN*/	(WD[1]),
	.en	/* IN*/	(DIS)
);
LD1A DIS_2_inst
(
	.q 	/*OUT*/ (DISn[2]),
	.qL	/*OUT*/	(DISLn[2]),
	.d	/* IN*/	(WD[2]),
	.en	/* IN*/	(DIS)
);
LD1A DIS_3_inst
(
	.q 	/*OUT*/ (DISn[3]),
	.qL	/*OUT*/	(DISLn[3]),
	.d	/* IN*/	(WD[3]),
	.en	/* IN*/	(DIS)
);

/* sample the analogue inputs */

wire RESL;
wire [2:0] AI1L,AI1,AI2,AI2L;
FD2A AI1L_0_inst
(
	.q 	/*OUT*/ (AI1L[0]),
	.qL	/*OUT*/	(AI1[0]),
	.d	/* IN*/	(AIL[0]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);
FD2A AI1L_1_inst
(
	.q 	/*OUT*/ (AI1L[1]),
	.qL	/*OUT*/	(AI1[1]),
	.d	/* IN*/	(AIL[1]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);
FD2A AI1L_2_inst
(
	.q 	/*OUT*/ (AI1L[2]),
	.qL	/*OUT*/	(AI1[2]),
	.d	/* IN*/	(AIL[2]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);
FD2A AI2_0_inst
(
	.q 	/*OUT*/ (AI2[0]),
	.qL	/*OUT*/	(AI2L[0]),
	.d	/* IN*/	(AI1[0]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);
FD2A AI2_1_inst
(
	.q 	/*OUT*/ (AI2[1]),
	.qL	/*OUT*/	(AI2L[1]),
	.d	/* IN*/	(AI1[1]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);
FD2A AI2_2_inst
(
	.q 	/*OUT*/ (AI2[2]),
	.qL	/*OUT*/	(AI2L[2]),
	.d	/* IN*/	(AI1[2]),
	.clk	/* IN*/	(CLK),
	.rL	/* IN*/	(RESL)
);

/* generate a pulse off the leading edge (negative going at pin) */

wire [2:0] AID;
assign AID[0] = ~(DISn[1] | AI1[0] | AI2L[0]);
assign AID[1] = ~(DISn[2] | AI1[1] | AI2L[1]);
assign AID[2] = ~(DISn[3] | AI1[2] | AI2L[2]);

/* latch the interrupts */

wire RES;
assign RES = ~RESETL_0;
assign RESL = ~RES;

wire [3:0] ACKn;
wire J;
wire [3:0] I,IL;
assign J = VINTv & DISLn[0];
JK I_0_inst
(
    .q  /*OUT*/ (I[0]),
    .qL /*OUT*/ (IL[0]),
    .j  /* IN*/ (J),
    .k  /* IN*/ (ACKn[0]),
    .r  /* IN*/ (RES),
    .clk/* IN*/ (CLK)
);
JK I_1_inst
(
    .q  /*OUT*/ (I[1]),
    .qL /*OUT*/ (IL[1]),
    .j  /* IN*/ (AID[0]),
    .k  /* IN*/ (ACKn[1]),
    .r  /* IN*/ (RES),
    .clk/* IN*/ (CLK)
);
JK I_2_inst
(
    .q  /*OUT*/ (I[2]),
    .qL /*OUT*/ (IL[2]),
    .j  /* IN*/ (AID[1]),
    .k  /* IN*/ (ACKn[2]),
    .r  /* IN*/ (RES),
    .clk/* IN*/ (CLK)
);
JK I_3_inst
(
    .q  /*OUT*/ (I[3]),
    .qL /*OUT*/ (IL[3]),
    .j  /* IN*/ (AID[2]),
    .k  /* IN*/ (ACKn[3]),
    .r  /* IN*/ (RES),
    .clk/* IN*/ (CLK)
);

/* latch this using INTAL so that the interrupt vector does
not change during the acknowledge cycle */

wire INTA,INTA1L;
wire [3:0] I1,I1L;
assign INTA = ~INTAL;
assign INTA1L = ~INTA;
LD1A I1_0_inst
(
	.q 	/*OUT*/ (I1[0]),
	.qL	/*OUT*/	(I1L[0]),
	.d	/* IN*/	(I[0]),
	.en	/* IN*/	(INTA1L)
);
LD1A I1_1_inst
(
	.q 	/*OUT*/ (I1[1]),
	.qL	/*OUT*/	(I1L[1]),
	.d	/* IN*/	(I[1]),
	.en	/* IN*/	(INTA1L)
);
LD1A I1_2_inst
(
	.q 	/*OUT*/ (I1[2]),
	.qL	/*OUT*/	(I1L[2]),
	.d	/* IN*/	(I[2]),
	.en	/* IN*/	(INTA1L)
);
LD1A I1_3_inst
(
	.q 	/*OUT*/ (I1[3]),
	.qL	/*OUT*/	(I1L[3]),
	.d	/* IN*/	(I[3]),
	.en	/* IN*/	(INTA1L)
);

/* latch this with INTA so that the appropriate interrupt is cleared
by the OUT (ACK),AL instruction nb. the INTA cannot be used to cleared
the interrupt becauuse there are two INTA pulses per ackowledge */

wire [3:0] I2,I2L;
LD1A I2_0_inst
(
	.q 	/*OUT*/ (I2[0]),
	.qL	/*OUT*/	(I2L[0]),
	.d	/* IN*/	(I1[0]),
	.en	/* IN*/	(INTA)
);
LD1A I2_1_inst
(
	.q 	/*OUT*/ (I2[1]),
	.qL	/*OUT*/	(I2L[1]),
	.d	/* IN*/	(I1[1]),
	.en	/* IN*/	(INTA)
);
LD1A I2_2_inst
(
	.q 	/*OUT*/ (I2[2]),
	.qL	/*OUT*/	(I2L[2]),
	.d	/* IN*/	(I1[2]),
	.en	/* IN*/	(INTA)
);
LD1A I2_3_inst
(
	.q 	/*OUT*/ (I2[3]),
	.qL	/*OUT*/	(I2L[3]),
	.d	/* IN*/	(I1[3]),
	.en	/* IN*/	(INTA)
);


/* Now prioritize the interrupts..interupt with a lower index disable
those with a higher */

wire [3:0] IP;
wire MASK_1,MASK_2;
assign IP[0] = I2[0];
assign IP[1] = ~(I2L[1] | I2[0]);
assign MASK_1 = I2[0] | I2[1];
assign IP[2] = ~(I2L[2] | MASK_1);
assign IP[3] = ~(I2L[3] | MASK_2);
assign MASK_2 = MASK_1 | I2[2];

/* produce a vector from this */

wire [2:0] VL;
assign VL[0] = ~(IP[0] | IP[2]);
assign VL[1] = ~(IP[1] | IP[2]);
assign VL[2] = ~IP[3];

/* the interrupt signal */

assign INTL = ~(I[0] | I[1] | I[2] | I[3]);

/* enable onto bus during INTA */

assign D[0] = ~INTAL ? VL[0] : 1'bZ;
assign D[1] = ~INTAL ? VL[1] : 1'bZ;
assign D[2] = ~INTAL ? VL[2] : 1'bZ;
assign D[3] = ~INTAL ? RESETL_0 : 1'bZ;
assign D[4] = ~INTAL ? RESETL_0 : 1'bZ;
assign D[5] = ~INTAL ? RES : 1'bZ;
assign D[6] = ~INTAL ? RESETL_0 : 1'bZ;
assign D[7] = ~INTAL ? RESETL_0 : 1'bZ;

/* clear the appropriate interupt */

assign ACKn[0] = ACK & IP[0];
assign ACKn[1] = ACK & IP[1];
assign ACKn[2] = ACK & IP[2];
assign ACKn[3] = ACK & IP[3];

endmodule