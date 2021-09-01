/* transparent latch - active high */

module LD1A
(
    input d,
    input en,
    output reg q,
    output reg qL
);

always @(en or d)
begin
	if (en) begin
        q = d;
        qL = ~d;
	end
end

endmodule