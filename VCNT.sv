/********************************************************
*       vcnt-hdl                                        *
*       2/11/88                                         *
********************************************************/

/*
This module is the vertical timebase in the SLIPSTREAM chip on the ACW
*/

module VCNT
(
    inout   [7:0]   D,
    input           RESETL_0,
    input           CLK,
    input   [7:0]   WD,
    input           VCNTL,
    input           VCNTH,
    input           LPL_2,
    input           LPL_3,
    input           VCLOCK,
    input           NTSC,
    input           GENLOCK,
    input           STARTL,
    input           STARTH,
    input           ENDL,
    input           ENDH,
    input           INTL,
    input           INTH,
    input           HBORDER,
    input           HBLANKING,
    input           HSYNC,
    input           LPCLK,
    input           HD1,
    input           DIAG,
    input           LORES,
    input           HINT,
    output          VVACTIVE,
    output          VSYNC,
    output          VINT,
    output          BORDER,
    output          BLANKING,
    output          STARTD,
    output          NEXTV
);

/* buffer the clock and reset */

wire RESETL,RES;
assign RESETL = RESETL_0;
assign RES = ~RESETL;

/* latch the msb of the vertical count */

wire VCNT8,VCNTL8;
LD1A VCNT8_inst
(
	.q 	/*OUT*/ (VCNT8),
	.qL	/*OUT*/	(VCNTL8),
	.d	/* IN*/	(WD[0]),
	.en	/* IN*/	(VCNTH)
);

/* the vertical counter usually increments when the horizonal 
count is one (hd1). For test purposes the counter may count every clock
cycle by setting diag. Reset is added to the decode for 'hd1d' to
help define the JKs after reset */

wire HDD,HD1D;
assign HDD = ~(HD1 | DIAG);
assign HD1D = ~(HDD | RES);

/* the vertical counter */

wire VCNTLBL;
wire [8:0] VC,VCB,CO;
assign VCNTLBL = ~(VCNTL);

SYNCNT Q0_inst
(
    .Q  /*OUT*/ (VC[0]),
    .QB /*OUT*/ (VCB[0]),
    .CO /*OUT*/ (CO[0]),
    .D  /* IN*/ (WD[0]),
    .CLK/* IN*/ (CLK),
    .CLR/* IN*/ (NEXTV),
    .LDL/* IN*/ (VCNTLBL),
    .CI /* IN*/ (HD1D)
);

endmodule