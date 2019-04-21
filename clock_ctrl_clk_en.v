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
//
// Revision History : 0.0

//-------------------- Lab3 ----------------------
module Lab3_140L (
 input wire i_rst                 , // reset signal
 input wire i_clk                 ,
 input wire i_sec_pulse           ,
 
 output wire [6:0] o_segment1       , // 7-segment1 (RHS)
 output wire [6:0] o_segment2       , // 7-segment1 (2nd)
 output wire [6:0] o_segment3       , // 7-segment1 (3rd)
 output wire [6:0] o_segment4         // 7-segment1 (LHS)
);

//----------------------------------------------------------------------------------------------------------------------------
//------------ Add your adder here ----------
`define PRE_SYNC
//`define POST_SYNC

`define USE_USER_LIB
//`define USE_N_BIT_ADDER

reg [3:0] sec_l_digit;
reg [3:0] sec_h_digit;

reg [3:0] min_h_digit;
reg [3:0] min_l_digit;

reg [4:0] hr_l_digit;
reg [1:0] hr_h_digit;

reg [1:0] sec_pulse_tap;
wire sec_pulse_test = sec_pulse_tap[0] & ~sec_pulse_tap[1];

always @ (posedge i_clk) begin
    if (i_rst) begin
        sec_pulse_tap[1:0] <= 2'b00;
    end
	else begin
        sec_pulse_tap[1:0] <= { sec_pulse_tap[0], i_sec_pulse};
	end
end


//--------------------------------------------------------------------------------------------------------------------------------
// output
`ifdef POST_SYNC
reg [6:0] segment1, segment2, segment3, segment4;
assign o_segment1 = segment1;
assign o_segment2 = segment2;
assign o_segment3 = segment3;
assign o_segment4 = segment4;

always @(posedge i_clk)
begin
    if(sec_pulse_test) begin
       segment1[0] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|(sec_l_digit == 3)|
                      (sec_l_digit == 5)|                   (sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
       segment1[1] = ((sec_l_digit == 0)|(sec_l_digit == 1)|(sec_l_digit == 2)|(sec_l_digit == 3)|(sec_l_digit == 4)|
                                                            (sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
       segment1[2] = ((sec_l_digit == 0)|(sec_l_digit == 1)|                   (sec_l_digit == 3)|(sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|(sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
       segment1[3] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|(sec_l_digit == 3)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)                   );//? 1: 0;
					  
       segment1[4] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|
                                         (sec_l_digit == 6)|                   (sec_l_digit == 8)                   );//? 1: 0;
										 
       segment1[5] = ((sec_l_digit == 0)|                                                         (sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
       segment1[6] = (                                      (sec_l_digit == 2)|(sec_l_digit == 3)|(sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
//---------------------------------------------------------------------------------------------------------------------------------
       segment2[0] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|(sec_h_digit == 3)|
                      (sec_h_digit == 5)|                   (sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
       segment2[1] = ((sec_h_digit == 0)|(sec_h_digit == 1)|(sec_h_digit == 2)|(sec_h_digit == 3)|(sec_h_digit == 4)|
                                                            (sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
       segment2[2] = ((sec_h_digit == 0)|(sec_h_digit == 1)|                   (sec_h_digit == 3)|(sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|(sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
       segment2[3] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|(sec_h_digit == 3)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)                   );//? 1: 0;
					  
       segment2[4] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|
                                         (sec_h_digit == 6)|                   (sec_h_digit == 8)                   );//? 1: 0;
										 
       segment2[5] = ((sec_h_digit == 0)|                                                         (sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
       segment2[6] = (                                      (sec_h_digit == 2)|(sec_h_digit == 3)|(sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
//--------------------------------------------------------------------------------------------------------------------------------
       segment3[0] = ((min_l_digit == 0)|                   (min_l_digit == 2)|(min_l_digit == 3)|
                      (min_l_digit == 5)|                   (min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
       segment3[1] = ((min_l_digit == 0)|(min_l_digit == 1)|(min_l_digit == 2)|(min_l_digit == 3)|(min_l_digit == 4)|
                                                            (min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
       segment3[2] = ((min_l_digit == 0)|(min_l_digit == 1)|                   (min_l_digit == 3)|(min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|(min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
       segment3[3] = ((min_l_digit == 0)|                   (min_l_digit == 2)|(min_l_digit == 3)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)                   );//? 1: 0;
					  
       segment3[4] = ((min_l_digit == 0)|                   (min_l_digit == 2)|
                                         (min_l_digit == 6)|                   (min_l_digit == 8)                   );//? 1: 0;
										 
       segment3[5] = ((min_l_digit == 0)|                                                         (min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
       segment3[6] = (                                      (min_l_digit == 2)|(min_l_digit == 3)|(min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
//-------------------------------------------------------------------------------------------------------------------------------
       segment4[0] = ((min_h_digit == 0)|                   (min_h_digit == 2)|(min_h_digit == 3)|
                      (min_h_digit == 5)|                   (min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
       segment4[1] = ((min_h_digit == 0)|(min_h_digit == 1)|(min_h_digit == 2)|(min_h_digit == 3)|(min_h_digit == 4)|
                                                            (min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
       segment4[2] = ((min_h_digit == 0)|(min_h_digit == 1)|                   (min_h_digit == 3)|(min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|(min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
       segment4[3] = ((min_h_digit == 0)|                   (min_h_digit == 2)|(min_h_digit == 3)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)                   );//? 1: 0;
					  
       segment4[4] = ((min_h_digit == 0)|                   (min_h_digit == 2)|
                                         (min_h_digit == 6)|                   (min_h_digit == 8)                   );//? 1: 0;
										 
       segment4[5] = ((min_h_digit == 0)|                                                         (min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
       segment4[6] = (                                      (min_h_digit == 2)|(min_h_digit == 3)|(min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
//--------------------------------------------------------------------------------------------------------------------------------
    end
end

`else
assign o_segment1[0] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|(sec_l_digit == 3)|
                      (sec_l_digit == 5)|                   (sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
assign o_segment1[1] = ((sec_l_digit == 0)|(sec_l_digit == 1)|(sec_l_digit == 2)|(sec_l_digit == 3)|(sec_l_digit == 4)|
                                                            (sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
assign o_segment1[2] = ((sec_l_digit == 0)|(sec_l_digit == 1)|                   (sec_l_digit == 3)|(sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|(sec_l_digit == 7)|(sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
assign o_segment1[3] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|(sec_l_digit == 3)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)                   );//? 1: 0;
					  
assign o_segment1[4] = ((sec_l_digit == 0)|                   (sec_l_digit == 2)|
                                         (sec_l_digit == 6)|                   (sec_l_digit == 8)                   );//? 1: 0;
										 
assign o_segment1[5] = ((sec_l_digit == 0)|                                                         (sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
					  
assign o_segment1[6] = (                                      (sec_l_digit == 2)|(sec_l_digit == 3)|(sec_l_digit == 4)|
                      (sec_l_digit == 5)|(sec_l_digit == 6)|                   (sec_l_digit == 8)|(sec_l_digit == 9));//? 1: 0;
//---------------------------------------------------------------------------------------------------------------------------------
assign o_segment2[0] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|(sec_h_digit == 3)|
                      (sec_h_digit == 5)|                   (sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
assign o_segment2[1] = ((sec_h_digit == 0)|(sec_h_digit == 1)|(sec_h_digit == 2)|(sec_h_digit == 3)|(sec_h_digit == 4)|
                                                            (sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
assign o_segment2[2] = ((sec_h_digit == 0)|(sec_h_digit == 1)|                   (sec_h_digit == 3)|(sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|(sec_h_digit == 7)|(sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
assign o_segment2[3] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|(sec_h_digit == 3)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)                   );//? 1: 0;
					  
assign o_segment2[4] = ((sec_h_digit == 0)|                   (sec_h_digit == 2)|
                                         (sec_h_digit == 6)|                   (sec_h_digit == 8)                   );//? 1: 0;
										 
assign o_segment2[5] = ((sec_h_digit == 0)|                                                         (sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
					  
assign o_segment2[6] = (                                      (sec_h_digit == 2)|(sec_h_digit == 3)|(sec_h_digit == 4)|
                      (sec_h_digit == 5)|(sec_h_digit == 6)|                   (sec_h_digit == 8)|(sec_h_digit == 9));//? 1: 0;
//--------------------------------------------------------------------------------------------------------------------------------
assign o_segment3[0] = ((min_l_digit == 0)|                   (min_l_digit == 2)|(min_l_digit == 3)|
                      (min_l_digit == 5)|                   (min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
assign o_segment3[1] = ((min_l_digit == 0)|(min_l_digit == 1)|(min_l_digit == 2)|(min_l_digit == 3)|(min_l_digit == 4)|
                                                            (min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
assign o_segment3[2] = ((min_l_digit == 0)|(min_l_digit == 1)|                   (min_l_digit == 3)|(min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|(min_l_digit == 7)|(min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
assign o_segment3[3] = ((min_l_digit == 0)|                   (min_l_digit == 2)|(min_l_digit == 3)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)                   );//? 1: 0;
					  
assign o_segment3[4] = ((min_l_digit == 0)|                   (min_l_digit == 2)|
                                         (min_l_digit == 6)|                   (min_l_digit == 8)                   );//? 1: 0;
										 
assign o_segment3[5] = ((min_l_digit == 0)|                                                         (min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
					  
assign o_segment3[6] = (                                      (min_l_digit == 2)|(min_l_digit == 3)|(min_l_digit == 4)|
                      (min_l_digit == 5)|(min_l_digit == 6)|                   (min_l_digit == 8)|(min_l_digit == 9));//? 1: 0;
//-------------------------------------------------------------------------------------------------------------------------------
assign o_segment4[0] = ((min_h_digit == 0)|                   (min_h_digit == 2)|(min_h_digit == 3)|
                      (min_h_digit == 5)|                   (min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
assign o_segment4[1] = ((min_h_digit == 0)|(min_h_digit == 1)|(min_h_digit == 2)|(min_h_digit == 3)|(min_h_digit == 4)|
                                                            (min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
assign o_segment4[2] = ((min_h_digit == 0)|(min_h_digit == 1)|                   (min_h_digit == 3)|(min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|(min_h_digit == 7)|(min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
assign o_segment4[3] = ((min_h_digit == 0)|                   (min_h_digit == 2)|(min_h_digit == 3)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)                   );//? 1: 0;
					  
assign o_segment4[4] = ((min_h_digit == 0)|                   (min_h_digit == 2)|
                                         (min_h_digit == 6)|                   (min_h_digit == 8)                   );//? 1: 0;
										 
assign o_segment4[5] = ((min_h_digit == 0)|                                                         (min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
					  
assign o_segment4[6] = (                                      (min_h_digit == 2)|(min_h_digit == 3)|(min_h_digit == 4)|
                      (min_h_digit == 5)|(min_h_digit == 6)|                   (min_h_digit == 8)|(min_h_digit == 9));//? 1: 0;
//--------------------------------------------------------------------------------------------------------------------------------

`endif
		
//--------------------------------------------------------------------------------------------------------------------------------
// combinational logics	
`ifdef USE_USER_LIB
`ifdef USE_N_BIT_ADDER
defparam u_sec_l.N = 4;
wire [3:0] o_adder_sec_l;
N_bit_adder u_sec_l(
.sum (o_adder_sec_l)  , // Output of the adder
.carry()              , // Carry output of adder
.r1 (sec_l_digit)     , // first input
.r2 (4'h1)            , // second input
.ci (1'b0)              // carry input
);

defparam u_sec_h.N = 4;
wire [3:0] o_adder_sec_h;
N_bit_adder u_sec_h(
.sum (o_adder_sec_h)  , // Output of the adder
.carry()              , // Carry output of adder
.r1 (sec_h_digit)     , // first input
.r2 (4'h1)            , // second input
.ci (1'b0)              // carry input
);

defparam u_min_l.N = 4;
wire [3:0] o_adder_min_l;
N_bit_adder u_min_l(
.sum (o_adder_min_l)  , // Output of the adder
.carry()              , // Carry output of adder
.r1 (min_l_digit)     , // first input
.r2 (4'h1)            , // second input
.ci (1'b0)              // carry input
);

defparam u_min_h.N = 4;
wire [3:0] o_adder_min_h;
N_bit_adder u_min_h(
.sum (o_adder_min_h)  , // Output of the adder
.carry()              , // Carry output of adder
.r1 (min_h_digit)     , // first input
.r2 (4'h1)            , // second input
.ci (1'b0)              // carry input
);

defparam u_hr_l.N = 4;
wire [3:0] o_adder_hr_l;
N_bit_adder u_hr_l(
.sum (o_adder_hr_l)   , // Output of the adder
.carry()              , // Carry output of adder
.r1 (hr_l_digit)      , // first input
.r2 (4'h1)            , // second input
.ci (1'b0)              // carry input
);

defparam u_hr_h.N = 2;
wire [1:0] o_adder_hr_h;
N_bit_adder u_hr_h(
.sum (o_adder_hr_h)   , // Output of the adder
.carry()              , // Carry output of adder
.r1 (hr_h_digit)      , // first input
.r2 (2'h1)            , // second input
.ci (1'b0)              // carry input
);
`else  // ~USE_N_BIT_ADDER

wire [3:0] o_adder_sec_l;
defparam u_sec_l.N = 4;
N_bit_counter u_sec_l(
.result (o_adder_sec_l)       , // Output
.r1 (sec_l_digit)                      , // input
.up (1'b1)
);

wire [3:0] o_adder_sec_h;
defparam u_sec_h.N = 4;
N_bit_counter u_sec_h(
.result (o_adder_sec_h)       , // Output
.r1 (sec_h_digit)                      , // input
.up (1'b1)
);

wire [3:0] o_adder_min_l;
defparam u_min_l.N = 4;
N_bit_counter u_min_l(
.result (o_adder_min_l)       , // Output
.r1 (min_l_digit)                      , // input
.up (1'b1)
);

wire [3:0] o_adder_min_h;
defparam u_min_h.N = 4;
N_bit_counter u_min_h(
.result (o_adder_min_h)       , // Output
.r1 (min_h_digit)                      , // input
.up (1'b1)
);

wire [3:0] o_adder_hr_l;
defparam u_hr_l.N = 4;
N_bit_counter u_hr_l(
.result (o_adder_hr_l)       , // Output
.r1 (hr_l_digit)                      , // input
.up (1'b1)
);

wire [1:0] o_adder_hr_h;
defparam u_hr_h.N = 2;
N_bit_counter u_hr_h(
.result (o_adder_hr_h)       , // Output
.r1 (hr_h_digit)                      , // input
.up (1'b1)
);
`endif // ~USE_N_BIT_ADDER
`endif // USE_USER_LIB

//--------------------------------------------------------------------------------------------------------------------------------
// sequencial logics
wire is_59_sec;
assign is_59_sec = ~|((sec_h_digit ^ 4'd5) | (sec_l_digit ^ 4'd9)); 

`ifdef PRE_SYNC
always@(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
        sec_l_digit[3:0] <= 4'b0000;
		sec_h_digit[3:0] <= 4'b0000;
    end 
    else if (~sec_pulse_test) begin
            sec_l_digit <= sec_l_digit;
            sec_h_digit <= sec_h_digit;	
	end
	else begin
`else
always@(posedge i_sec_pulse or posedge i_rst) begin
    if (i_rst) begin
        sec_l_digit[3:0] <= 4'b0000;
		sec_h_digit[3:0] <= 4'b0000;
     end 
    else begin

`endif
        sec_l_digit[3:0] <= o_adder_sec_l; //sec_l_digit[3:0] + 4'h1;
	
        if(is_59_sec) begin
            sec_l_digit[3:0] <= 4'b0000;
			sec_h_digit[3:0] <= 4'b0000;
        end 
        else if(~|(sec_l_digit ^ 4'd9))  begin
                sec_l_digit <= 0;
                sec_h_digit <= o_adder_sec_h; //sec_h_digit + 1;
        end         
    end
end

//update minutes
wire is_59_min = ~|((min_h_digit ^ 4'd5) | (min_l_digit ^ 4'd9));                     
wire is_29_min = ~|((min_h_digit ^ 4'd2) | (min_l_digit ^ 4'd9));
                      
`ifdef PRE_SYNC
always@(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
        min_l_digit[3:0] <= 4'b0000;
		min_h_digit[3:0] <= 4'b0000;
     end 
    else if (~(sec_pulse_test & is_59_sec)) begin
            min_l_digit <= min_l_digit;
            min_h_digit <= min_h_digit;	
	end
	else begin
`else
always@(posedge i_sec_pulse or posedge i_rst) begin
    if (i_rst) begin
        min_l_digit[3:0] <= 4'b0000;
        min_h_digit[3:0] <= 4'b0000;
    end 
    else if (~is_59_sec) begin
            min_l_digit <= min_l_digit;
            min_h_digit <= min_h_digit;	        
    end 
    else begin
`endif
        min_l_digit[3:0] <= o_adder_min_l; //min_l_digit[3:0] + 4'h1;
	
        if(is_59_min) begin
            min_l_digit[3:0] <= 4'b0000;
			min_h_digit[3:0] <= 4'b0000;
        end 
        else if(~|(min_l_digit ^ 4'd9))  begin
                min_l_digit <= 0;
                min_h_digit <= o_adder_min_h; //min_h_digit + 1;
        end         
    end
end


wire is_23_hr = ~( (|(hr_h_digit ^ 2'd2)) | (|(hr_l_digit ^ 4'd3)) );

`ifdef PRE_SYNC
always@(posedge i_clk or posedge i_rst) begin
    if (i_rst) begin
        hr_l_digit[3:0] <= 4'b0000;
		hr_h_digit[1:0] <= 2'b00;
     end 
    else if (~(sec_pulse_test & is_59_min)) begin
            hr_l_digit <= hr_l_digit;
            hr_h_digit <= hr_h_digit;	
	end
	else begin
`else
always@(posedge i_sec_pulse or posedge i_rst) begin
    if (i_rst) begin
        hr_l_digit[3:0] <= 4'b0000;
		hr_h_digit[1:0] <= 2'b00;
    end 
    else if (~is_59_min) begin
            hr_l_digit <= hr_l_digit;
            hr_h_digit <= hr_h_digit;	        
    end 
    else begin
`endif
        hr_l_digit[3:0] <= o_adder_hr_l[3:0]; //hr_l_digit[3:0] + 4'h1;
	
        if(is_23_hr) begin
            hr_l_digit[3:0] <= 4'b0000;
			hr_h_digit[1:0] <= 2'b00;
        end 
        else if(~|(hr_l_digit ^ 4'd9))  begin
                hr_l_digit <= 0;
                hr_h_digit[1:0] <= o_adder_hr_h[1:0]; //hr_h_digit + 1;
        end         
    end
end


endmodule
         

