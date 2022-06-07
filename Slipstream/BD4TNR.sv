module BD4TNR
(
    input   I,
    input   A,
    output  reg O,
    output  reg E,
    output  reg ZI,
    input   TN,
`ifndef NO_TEST_SIGNALS
    input   EN,
    input   PI,
    output  reg PO,
`endif
    input MasterClock
);

always @(posedge MasterClock)
begin

`ifdef NO_TEST_SIGNALS
    O<=TN ? A : I;
    E<=TN;
    ZI<=~I;
`else
    PO <= ~((~I) & PI);
    ZI <= ~I;
    E <= ~(~((~EN) & TN));
    O <= E ? A : I;
`endif 

end

endmodule