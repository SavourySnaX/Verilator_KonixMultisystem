/* DTYPE LATCH */

module FD2A
(
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

endmodule




