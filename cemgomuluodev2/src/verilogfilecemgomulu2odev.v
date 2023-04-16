module single_port_ram(data_in , ram_address,write_enable,clk,data_out);
  input [15:0] data_in;
  input [15:0] ram_address;
  input write_enable;
  input clk;
  input read_enable;
  output [15:0] data_out;

  reg [15:0] ram_memory[31:0]; 
  reg [15:0] address_register;

  always @(posedge clk)
  begin
    if (write_enable)
      ram_memory[ram_address] <= data_in;
    else 
      address_register <= ram_address;
   end
  
  always @(negedge clk)
  begin
    if (read_enable)
      data_out <= ram_memory[ram_address];
    else 
    address_register <= ram_address;
  end
endmodule