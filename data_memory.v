module data_memory(clk,address,writedata,MemRead,MemWrite,data);

input clk;
input [0:31] address,writedata;
input [0:1] MemWrite;
input [0:2] MemRead;
output reg [0:31] data;
reg [0:7] datamem [2047:0];

initial
begin
    $readmemb("datamem.txt",datamem);
end

always @(negedge clk)
case(MemWrite)
    2'b11: begin //sw
        datamem[address] = writedata[0:7];
        datamem[address+1] = writedata[8:15];
        datamem[address+2] = writedata[16:23];
        datamem[address+3] = writedata[24:31];
        $writememb("out2.txt",datamem);
    end
    2'b10: begin //sh
        datamem[address+2] = writedata[16:23];
        datamem[address+3] = writedata[24:31];
        $writememb("out2.txt",datamem);
    end
    2'b01: begin //sb
        datamem[address+3] = writedata[24:31];
        $writememb("out2.txt",datamem);
    end
endcase

always @(posedge clk)
case (MemRead)
    3'b110:begin //lw
        data[0:7] = datamem[address];
        data[8:15] = datamem[address+1];
        data[16:23] = datamem[address+2];
        data[24:31] = datamem[address+3];
    end
    3'b100:begin //lb
        data[0:7] = 1'b0;
        data[8:15] = 1'b0;
        data[16:23] = 1'b0;
        data[24:31] = datamem[address+3];
    end
    3'b010:begin //lh
        data[0:7] = 1'b0;
        data[8:15] = 1'b0;
        data[16:23] = datamem[address+2];
        data[24:31] = datamem[address+3];
    end
    3'b111:begin //lui
        data[0:7] = datamem[address];
        data[8:15] = datamem[address+1];
        data[16:23] = 1'b0;
        data[24:31] = 1'b0;
    end
endcase

endmodule