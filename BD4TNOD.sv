module BD4TNOD
(
    input   I,
    input   EN,
    input   TN,
    input   PI,
    output  O,
    output  E,
    output  ZI,
    output  PO
);

assign PO = ~((~I) & PI);
assign ZI = ~I;
assign E = ~(~((~EN) & TN));
assign O = E ? 1'b0 : I;

endmodule
