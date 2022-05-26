
/* verilator lint_off DECLFILENAME */
module _74181(
	     input [3:0] A, B,
	     input [3:0] S,
	     input Ci,
	     input M,
	     output [3:0] F,
	     output Co
	     );

	wire [3:0] p;
	wire [3:0] g;
	wire [3:0] C;
	wire [3:0] sigma;

	wire CpA,CpB,CpC,CpD,Cp,Cg,Ml;

	assign Ml = ~M;

	assign p[0] = ~((A[0]) | (B[0] & S[0]) | (S[1] & (~B[0])));
	assign p[1] = ~((A[1]) | (B[1] & S[0]) | (S[1] & (~B[1])));
	assign p[2] = ~((A[2]) | (B[2] & S[0]) | (S[1] & (~B[2])));
	assign p[3] = ~((A[3]) | (B[3] & S[0]) | (S[1] & (~B[3])));

	assign g[0] = ~(((~B[0]) & S[2] & A[0]) | (A[0] & B[0] & S[3]));
	assign g[1] = ~(((~B[1]) & S[2] & A[1]) | (A[1] & B[1] & S[3]));
	assign g[2] = ~(((~B[2]) & S[2] & A[2]) | (A[2] & B[2] & S[3]));
	assign g[3] = ~(((~B[3]) & S[2] & A[3]) | (A[3] & B[3] & S[3]));

	assign C[0] = ~(Ml & Ci);
	assign C[1] = ~((Ml & p[0]) | (Ml & g[0] & Ci));
	assign C[2] = ~((Ml & p[1]) | (Ml & p[0] & g[1]) | (Ml & g[0] & g[1] & Ci));
	assign C[3] = ~((Ml & p[2]) | (Ml & p[1] & g[2]) | (Ml & p[0] & g[1] & g[2]) | (Ml & g[0] & g[1] & g[2] & Ci));

	assign sigma[0] = p[0] ^ g[0];
	assign sigma[1] = p[1] ^ g[1];
	assign sigma[2] = p[2] ^ g[2];
	assign sigma[3] = p[3] ^ g[3];

	assign F[0] = sigma[0] ^ C[0];
	assign F[1] = sigma[1] ^ C[1];
	assign F[2] = sigma[2] ^ C[2];
	assign F[3] = sigma[3] ^ C[3];

	assign Cg = ~(Ci & g[0] & g[1] & g[2] & g[3]);
	assign CpA = (p[0] & g[1] & g[2] & g[3]);
	assign CpB = (p[1] & g[2] & g[3]);
	assign CpC = (p[2] & g[3]);
	assign CpD = p[3];

	assign Cp = ~(CpA | CpB | CpC | CpD);

	assign Co = (~Cg) | (~Cp);

endmodule
/* verilator lint_on DECLFILENAME */

module DFT1811A
(
    input         clk,
    input [3:0]   S,
    input [15:0]  A,
    input [15:0]  B,
    input         CIL,
    input         M,
    output        X,
    output        Y,
    output        CO,
    output [15:0] Z,
    output        AEB
);

reg [16:0] t /* verilator public */;

wire [16:0] Ax /* verilator public */;
wire [16:0] Bx /* verilator public */;
wire [16:0] CI /* verilator public */;

wire c0,c1,c2,c3;

    _74181 G0 (.A(A[3:0]),.B(B[3:0]),.S(S),.Ci(CIL),.M(M),.F(t[3:0]),.Co(c0));
    _74181 G1 (.A(A[7:4]),.B(B[7:4]),.S(S),.Ci(c0),.M(M),.F(t[7:4]),.Co(c1));
    _74181 G2 (.A(A[11:8]),.B(B[11:8]),.S(S),.Ci(c1),.M(M),.F(t[11:8]),.Co(c2));
    _74181 G3 (.A(A[15:12]),.B(B[15:12]),.S(S),.Ci(c2),.M(M),.F(t[15:12]),.Co(CO));

    assign Z = t;

assign X=0; // Never used
assign Y=0; // Never used
assign AEB=A==B;

endmodule

//module DFT1811A
//(
//    input         clk,
//    input [3:0]   S,
//    input [15:0]  A,
//    input [15:0]  B,
//    input         CIL,
//    input         M,
//    output        X,
//    output        Y,
//    output        CO,
//    output [15:0] Z,
//    output        AEB
//);
//
//reg [16:0] t /* verilator public */;
//
//wire [16:0] Ax /* verilator public */;
//wire [16:0] Bx /* verilator public */;
//wire [16:0] CI /* verilator public */;
//
//assign Ax = {1'b0,A};
//assign Bx = {1'b0,B};
//assign CI = {{16{1'b0}},~CIL};
//
//assign CO = ({M,S}==5'b0_0110)?t[16]:~t[16];
////assign CI = ~CIL;
//assign Z = t[15:0];
//
//assign X=0; // Never used
//assign Y=0; // Never used
//assign AEB=A==B;
//
//always @(posedge clk)
//begin
//    case ({M,S})
//
//        5'b0_0000:  t <= Ax + CI;
//        5'b0_0001:  t <= (Ax | Bx) + CI;
//        5'b0_0010:  t <= (Ax | (~Bx )) + CI;
//        5'b0_0011:  t <= 17'h1FF + CI;
//        5'b0_0100:  t <= (Ax + (Ax & (~Bx))) + CI;
//        5'b0_0101:  t <= ((Ax | Bx) + (Ax & (~Bx))) + CI;
//        5'b0_0110:  t <= ((Ax - Bx) - 17'h001) + CI;
//        5'b0_0111:  t <= ((Ax & (~Bx)) - 1) + CI;
//        5'b0_1000:  t <= (Ax + (Ax & Bx)) + CI;
//        5'b0_1001:  t <= (Ax + Bx) + CI;
//        5'b0_1010:  t <= ((Ax | (~Bx)) + (Ax & Bx)) + CI;
//        5'b0_1011:  t <= ((Ax & Bx) - 17'h001) + CI;
//        5'b0_1100:  t <= (Ax + Ax) + CI;
//        5'b0_1101:  t <= ((Ax | Bx) + Ax) + CI;
//        5'b0_1110:  t <= ((Ax | (~Bx)) + Ax) + CI;
//        5'b0_1111:  t <= (Ax - 17'h001) + CI;
//
//        5'b1_0000:  t <= ~Ax;
//        5'b1_0001:  t <= ~(Ax | Bx);
//        5'b1_0010:  t <= (~Ax) & Bx;
//        5'b1_0011:  t <= 17'h000;
//        5'b1_0100:  t <= ~(Ax & Bx);
//        5'b1_0101:  t <= ~Bx;
//        5'b1_0110:  t <= Ax ^ Bx;
//        5'b1_0111:  t <= Ax & (~Bx);
//        5'b1_1000:  t <= (~Ax) | Bx;
//        5'b1_1001:  t <= ~(Ax ^ Bx);
//        5'b1_1010:  t <= Bx;
//        5'b1_1011:  t <= Ax ^ Bx;
//        5'b1_1100:  t <= 17'h0FF;
//        5'b1_1101:  t <= Ax | (~Bx);
//        5'b1_1110:  t <= Ax | Bx;
//        5'b1_1111:  t <= Ax;
//    endcase
//end
//
//endmodule