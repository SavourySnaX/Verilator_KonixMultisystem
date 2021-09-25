
module DFT1811A
(
    input [3:0] S,
    input [15:0] A,
    input [15:0] B,
    input        CI,
    input        M,
    output       X,
    output       Y,
    output       CO,
    output [15:0] Z,
    output        AEB
);

// TOOD 
// X,Y => P & G
// AEB => A == B
assign X=0;
assign Y=0;
assign Z=A+B;
assign CO=CI;
assign AEB=A==B;


endmodule