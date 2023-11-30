module rom (addr,dout);
input [4:0] addr;
output [15:0] dout;

reg [15:0] mem [31:0];
initial 
begin 
$readmemb("C:\Users\ranabadran\Desktop\hmy\LAB6\ROM.txt",mem,0,31);
end

assign dout = mem[addr];


endmodule