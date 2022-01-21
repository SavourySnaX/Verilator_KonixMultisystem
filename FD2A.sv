/* DTYPE LATCH reset Low */

module FD2A
(
	input   MasterClock,
	output	q,
	output	qL,
	input	d,
	input	clk,
	input	rL
);

reg latchedData = 1'b0;
assign q = latchedData;
assign qL = ~latchedData;

always @(posedge clk or negedge rL)
begin
	if (~rL)
		latchedData <= 1'b0;
	else
		latchedData <= d;
end

/*

reg [1:0] transition= 1'b00;
//always @(posedge clk or negedge rL)
always @(posedge MasterClock)
begin
	transition <= transition<<1;
	transition[0]<=clk;
	if (~rL) begin
		latchedData <= 1'b0;
	end else if (transition[1]==1 && transition[0]==0) begin
		latchedData <= d;
	end
end

*/
endmodule



