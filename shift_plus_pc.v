module shift_plus_pc(shiftin,pcin,jaddress);

input [0:27] shiftin;
input [0:31] pcin;
output reg [0:31] jaddress;

always @(*)begin
    jaddress[0:3] <= pcin[0:3];
    jaddress[4:31] <= shiftin;
end

endmodule