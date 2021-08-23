
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module result(
input 			clk, 
input [11:0] timein, 
input        clk2,
input 		 enable,
output [11:0] timeout,
input game_over,
input [2:0] address,
output [3:0] print 
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [9:0] count;
reg [9:0] c_count;
reg done1; 
reg e;

//=======================================================
//  time
//=======================================================
always @(*) begin
	done1=1'b0;
//else begin
	if(e==1'b1) begin
		c_count=count + 1;
	if(count==10'b00011_00100) begin
		c_count=10'b0000_0000_00;
		done1=1'b1;
	end
 end/*
 if((reset==1'b0)||(set==1'b1)) begin
		c_count=10'b0000_0000_00;
	end*/
end
//end
always @(posedge clk) begin 
		count<=c_count;
end 

//=======================================================
reg [15:0]  mem[0:127];
reg [2:0] addr;

always @(posedge clk2) begin
	if(enable==1'b1) begin
		mem[address] <= #1 timein;
	end
end

reg[2:0] addc;
reg [11:0] value;
//new
reg [2:0] s, s_c; 
always @(*) begin
	s=s_c+1;
	e=1'b1;
	if(s_c==3'b001) begin
		s=3'b001;		
		if(count==10'b00001_00100) begin
			s=3'b010;
		end
	end
	if(s_c==3'b010) begin
		s=3'b010;
		if(count==10'b00001_00100) begin
			s=3'b011;
		end
	end
	if(s_c==3'b011) begin
		s=3'b011;
		if(count==10'b00001_00100) begin
			s=3'b100;
		end
	end
	if(s_c==3'b100)begin
		s=3'b100;
		if(count==10'b00001_00100)begin
			s=3'b001;
		end
	end
end
//

/*
always @(*)begin
	e=1'b1;
	addc=addr;
	if(game_over==1'b1) begin
		if(addr==3'b101) begin
			addc=3'b001;
		end
		if(count==10'b00001_00100) begin
			addc=addr+1'b1; 
		end
	end
end
*/
always @(posedge clk) begin
			value <= mem[s_c]; 
			s_c<=s;
end

assign timeout=value;

reg [3:0] p;
always @(*) begin
	if(s_c==3'b001) begin
		p=4'b1010;end
	if(s_c==3'b010) begin
		p=4'b1011; end
	if(s_c==3'b011) begin
		p=4'b1100;
	end
	if(s_c==3'b100) begin
		p=4'b1101; end
end

assign print = p;
endmodule
