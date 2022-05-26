
module ram
#(
  parameter addr_width=16,
  parameter data_width=8,
  parameter file="zero.mem"
)
(
  input clk,
  input [data_width-1:0] din,
  input [addr_width-1:0] addr,
  input cs,
  input oe,
  input wr,
  output [data_width-1:0] Q
);

reg [data_width-1:0] memory[(1<<addr_width)-1:0] /* verilator public */;
reg [data_width-1:0] dout = {data_width{1'b0}};

assign Q = dout;//{data_width{oe & cs}} & dout;// ? dout : {data_width{1'b0}};

reg lastWr;
reg lastRd;
always @(negedge clk) begin
  lastWr<=wr;
  lastRd<=oe;
  if (cs) 
  begin
    if (wr)
    begin
      memory[addr] <= din;
      end
    else
      dout <= memory[addr];
  end
end

initial begin
  $readmemh(file, memory);
end

endmodule
