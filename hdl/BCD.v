
module BCD(

//////////// CLOCK //////////
input     [9:0] SW,
input [9:0] twos,
output wire out1,
output wire [11:0] outf,
output wire overload
//output [7:0] HEX5 
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [12:0] dec,x,y,z,hun, d, decf;
reg [4:0] ten;
reg out11;
//=======================================================
//  Structural coding
//=======================================================
reg over;
always @(*) begin
	hun = 12'd100;
	ten = 4'b1010;
//if(twos[9] == 1'b1) begin
//	out11 = 1'b0;
//	dec=12'h200-twos[8:0];
	//dec[9:0] = ~twos[9:0] + 1'b1;
//end
//else begin
//	out11 = 1'b1;
	dec = twos;
//end
if(dec>=900)
	decf[11:8]=4'b1001;
if(dec>=800&&dec<900)
	decf[11:8]=4'b1000;
if(dec>=700&&dec<800)
	decf[11:8]=4'b0111;
if(dec>=600&&dec<700)
	decf[11:8]=4'b0110;
if(dec>=500&&dec<600)
	decf[11:8]=4'b0101;
if(dec>=400&& dec<500) 
	decf[11:8]=4'b0100;
	
if(dec>=300 && dec<400) 
	decf[11:8]=4'b0011;
if(dec >= 200 && dec < 300)
	decf[11:8] = 4'b0010;
if(dec >= 100 && dec < 200)
	decf[11:8] = 4'b0001;
	
if(dec<100)
	decf[11:8]=4'b0000;

	x = decf[11:8]*hun;
	d = dec - x;
	
if(d >= 90 && d < 100)
	decf[7:4] = 4'b1001;
if(d >= 80 && d < 90)
	decf[7:4] = 4'b1000;

if(d >= 70 && d < 80)
	decf[7:4] = 4'b0111;

if(d >= 60 && d < 70)
	decf[7:4] = 4'b0110;

if(d >= 50 && d < 60)
	decf[7:4] = 4'b0101;

if(d >= 40 && d < 50)
	decf[7:4] = 4'b0100;
if(d >= 30 && d < 40)
	decf[7:4] = 4'b0011;
if(d >= 20 && d < 30)
	decf[7:4] = 4'b0010;
if(d >= 10 && d < 20)
	decf[7:4] = 4'b0001;
	
if(d<10)
	decf[7:4]=4'b0000;
	
y = decf[7:4] * ten;
	decf[3:0] = d - y;

if(SW[6:2]==5'b00000) 
	out11 =1'b0;
end


assign out1 = out11;
assign outf = decf;
assign overload =over;
endmodule
