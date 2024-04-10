module eight_bit_ram(
		input wire clk,
		input wire rst,
		input wire wr_rd_en,
		input wire [7:0]data_in,
		input wire [2:0]addr,
		output reg [7:0]data_out);
integer i;
reg [7:0]memory[0:7];
always @(posedge clk or posedge rst) begin
	if(rst) begin
		for (i=0; i<8; i=i+1 ) begin
			memory[i]<=8'b0;
		end
	end 
	else begin
		if(wr_rd_en) begin
			memory[addr]<=data_in;
		end
		else begin
			data_out<=memory[addr];
		end
	end
end
endmodule
