module piso(in, load,reset ,clk, serial_out);
input [15:0]in;
input load , reset,clk;
output reg serial_out;
integer i=0;
always@(posedge clk, negedge reset)
begin
if (~reset)
	begin
	serial_out=0;
	i=0;
	end
	else if(load&&(i<16))
	begin
	serial_out=in[i];
	i=i+1;
	end
	
	end
endmodule 