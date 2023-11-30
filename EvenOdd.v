module EvenOdd (count,a,b, result,carry_out);

input [2:0] count;
input [15:0] a,b;
output reg [15:0] result;
output reg carry_out;

always @ (*)
begin
	if(count[0])
	{carry_out,result}=a+b;
	else
	{carry_out,result}=a&b;
	
end
endmodule