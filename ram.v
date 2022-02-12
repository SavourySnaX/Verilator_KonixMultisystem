
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

reg [data_width-1:0] memory[(1<<addr_width)-1:0];
reg [data_width-1:0] dout = {data_width{1'b0}};

assign Q = dout;//{data_width{oe & cs}} & dout;// ? dout : {data_width{1'b0}};

reg lastWr;
reg lastRd;
always @(posedge clk) begin
  lastWr<=wr;
  lastRd<=oe;
  if (cs) 
  begin
    if (wr)
    begin
      memory[addr] <= din;
      if (lastWr==1 && wr==0) 
        if ((file=="sramE.mem" || file=="sramO.mem") && (addr<16'h28a8 || addr>16'h28f8))
          $display("RAM Write : %s %0h <- %0h",file,addr,din);
      end
    else
      dout <= memory[addr];
      //if (lastRd==0 && oe==1)
  end
end

initial begin
  $readmemh(file, memory);
end

endmodule
