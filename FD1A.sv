/* DTYPE LATCH */

module FD1A
(
	input   MasterClock,
	output	q,
	output	qL,
	input	d,
	input	clk
);

reg latchedData = 1'b0;

assign q = latchedData;
assign qL = ~latchedData;

always @(posedge clk)
begin	
	latchedData <= d;
end

/*
reg [1:0] transition= 1'b00;

//always @(posedge clk)
always @(posedge MasterClock)
begin
	transition <= transition<<1;
	transition[0]<=clk;
	if (transition[1]==1 && transition[0]==0)
    	latchedData <= d;
end
*/
endmodule




