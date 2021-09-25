module BD4TNR
(
    input   I,
    input   A,
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
assign O = E ? A : I;

endmodule