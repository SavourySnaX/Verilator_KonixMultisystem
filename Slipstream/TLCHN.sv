// Bassed on Inverted LVTTL Input buffer

module TLCHN
(
    input I,
    output reg O,
`ifndef NO_TEST_SIGNALS
    input PI,
    output reg PO,
`endif
    input MasterClock
);

always @(posedge MasterClock)
begin

`ifndef NO_TEST_SIGNALS
    PO <= ~(PI & O);
`endif
    O <= ~I;

end

endmodule