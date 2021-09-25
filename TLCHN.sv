// Bassed on Inverted LVTTL Input buffer

module TLCHN
(
    input I,
    input PI,
    output O,
    output PO
);

assign PO = ~(PI & O);
assign O = ~I;

endmodule