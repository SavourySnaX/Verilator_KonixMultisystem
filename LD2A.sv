/* transparent latch - active low? */

module LD2A
(
    input d,
    input en,
    output reg q,
    output reg qL
);

always @(en or d)
begin
	if (~en) begin
        q = d;
        qL = ~d;
	end
end

endmodule
