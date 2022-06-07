module IBUFN
(
    input A,
    output Z
`ifndef NO_TEST_SIGNALS
    ,input PI,
    output PO
`endif
);

assign Z = ~A;
`ifndef NO_TEST_SIGNALS
assign PO = ~(PI & ~A);
`endif 

endmodule
