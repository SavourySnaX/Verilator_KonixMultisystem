/* JK flip flop */

module FJK1A
(
    input j,
    input k,
    input clk,
    output q,
    output qL
);

reg latchedData = 1'b0;

assign q = latchedData;
assign qL= ~latchedData;

always @ (posedge clk)
    case ({j,k})
        2'b00 : latchedData <= latchedData;
        2'b01 : latchedData <= 0;
        2'b10 : latchedData <= 1;
        2'b11 : latchedData <= ~latchedData;
    endcase

endmodule