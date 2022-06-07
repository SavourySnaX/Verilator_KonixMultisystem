
module BT4OS
(
    input   EN,
`ifndef NO_TEST_SIGNALS
    input   TN,
`endif
    output  Z
);

`ifdef NO_TEST_SIGNALS
assign Z = EN;
`else
assign Z = (TN & ~(EN)) ? 1'b0 : 1'b1;    // technically 1 should float i think.. revisit when i have a cpu to care about
`endif

endmodule