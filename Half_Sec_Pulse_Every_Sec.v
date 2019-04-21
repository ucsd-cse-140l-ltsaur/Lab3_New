// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2019 by UCSD CSE 140L
// --------------------------------------------------------------------
//
// Permission:
//
//   This code for use in UCSD CSE 140L.
//   It is synthesisable for Lattice iCEstick 40HX.  
//
// Disclaimer:
//
//   This Verilog source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  
//
// --------------------------------------------------------------------
//           
//                     Lih-Feng Tsaur
//                     UCSD CSE Department
//                     9500 Gilman Dr, La Jolla, CA 92093
//                     U.S.A
//
// --------------------------------------------------------------------
// Generate 0.5 sec pule every sec 
// NOTE: default clk freq (CLK_FREQ) is set to 96MHz.  
//
// Revision History : 0.0
//
// Example:
//   wire o_One_Sec_Pulse_50_50;
//   defparam CLK_FREQ = 96000000;
//   Half_Sec_Pulse_Per_Sec uu0 (
//        .i_rst (Gl_rst),       //reset
//        .i_clk (clk),       //system clk 12MHz 
//        .o_sec_tick (o_One_Sec_Pulse_50_50)  //0.5sec 1 and 0.5sec 0
//   );


module Half_Sec_Pulse_Per_Sec(
input  wire i_rst,       //reset
input  wire i_clk,       //system clk 12MHz 
output wire o_sec_tick   //0.5sec 1 and 0.5sec 0
);

`define USE_USER_LIB
//`define USE_N_BIT_ADDER

parameter CLK_FREQ = 96000000;
parameter SLOW_CLK_16X = CLK_FREQ/16;
parameter SLOW_CLK_CYCLES_PER_HALF_SEC = SLOW_CLK_16X/2;

reg[3:0] div_cntr11;    // slow down the clk by 16x
reg[21:0] div_cntrl2;   // (96000000/2) needs 26 bits to present it
                        // not sure if timing will close every time of synthersize
//---------------------------------------------------------------
// output
reg  sec_clk;    
assign o_sec_tick = sec_clk;

always@(posedge i_clk) begin
`ifdef SIMULATION
    if(i_rst)
        sec_clk <= 0;
    else 
`endif
        sec_clk =  ((|div_cntr11) | (|div_cntrl2))? sec_clk : ~sec_clk;
end

//---------------------------------------------------------------
//combinational logics
`ifdef USE_USER_LIB
`ifdef USE_N_BIT_ADDER
defparam vbuf_count_cntrl1.N = 4;
wire [3:0] o_adder_div_cntr11;
wire       o_adder_div_carry1;
N_bit_adder vbuf_count_cntrl1(
.sum (o_adder_div_cntr11[3:0])   , // Output of the adder
.carry(o_adder_div_carry1)        , // Carry output of adder
.r1 (div_cntr11[3:0])               , // first input
.r2 (4'h1)                        , // second input
.ci (1'b0)                            // carry input
);

defparam vbuf_count_cntrl2.N = 22;
wire [21:0] o_adder_div_cntr12;
wire       o_adder_div_carry2;
N_bit_adder vbuf_count_cntrl2(
.sum (o_adder_div_cntr12[21:0])   , // Output of the adder
.carry(o_adder_div_carry2)        , // Carry output of adder
.r1 (div_cntrl2[21:0])               , // first input
.r2 (22'h000001)                        , // second input
.ci (1'b0)                            // carry input
);

`else  // ~USE_N_BIT_ADDER
wire [3:0] o_adder_div_cntr11;
defparam vbuf_count_cntrl1.N = 4;
N_bit_counter vbuf_count_cntrl1(
.result (o_adder_div_cntr11[3:0])       , // Output
.r1 (div_cntr11[3:0])                      , // input
.up (1'b1)
);

wire [21:0] o_adder_div_cntr12;
defparam vbuf_count_cntrl2.N = 22;
N_bit_counter vbuf_count_cntrl2(
.result (o_adder_div_cntr12[21:0])       , // Output
.r1 (div_cntrl2[21:0])                      , // input
.up (1'b1)
);
`endif // ~USE_N_BIT_ADDER
`endif // USE_USER_LIB
//---------------------------------------------------------------
// sequential logics
// slow down the clk by 16x
always@(posedge i_clk) begin
`ifdef SIMULATION
    if(i_rst)
        div_cntr11[3:0] <= 4'h0;
    else
`endif	
`ifdef USE_USER_LIB
        div_cntr11[3:0] <= o_adder_div_cntr11[3:0]; //div_cntr11[3:0] + 4'b0001;
`else
        div_cntr11[3:0] <= div_cntr11[3:0] + 4'b0001;
`endif
end

//div_cntr11[4] is at CLK_FREQ/16 Hz 
// 22 bits adder has 8 cycles of slow clks to operate
always @ (posedge div_cntr11[3]) begin
	if (i_rst) begin
	    div_cntrl2[21:0] <= 22'h000000;
	end 
	else begin
		if (div_cntrl2[21:0] == SLOW_CLK_CYCLES_PER_HALF_SEC-1)
			div_cntrl2[21:0] <= 22'h000000;			
        else 		
`ifdef USE_USER_LIB
            div_cntrl2[21:0] <= o_adder_div_cntr12[21:0]; //div_cntrl2[21:0] + 22'h000001;	
`else
            div_cntrl2[21:0] <= div_cntrl2[21:0] + 22'h000001;	
`endif			
	end	
end
	

endmodule
