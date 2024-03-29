module reg_file(clk,readadd1,readadd2,writeadd,writedata,RegWrite,readdata1,readdata2);

input clk;
input [0:4] readadd1;
input [0:4] readadd2;
input [0:4] writeadd;
input [0:31] writedata;
input [0:1] RegWrite;
output reg [0:31] readdata1,readdata2;

reg [0:31] regmem [31:0];
reg [0:31] lui;

initial
begin
	regmem[0] <= 32'b00000000000000000000000000000000;
	regmem[8] <= 32'b00000000000000000000000000000001; //t0=1
	regmem[9] <= 32'b00000000000000000000000000000010; //t1=2
	regmem[10] <= 32'b00000000000000000000000000000100; //t2=4
	regmem[11] <= 32'b00000000000000000000000000000011; //t3=3
	regmem[12] <= 32'b00000000000000000000000000000101; //t4=5
	regmem[13] <= 32'b00000000000000000000000000000110; //t5=6
	regmem[14] <= 32'b00000000000000000000000000000111; //t6=7
	regmem[15] <= 32'b00000000000000000000000000001000; //t7=8
	regmem[16] <= 32'b00000000000000000000000000001001; //s0=9
	regmem[17] <= 32'b00000000000000000000000000001010; //s1=10
	regmem[18] <= 32'b00000000000000000000000000001011; //s2=11
	regmem[19] <= 32'b00000000000000000000000000001100; //s3=12
	regmem[20] <= 32'b00000000000000000000000000001101; //s4=13
	regmem[21] <= 32'b00000000000000000000000000001110; //s5=14
	regmem[22] <= 32'b00000000000000000000000000001111; //s6=15
	regmem[23] <= 32'b00000000000000000000000000010000; //s7=16
	regmem[24] <= 32'b00000000000000000000000000010001; //t8=17
	regmem[25] <= 32'b00000000000000000000000000010010; //t9=18
	regmem[29] <= 32'd252;
	regmem[31] <= 32'b00000000000000000000000000000000;
end


always @(posedge clk)
begin
	readdata1 <= regmem[readadd1];
	readdata2 <= regmem[readadd2];
	/*if (RegWrite == 1'b1) begin
		$writememb("out.txt",regmem);
	end*/
end

always @(negedge clk)
begin
	case (RegWrite)
	2'b01: begin
		regmem[writeadd] <= writedata;
		$writememb("out.txt",regmem);
	end 
	2'b10: begin
		lui[0:15] = writedata[16:31];
		lui[16:31] = 1'b0;
		regmem[writeadd] <= lui;
		$writememb("out.txt",regmem);
	end
	2'b11: begin
		regmem[writeadd] <= writedata;
		$writememb("out.txt",regmem);
	end 
	endcase
end

endmodule