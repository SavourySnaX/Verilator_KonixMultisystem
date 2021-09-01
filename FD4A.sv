/* DTYPE LATCH preset Low */

module FD4A
(
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
	if (~sL) begin
		latchedData <= 1'b1;
	end else begin
		latchedData <= d;
	end
end

endmodule




