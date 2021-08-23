
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module seg7(
	output	reg	     [6:0]		OUT3,
	input 	nothing,
	input 	over,
	input 		     [3:0]		W,
	input 	[3:0] other
);

reg [6:0] OUT1, OUT;

always @(*) begin
if(nothing ==1'b1) begin
	OUT[6]=1'b0; OUT[0]=1'b1;OUT[1]=1'b1;OUT[2]=1'b1;OUT[3]=1'b1;OUT[4]=1'b1;OUT[5]=1'b1;
end
else begin
case({W[3],W[2],W[1],W[0]})
	4'b0000:
	begin OUT[6]=1'b1; OUT[5]=1'b0;OUT[4]=1'b0;OUT[3]=1'b0;OUT[2]=1'b0;OUT[1]=1'b0;OUT[0]=1'b0;end
	4'b0001:begin
	OUT[0]=1'b1;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b1;OUT[4]=1'b1;OUT[5]=1'b1;OUT[6]=1'b1;end
	4'b0010:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b1;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b1;OUT[6]=1'b0;end
	4'b0011:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b1;OUT[5]=1'b1;OUT[6]=1'b0;end
	4'b0100:begin
	OUT[0]=1'b1;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b1;OUT[4]=1'b1;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b0101:begin
	OUT[0]=1'b0;OUT[1]=1'b1;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b1;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b0110:begin
	OUT[0]=1'b0;OUT[1]=1'b1;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b0111:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b1;OUT[4]=1'b1;OUT[5]=1'b1;OUT[6]=1'b1;end
	4'b1000:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b1001:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b1;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b1010:begin
	OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b1;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b1011:begin
	OUT[0]=1'b1;OUT[1]=1'b1;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b1100:begin
	OUT[0]=1'b0;OUT[1]=1'b1;OUT[2]=1'b1;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b1;end
	4'b1101:begin
	OUT[0]=1'b1;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b1;OUT[6]=1'b0;end
	4'b1110:begin
	OUT[0]=1'b0;OUT[1]=1'b1;OUT[2]=1'b1;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
	4'b1111:begin
	OUT[0]=1'b0;OUT[1]=1'b1;OUT[2]=1'b1;OUT[3]=1'b1;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;end
endcase

case({other[3],other[2],other[1],other[0]})
	4'b0000:
	begin OUT1[6]=1'b1; OUT1[5]=1'b0;OUT1[4]=1'b0;OUT1[3]=1'b0;OUT1[2]=1'b0;OUT1[1]=1'b0;OUT1[0]=1'b0;end
	4'b0001:begin
	OUT1[0]=1'b1;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b1;OUT1[4]=1'b1;OUT1[5]=1'b1;OUT1[6]=1'b1;end
	4'b0010:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b1;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b1;OUT1[6]=1'b0;end
	4'b0011:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b1;OUT1[5]=1'b1;OUT1[6]=1'b0;end
	4'b0100:begin
	OUT1[0]=1'b1;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b1;OUT1[4]=1'b1;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b0101:begin
	OUT1[0]=1'b0;OUT1[1]=1'b1;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b1;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b0110:begin
	OUT1[0]=1'b0;OUT1[1]=1'b1;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b0111:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b1;OUT1[4]=1'b1;OUT1[5]=1'b1;OUT1[6]=1'b1;end
	4'b1000:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b1001:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b1;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b1010:begin
	OUT1[0]=1'b0;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b1;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b1011:begin
	OUT1[0]=1'b1;OUT1[1]=1'b1;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b1100:begin
	OUT1[0]=1'b0;OUT1[1]=1'b1;OUT1[2]=1'b1;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b1;end
	4'b1101:begin
	OUT1[0]=1'b1;OUT1[1]=1'b0;OUT1[2]=1'b0;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b1;OUT1[6]=1'b0;end
	4'b1110:begin
	OUT1[0]=1'b0;OUT1[1]=1'b1;OUT1[2]=1'b1;OUT1[3]=1'b0;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
	4'b1111:begin
	OUT1[0]=1'b0;OUT1[1]=1'b1;OUT1[2]=1'b1;OUT1[3]=1'b1;OUT1[4]=1'b0;OUT1[5]=1'b0;OUT1[6]=1'b0;end
endcase
end
//	if(over==1'b1) begin
		//OUT[0]=1'b0;OUT[1]=1'b0;OUT[2]=1'b0;OUT[3]=1'b0;OUT[4]=1'b0;OUT[5]=1'b0;OUT[6]=1'b0;
//end
end
//assign HEX0=OUT;
always @(*)begin
	if(over==1'b1)begin
		OUT3=OUT1;
	end
	else 
	OUT3=OUT;
end

endmodule