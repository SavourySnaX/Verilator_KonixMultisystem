/* DTYPE LATCH reset Low */

module FD2A
(
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
	if (~rL) begin
		latchedData <= 1'b0;
	end else begin
		latchedData <= d;
	end
end

endmodule



