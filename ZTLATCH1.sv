/* ZTLATCH1B is a tristate transmission latch with inverted output
the clock and enable are active low */

module ZTLATCH1
(
    inout QB,
    input D,
    input CLK,
    input ENL
);

wire QI,QIB;
LD1A QI_(.q(QI),.qL(QIB),.d(D),.en(CLK));
assign QB = ~ENL ? QI : 1'bZ;

endmodule
