module clock(input CLK, input reset, output wire clk50hz);
reg [19:0] count;
reg [19:0] c_count;
reg go;

always @ (*) begin
	go=1'b0;
	if(count==20'h7A120)begin
		c_count=20'h00_000;
		go=1'b1;
	end
	else 
		c_count=count+1;	
	if(reset==1'b0)begin 
		c_count=20'h00_000;
		go=1'b0;
	end
end

always @(posedge CLK) begin
	count<=c_count;
end 
assign go1=go;

reg c_clk,clk;
always @(*)begin 
		c_clk=~clk;
end

always @(posedge CLK) begin
	if( go==1'b1)
	clk<=c_clk;
end
assign clk50hz=clk;

endmodule
