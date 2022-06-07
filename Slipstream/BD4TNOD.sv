module BD4TNOD
(
    input   I,
    input   TN,
    output  reg O,
    output  reg E,
    output  reg ZI,
`ifndef NO_TEST_SIGNALS
    input   EN,
    input   PI,
    output  reg PO,
`endif

    input   MasterClock
);

always @(posedge MasterClock)
begin

`ifdef NO_TEST_SIGNALS
    ZI<=~I;
    E<=TN;
    O<=TN?1'b0:I;
`else
    PO <= ~((~I) & PI);
    ZI <= ~I;
    E <= ~(~((~EN) & TN));
    O <= E ? 1'b0 : I;
`endif

end

endmodule
