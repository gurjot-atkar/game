
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module lab7(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================

wire clk50hz; 
wire [15:0] smooth_out;
wire [9:0] test;
wire clkhun;
wire en;

clock m(.CLK(MAX10_CLK1_50), .reset(KEY[1]), .clk50hz(clk50hz));

clock2 m23(.CLK(MAX10_CLK1_50), .reset(KEY[1]), .clk2(clkhun));

//===== Declarations
   localparam SPI_CLK_FREQ  = 200;  // SPI Clock (Hz)
   localparam UPDATE_FREQ   = 1;    // Sampling frequency (Hz)

   // clks and reset
   wire reset_n;
   wire clk, spi_clk, spi_clk_out;

   // output data
   wire data_update;
   wire [15:0] data_x, data_y;

//===== Phase-locked Loop (PLL) instantiation. Code was copied from a module
//      produced by Quartus' IP Catalog tool.
ip ip_inst(
   .inclk0 ( MAX10_CLK1_50 ),
   .c0 ( clk ),                 // 25 MHz, phase   0 degrees
   .c1 ( spi_clk ),             //  2 MHz, phase   0 degrees
   .c2 ( spi_clk_out )          //  2 MHz, phase 270 degrees
   );

//===== Instantiation of the spi_control module which provides the logic to 
//      interface to the accelerometer.
spi_control #(     // parameters
      .SPI_CLK_FREQ   (SPI_CLK_FREQ),
      .UPDATE_FREQ    (UPDATE_FREQ))
   spi_ctrl (      // port connections
      .reset_n    (reset_n),
      .clk        (clk),
      .spi_clk    (spi_clk),
      .spi_clk_out(spi_clk_out),
      .data_update(data_update),
      .data_x     (data_x),
      .data_y     (data_y),
      .SPI_SDI    (GSENSOR_SDI),
      .SPI_SDO    (GSENSOR_SDO),
      .SPI_CSN    (GSENSOR_CS_N),
      .SPI_CLK    (GSENSOR_SCLK),
      .interrupt  (GSENSOR_INT)
   );
	
// Pressing KEY0 freezes the accelerometer's output
assign reset_n = KEY[1];
wire [3:0] tt1;

wire hammer;

button bint(.key(KEY[0]),.clk(clkhun), .rising(hammer));

sfilter inst(.SW(SW[1:0]),.reset(KEY[1]), .data_x(data_x), .clk(clk50hz), .smooth_out(smooth_out));
wire PAUSE;
wire [3:0] random;
wire enled;
wire [9:0] place;

remapper inst2(.led(LEDR),.s(smooth_out),.enable(enled),.ran(PAUSE),.random(random),.place(place));



wire sign;
wire [11:0] outf;

wire w0;
wire [11:0] final; 
wire nothing; 
wire [3:0] wO;

wire w23,d;
timer tim(.clk(clkhun),.out(final),.enable(en),.reset(KEY[1]),.set(w23),.done(d));

BCD bcd(.SW(SW), .twos(final) ,.outf(outf), .out1(sign),.overload(overload));
wire wOVER;

fsm  f(.clk(clkhun),.clk2(spi_clk_out),.clk3(clkhun), .reset(KEY[1]), .en_led(enled),.en_nothing(nothing),.en_timer(en),.random(PAUSE),.ham(hammer),.timer_reset(w23),.done(d),.place(place),.hex(wO),.ran_place(random),.over(wOVER));

random rm(.clk(clk), .ran(random),.pause(PAUSE));

wire [3:0] pr1; 
wire [11:0] timeout;

seg7 sl(.W(outf[11:8]) , .OUT3(HEX2), .nothing(nothing),.over(wOVER),.other(timeout[11:8]));
seg7 sl1(.W(outf[7:4]) , .OUT3(HEX1), .nothing(nothing),.over(wOVER),.other(timeout[7:4]));
seg7 sl2(.W(outf[3:0]) , .OUT3(HEX0), .nothing(nothing),.over(wOVER),.other(timeout[3:0]));
seg7 sl9(.W(wO), .OUT3(HEX5), .other(pr1), .over(wOVER));

wire ch;
assign ch= en^d;
result rs_ins(.game_over(wOVER),.print(pr1),.timein(outf),.timeout(timeout),.clk(clkhun),.clk2(spi_clk_out),.enable(ch),.address(wO));

assign HEX3[6]=1'b1;
assign HEX3[5:0]=6'b111111;
assign HEX3[7]=1'b1;
assign HEX0[7]=1'b1;
assign HEX1[7]=KEY[1];
//assign HEX4[0]=wO[0];
//assign HEX4[1]=wO[1];
//assign HEX4[2]=wO[2];
//assign HEX4[3]=wO[3];
//assign HEX4[4]=1'b1;
assign HEX5[7]=1'b1;
assign HEX4 = 8'b1111_1111;

endmodule