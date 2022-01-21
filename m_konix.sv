
module m_konix
(
	input         clk_sys,
	input			  XTAL,
	input         reset,
	
	output CLK_VIDEO,
	output reg CE_PIXEL,
	output [7:0] VGA_G,
	output [7:0] VGA_R,
   output [7:0] VGA_B,

	output VGA_DE,
	output VGA_HS,
	output VGA_VS
	
);

wire [19:0] ABus	/*synthesis keep*/;
wire Write,Word,Read 	/*synthesis keep*/;
wire [15:0] inRamData,outRamData 	/*synthesis keep*/;
wire [15:0] sR 	/*synthesis keep*/;
wire [7:0] dR,rR 	/*synthesis keep*/;

wire SRam;
wire DRam;
wire Rom;

wire HSync;
wire VSync;
wire ce_pix;
wire [7:0] video;

wire blanking;

wire [7:0] XAD, SS_outXAD, SS_enXAD;
wire [19:8] XA, SS_outXA, SS_enXA;
wire [15:8] XD, SS_outXD, SS_enXD;

wire [7:0] latchedLowXA;
wire [17:16] latchedUpperXA;

wire [2:0] joy, enjoy;
wire io,enio;

wire HSyncL,VSyncL;
wire enVSyncL,enHSyncL;

wire IOM,ALE,INTA,HLDA,/*XTAL,*/RDL,WRL,PCLK,HOLD,INTR 	/*synthesis keep*/;
wire INTAL 	/*synthesis keep*/;
wire [1:0] ScreenChipEnableL, ChipSelectLow;
wire SlipStreamWriteL 	/*synthesis keep*/;
wire leftL,leftH,rightL,rightH;

wire inc,aiSel,oeL,casL,xtalo;
wire [1:0] gpioL;

wire qclk;
wire [13:0] leftDAC,rightDAC;

wire dtr,den;

wire [19:0] cpuA	/*synthesis keep*/;
wire [7:0] cpuDOut;
wire [7:0] cpuDIn;

wire [19:0] slipAddress /*synthesis keep*/;
wire [19:0] slipAddressVideo /*synthesis keep*/;

//reg HLDA;
/// Ram Chips

ram #(.addr_width(16),.data_width(16),.file("sram.mem")) SRAM (
  .clk(clk_sys),
  .din(outRamData),
  .addr(ABus[16:1]),
  .cs(SRam),
  .oe(SRam),
  .wr(Write),
  .Q(sR)
);

ram #(.addr_width(18),.data_width(8),.file("dram.mem")) DRAM (
  .clk(clk_sys),
  .din(outRamData[7:0]),
  .addr(ABus[17:0]),
  .cs(DRam),
  .oe(DRam),
  .wr(Write),
  .Q(dR)
);

ram #(.addr_width(3),.data_width(8),.file("rom.mem")) ROM (
  .clk(clk_sys),
  .din(outRamData[7:0]),
  .addr(ABus[2:0]),
  .cs(Rom),
  .oe(Rom),
  .wr(Write),
  .Q(rR)
);

assign Rom = ABus[19] & ABus[18];
assign SRam = ~ABus[19] & ~ABus[18];
assign DRam = ABus[19] & ~ABus[18];
assign inRamData = {sR[15:8], (dR[7:0] & {8{DRam}})|(sR[7:0] & {8{SRam}})|(rR[7:0] & {8{Rom}})};

assign INTA=~INTAL;

assign slipAddressVideo = {2'b00,latchedUpperXA,SS_outXA[15:8],latchedLowXA};

assign XAD = (inRamData[7:0] & {8{HLDA}}) | (((cpuA[7:0] & {8{ALE}} & ({8{~HLDA}})) | (cpuDOut & {8{~ALE}})) & ({8{~HLDA}}));
assign XA = cpuA[19:8];
assign XD = inRamData[15:8];
assign ABus = (cpuA & {20{~HLDA}}) | ({20{HLDA}} & (slipAddress & {20{~Word}}) | (slipAddressVideo & {20{Word}}));
assign Word = ScreenChipEnableL==2'b00;
assign Write = (~SlipStreamWriteL) | ((~WRL) & (~IOM) & (~HLDA));
assign Read = (~oeL) | ((~RDL) & (~IOM) & (~HLDA));

assign cpuDIn = (inRamData[7:0] & (~SS_enXAD)) | (SS_outXAD & SS_enXAD);

assign outRamData = ({SS_outXD,SS_outXAD} & {16{HLDA}}) | (cpuDOut & ({16{~HLDA}}));

reg [1:0] cnt=2'b0;
reg DCLK=1'b0;

wire CCLK;

reg [1:0] chromaEdge=2'b00;

always @(posedge clk_sys)
begin
    cnt <= cnt + 2'b01;
    if (cnt==2'b11)
    begin
        DCLK<=~DCLK;
    end
	 
	 chromaEdge <= chromaEdge << 1;
	 chromaEdge[0] <= CCLK;
	 
	 if (chromaEdge[1]==1'b1 && chromaEdge[0]==1'b0)
		CE_PIXEL <= 1'b1;
	 else
		CE_PIXEL <= 1'b0;

end

//assign XTAL = DCLK; // TODO pick a divisor

wire [3:0] Red,Green,Blue;
wire Chroma;

/* verilator lint_off UNOPTFLAT */

m_SS SlipStream(
	 .MasterClock(clk_sys),
    .inXAD_0(XAD[0]),.inXAD_1(XAD[1]),.inXAD_2(XAD[2]),.inXAD_3(XAD[3]),.inXAD_4(XAD[4]),.inXAD_5(XAD[5]),.inXAD_6(XAD[6]),.inXAD_7(XAD[7]),
    .inXA_8(XA[8]),.inXA_9(XA[9]),.inXA_10(XA[10]),.inXA_11(XA[11]),.inXA_12(XA[12]),.inXA_13(XA[13]),.inXA_14(XA[14]),.inXA_15(XA[15]),
    .inXD_8(XD[8]),.inXD_9(XD[9]),.inXD_10(XD[10]),.inXD_11(XD[11]),.inXD_12(XD[12]),.inXD_13(XD[13]),.inXD_14(XD[14]),.inXD_15(XD[15]),
    .inXVSYNCL(1),.inXHSYNCL(1),.inXJOYL_0(1),.inXJOYL_1(1),.inXJOYL_2(0),.inXDSP_IO(0),.XAI_0(1),.XAI_1(1),.XAI_2(1),
    .XAS_16(XA[16]),.XAS_17(XA[17]),.XAS_18(XA[18]),.XAS_19(XA[19]),
    .XRESET(reset),
    .XIOM(IOM),.XALE(ALE),.XINTA(INTA),.XHLDA(HLDA),.XXTAL(XTAL),.XLPL(1),.XTESTPIN(0),.XRDL(RDL),.XWRL(WRL),.XINTR(INTR),

    .outXAD_0(SS_outXAD[0]),.outXAD_1(SS_outXAD[1]),.outXAD_2(SS_outXAD[2]),.outXAD_3(SS_outXAD[3]),.outXAD_4(SS_outXAD[4]),.outXAD_5(SS_outXAD[5]),.outXAD_6(SS_outXAD[6]),.outXAD_7(SS_outXAD[7]),
    .outXA_8(SS_outXA[8]),.outXA_9(SS_outXA[9]),.outXA_10(SS_outXA[10]),.outXA_11(SS_outXA[11]),.outXA_12(SS_outXA[12]),.outXA_13(SS_outXA[13]),.outXA_14(SS_outXA[14]),.outXA_15(SS_outXA[15]),
    .outXD_8(SS_outXD[8]),.outXD_9(SS_outXD[9]),.outXD_10(SS_outXD[10]),.outXD_11(SS_outXD[11]),.outXD_12(SS_outXD[12]),.outXD_13(SS_outXD[13]),.outXD_14(SS_outXD[14]),.outXD_15(SS_outXD[15]),
    .enXAD_0(SS_enXAD[0]),.enXAD_1(SS_enXAD[1]),.enXAD_2(SS_enXAD[2]),.enXAD_3(SS_enXAD[3]),.enXAD_4(SS_enXAD[4]),.enXAD_5(SS_enXAD[5]),.enXAD_6(SS_enXAD[6]),.enXAD_7(SS_enXAD[7]),
    .enXA_8(SS_enXA[8]),.enXA_9(SS_enXA[9]),.enXA_10(SS_enXA[10]),.enXA_11(SS_enXA[11]),.enXA_12(SS_enXA[12]),.enXA_13(SS_enXA[13]),.enXA_14(SS_enXA[14]),.enXA_15(SS_enXA[15]),
    .enXD_8(SS_enXD[8]),.enXD_9(SS_enXD[9]),.enXD_10(SS_enXD[10]),.enXD_11(SS_enXD[11]),.enXD_12(SS_enXD[12]),.enXD_13(SS_enXD[13]),.enXD_14(SS_enXD[14]),.enXD_15(SS_enXD[15]),

    .outXVSYNCL(VSyncL),.outXHSYNCL(HSyncL),
    .outXJOYL_0(joy[0]),.outXJOYL_1(joy[1]),.outXJOYL_2(joy[2]),.outXDSP_IO(io),
    .enXVSYNCL(enVSyncL),.enXHSYNCL(enHSyncL),
    .enXJOYL_0(enjoy[0]),.enXJOYL_1(enjoy[1]),.enXJOYL_2(enjoy[2]),.enXDSP_IO(enio),

    .XA_0(latchedLowXA[0]),.XA_1(latchedLowXA[1]),.XA_2(latchedLowXA[2]),.XA_3(latchedLowXA[3]),.XA_4(latchedLowXA[4]),.XA_5(latchedLowXA[5]),.XA_6(latchedLowXA[6]),.XA_7(latchedLowXA[7]),
    .XA_16(latchedUpperXA[16]),.XA_17(latchedUpperXA[17]),

    .XPCLK(PCLK),.XHOLD(HOLD),
    .XSCEL_0(ScreenChipEnableL[0]),.XSCEL_1(ScreenChipEnableL[1]),.XWEL(SlipStreamWriteL),.XCSL_0(ChipSelectLow[0]),.XCSL_1(ChipSelectLow[1]),
    .XR_0(Red[0]),.XR_1(Red[1]),.XR_2(Red[2]),.XR_3(Red[3]),
    .XG_0(Green[0]),.XG_1(Green[1]),.XG_2(Green[2]),.XG_3(Green[3]),
    .XB_0(Blue[0]),.XB_1(Blue[1]),.XB_2(Blue[2]),.XB_3(Blue[3]),
    .XCHROMA(Chroma),.XLEFTL(leftL),.XLEFTH(leftH),.XRIGHTL(rightL),.XRIGHTH(rightH),
    .XINC(inc),.XAISEL(aiSel),.XOEL(oeL),.XCASL(casL),.XXTALO(xtalo),.XGPIOL_0(gpioL[0]),.XGPIOL_1(gpioL[1]),
	 .CCLK(CCLK),
    .DQCLK(qclk),.LEFTDAC(leftDAC),.RIGHTDAC(rightDAC),
    .FCLK(clk_sys),
    .SLIPADDRESS(slipAddress)
	 ,.BLANKING(blanking)
    );

/* verilator lint_on UNOPTFLAT */
/*
wire processorHeldClock;

assign processorHeldClock = (~HLDA) & PCLK;

always @(negedge PCLK)
begin
  HLDA<=(HOLD & RDL & WRL) | (HOLD & HLDA);
end

wire HLDAnever;
*/
m8088 Processor(
    .CORE_CLK(clk_sys),
    .CLK(PCLK),
    .RESET(reset),

    .READY(1'b1),
    .INTR(INTR),
    .NMI(1'b0),
    .HOLD(HOLD),

    .addr(cpuA),
    .dout(cpuDOut),
    .din(cpuDIn),

    .ALE(ALE),
    .INTA_n(INTAL),
    .RD_n(RDL),
    .WR_n(WRL),
    .IOM(IOM),
    .DTR(dtr),
    .DEN(den),
    .HOLDA(HLDA)
);

assign CLK_VIDEO = clk_sys;

assign VGA_DE = ~blanking;
assign VGA_HS = ~HSyncL;
assign VGA_VS = ~VSyncL;

assign VGA_G  = Green<<4;//(!col || col == 2) ? video : 8'd0;
assign VGA_R  = Red<<4;//(!col || col == 1) ? video : 8'd0;
assign VGA_B  = Blue<<4;//(!col || col == 3) ? video : 8'd0;
/*
always @(posedge clk_sys)
begin
	CE_PIXEL = Chroma;

	VGA_DE = ~blanking;
	VGA_HS = ~HSyncL;
	VGA_VS = ~VSyncL;

	VGA_G  = Green<<4;//(!col || col == 2) ? video : 8'd0;
	VGA_R  = Red<<4;//(!col || col == 1) ? video : 8'd0;
	VGA_B  = Blue<<4;//(!col || col == 3) ? video : 8'd0;
	
end
*/
endmodule
