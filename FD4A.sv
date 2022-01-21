/* DTYPE LATCH preset Low */

module FD4A
(
	input   MasterClock,
	output	q,
	output	qL,
	input	d,
	input	clk,
	input	sL
);

reg latchedData = 1'b1;

assign q = latchedData;
assign qL = ~latchedData;

always @(posedge clk or negedge sL)
begin
	if (~sL)
		latchedData <= 1'b1;
	else
		latchedData <= d;
end

/*

reg [1:0] transition= 1'b00;
//always @(posedge clk or negedge sL)
always @(posedge MasterClock)
begin
	transition <= transition<<1;
	transition[0]<=clk;
	if (~sL) begin
		latchedData <= 1'b1;
	end else if (transition[1]==1 && transition[0]==0) begin
		latchedData <= d;
	end
end
*/
endmodule




