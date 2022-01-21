/* JK flip flop */

module FJK1A
(
    input MasterClock,
    input j,
    input k,
    input clk,
    output q,
    output qL
);

reg latchedData = 1'b0;

assign q = latchedData;
assign qL= ~latchedData;

always @(posedge clk)
begin
    case ({j,k})
        2'b00 : latchedData <= latchedData;
        2'b01 : latchedData <= 0;
        2'b10 : latchedData <= 1;
        2'b11 : latchedData <= ~latchedData;
    endcase
end

/*
reg [1:0] transition= 1'b00;
//always @ (posedge clk)
always @(posedge MasterClock)
begin
	transition <= transition<<1;
	transition[0]<=clk;
	if (transition[1]==0 && transition[0]==1) begin
        case ({j,k})
            2'b00 : latchedData <= latchedData;
            2'b01 : latchedData <= 0;
            2'b10 : latchedData <= 1;
            2'b11 : latchedData <= ~latchedData;
        endcase
    end
end
*/
endmodule