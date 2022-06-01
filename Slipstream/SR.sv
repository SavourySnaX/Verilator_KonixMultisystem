module SR
(

    input    MasterClock,
    input    S,
    input    R,
    output    reg Q,
    output    reg QL
);

always @(posedge MasterClock)
begin
	Q <= ~(S & QL);
	QL <= ~(R & Q);
end
endmodule
