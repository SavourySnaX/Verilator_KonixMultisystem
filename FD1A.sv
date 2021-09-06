/* DTYPE LATCH */
/* verilator lint_off UNOPTFLAT */

module FD1A
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




