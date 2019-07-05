module data_mux_reg(data,aluout,lui,pcaddress,MemToReg,finalres);

input [0:31] data,aluout,lui,pcaddress;
input [0:1] MemToReg;
output [0:31] finalres;

assign finalres = MemToReg == 0? aluout:
	MemToReg == 2? lui:
	MemToReg == 3? pcaddress:
	MemToReg == 1? data : 0;



endmodule