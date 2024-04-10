`timescale 1ns/1ps

module ram_tb;

reg clk,rst,wr_rd_en;
reg [7:0]data_in;
reg [2:0]addr;
wire [7:0]data_out;

eight_bit_ram dut(
	.clk(clk),
	.rst(rst),
	.wr_rd_en(wr_rd_en),
	.data_in(dat_in),
	.data_out(data_out));
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
wr_rd_en=0;
data_in=8'b0;
addr=3'b0;
#10 rst=0;

//Write data
wr_rd_en=1;
data_in=8'b10101010;
addr=3'b0;
#10 wr_rd_en=0;

//Read data
wr_rd_en=0;
addr=3'b0;
#10
$display("DATA_OUT : %b",data_out);
end
endmodule