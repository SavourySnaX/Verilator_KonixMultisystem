
module DMB2212A
(
    input   [15:0]  X,
    input   [15:0]  Y,
    input   [35:0]  R,
    input           TCX,
    input           TCY,
    output  [36:0]  Z
);

assign Z = R+(X*Y);

endmodule