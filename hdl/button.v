
module button (input clk,input key, output rising);


//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================
reg n;
reg rising_transition;
wire rising_transition_c;
// logic to detect 0 in previous cycle and 1 in current cycle
assign rising_transition_c = ~n & ~key;
// flip-flop instantiations
always @(posedge clk) begin
n <= #1 ~key;
rising_transition <= #1 rising_transition_c;
end
assign rising=rising_transition;

endmodule
