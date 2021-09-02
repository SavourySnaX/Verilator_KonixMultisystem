/* JK flip flop - with clear */

module FJK2A
(
    input j,
    input k,
    input clk,
    input rL,
    output q,
    output qL
);

reg latchedData = 1'b0;

assign q = latchedData;
assign qL= ~latchedData;

always @ (posedge clk, negedge rL)
    if (~rL)
        latchedData <= 1'b0;
    else
        case ({j,k})
            2'b00 : latchedData <= latchedData;
            2'b01 : latchedData <= 1'b0;
            2'b10 : latchedData <= 1'b1;
            2'b11 : latchedData <= ~latchedData;
        endcase

endmodule
