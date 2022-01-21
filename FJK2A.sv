/* JK flip flop - with clear */

module FJK2A
(
    input MasterClock,
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

always @(posedge clk or negedge rL)
begin
    if (~rL)
        latchedData <= 1'b0;
    else
        case ({j,k})
            2'b00 : latchedData <= latchedData;
            2'b01 : latchedData <= 1'b0;
            2'b10 : latchedData <= 1'b1;
            2'b11 : latchedData <= ~latchedData;
        endcase
end

/*
reg [1:0] transition= 1'b00;
//always @ (posedge clk, negedge rL)
always @(posedge MasterClock)
begin
	transition <= transition<<1;
	transition[0]<=clk;
    if (~rL)
        latchedData <= 1'b0;
    else
	    if (transition[1]==0 && transition[0]==1) begin
            case ({j,k})
                2'b00 : latchedData <= latchedData;
                2'b01 : latchedData <= 1'b0;
                2'b10 : latchedData <= 1'b1;
                2'b11 : latchedData <= ~latchedData;
            endcase
        end
end
*/
endmodule
