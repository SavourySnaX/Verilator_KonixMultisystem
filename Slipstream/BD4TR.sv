module BD4TR
(
    input   I,
    input   A,
`ifndef NO_TEST_SIGNALS
    input   EN,
    input   PI,
    output  reg PO,
`endif
    input   TN,
    output  reg O,
    output  reg E,
    output  reg ZI,

    input MasterClock
);

always @(posedge MasterClock)
begin

`ifdef NO_TEST_SIGNALS
    O<=TN ? A : I;
    ZI<=I;
    E<=TN;
`else
    PO <= ~(I & PI);
    ZI <= I;
    E <= ~(~((~EN) & TN));
    O <= E ? A : I;
`endif

end

endmodule
