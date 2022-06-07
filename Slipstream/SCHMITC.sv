module SCHMITC
(
    input A,
`ifndef NO_TEST_SIGNALS
    input PI,
    output reg PO,
`endif
    output reg Z,

    input MasterClock
);

always @(posedge MasterClock)
begin

    Z <= A;
`ifndef NO_TEST_SIGNALS
    PO <= ~(PI & A); 
`endif 

end

endmodule

