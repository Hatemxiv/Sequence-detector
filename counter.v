module counter(clear,enable,clk,rst,count);

input clear,enable,clk,rst;
integer i=0;
output [2:0]count;
always@(posedge clk or negedge clear)
begin

if (~clear)
i=0;

else if(enable&&(i<5))

i=i+1;
end
assign count =i;

endmodule