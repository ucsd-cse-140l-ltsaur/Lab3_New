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

// need to latch in the setting at the rising edge
`define BUFFER_SEGMENTS
`ifdef BUFFER_SEGMENTS
//----------------------------------------------------------------------------------------------------------------------------
reg [6:0] segment1, segment2, segment3, segment4;
assign o_segment1 = segment1;
assign o_segment2 = segment2;
assign o_segment3 = segment3;
assign o_segment4 = segment4;

always @(posedge i_clk)
begin
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
				  
//------------ Add your adder here ----------
//reset your logic
reg [5:0] l_sec_reg;
reg l_minute_pulse;

reg [5:0] l_minute_reg; 
reg l_hr_pulse;

reg [4:0] l_hr_reg;
reg l_day_pulse;

//update l_sec_reg
wire [5:0] sec_cntr_wire;
assign sec_cntr_wire [5:0] = {l_sec_reg [5:0]};

wire [5:0] test_59_sec;
assign test_59_sec = {sec_cntr_wire[5] ^ 1'b0, sec_cntr_wire[4] ^ 1'b0, sec_cntr_wire[3] ^ 1'b0,
                      sec_cntr_wire[2] ^ 1'b1, sec_cntr_wire[1] ^ 1'b0, sec_cntr_wire[0] ^ 1'b0}; //0x3B

wire [5:0] test_57_sec;
assign test_57_sec = {sec_cntr_wire[5] ^ 1'b0, sec_cntr_wire[4] ^ 1'b0, sec_cntr_wire[3] ^ 1'b0,
                      sec_cntr_wire[2] ^ 1'b1, sec_cntr_wire[1] ^ 1'b1, sec_cntr_wire[0] ^ 1'b0}; //0x39

wire [5:0] test_29_sec;
assign test_29_sec = {sec_cntr_wire[5] ^ 1'b1, sec_cntr_wire[4] ^ 1'b0, sec_cntr_wire[3] ^ 1'b0,
                      sec_cntr_wire[2] ^ 1'b0, sec_cntr_wire[1] ^ 1'b1, sec_cntr_wire[0] ^ 1'b0}; //0x1D
                    
wire is_59_sec = (&test_59_sec);
wire is_57_sec = (&test_57_sec);
wire is_29_sec = (&test_29_sec);
reg [3:0] sec_h_digit;
reg [3:0] sec_l_digit;

always@(posedge i_sec_pulse or posedge i_rst) begin
    if (i_rst) begin
        l_sec_reg[5:0] <= 6'b000000;
        l_minute_pulse <= 0;
    end 
    else begin
        
        if(is_59_sec) begin
            l_sec_reg[5:0] <= 6'b000000;
        end 
        else begin
            l_sec_reg[5:0] <= l_sec_reg[5:0] + 1'b1;
			l_minute_pulse <= is_57_sec? 1'b1:
                              is_29_sec? 1'b0:
                              l_minute_pulse;
            //if (is_57_sec)
            //    l_minute_pulse <= 1'b1;     
            //else if (is_29_sec) 
            //    l_minute_pulse <= 1'b0;
            //else
            //    l_minute_pulse <= l_minute_pulse;
        end
        
        //caculate sec one clk before latch in
        if(l_sec_reg > 49) begin
            sec_l_digit <= l_sec_reg - 50;
            sec_h_digit <= 5;
        end
        else if(l_sec_reg > 39)  begin
            sec_l_digit <= l_sec_reg - 40;
            sec_h_digit <= 4;
        end 
        else if(l_sec_reg > 29)  begin
            sec_l_digit <= l_sec_reg - 30;
            sec_h_digit <= 3;
        end 
        else if(l_sec_reg > 19)  begin
            sec_l_digit <= l_sec_reg - 20;
            sec_h_digit <= 2;
        end 
        else if(l_sec_reg > 9)  begin
            sec_l_digit <= l_sec_reg - 10;
            sec_h_digit <= 1;
        end 
        else begin      
            sec_l_digit <= l_sec_reg;
            sec_h_digit <= 0;
        end         
    end
end

//update minutes
wire l_minute_pulse_wire;
assign l_minute_pulse_wire = l_minute_pulse;

wire [5:0] minute_cntr_wire;
assign minute_cntr_wire[5:0] = {l_minute_reg[5:0]};

wire [5:0] test_59_min;
assign test_59_min = {minute_cntr_wire[5] ^ 1'b0, minute_cntr_wire[4] ^ 1'b0, minute_cntr_wire[3] ^ 1'b0,
                      minute_cntr_wire[2] ^ 1'b1, minute_cntr_wire[1] ^ 1'b0, minute_cntr_wire[0] ^ 1'b0}; //0x3B
                    
wire [5:0] test_29_min;
assign test_29_min = {minute_cntr_wire[5] ^ 1'b1, minute_cntr_wire[4] ^ 1'b0, minute_cntr_wire[3] ^ 1'b0,
                      minute_cntr_wire[2] ^ 1'b0, minute_cntr_wire[1] ^ 1'b1, minute_cntr_wire[0] ^ 1'b0}; //0x1D
                      
wire is_59_min = &test_59_min;
wire is_29_min = &test_29_min;

reg l_hr_pulse_reg;
reg [3:0] min_h_digit;
reg [3:0] min_l_digit;
reg [1:0] minute_pulse_tap;
wire l_minute_pulse_posedge;
assign l_minute_pulse_posedge = minute_pulse_tap[0] & ~minute_pulse_tap[1];

always@(posedge i_sec_pulse or posedge i_rst) begin
    if (i_rst) begin
        l_minute_reg[5:0] <= 6'b000000;
        l_hr_pulse_reg <= 0;
        min_h_digit <= 0;
        min_l_digit <= 0;
        minute_pulse_tap <= 0;
    end
    else begin
        minute_pulse_tap[1:0] <= {minute_pulse_tap[0], l_minute_pulse_wire};
        if(l_minute_pulse_posedge) begin

            if(is_59_min) begin
                l_minute_reg[5:0] <= 6'b000000;
                l_hr_pulse_reg <= 1'b1;
            end
            else begin
                l_minute_reg <= l_minute_reg + 1;
                if(is_29_min)
                    l_hr_pulse_reg <= 1'b0;
                else 
                    l_hr_pulse_reg <= l_hr_pulse_reg;
            end     
        end
        else begin

            l_hr_pulse_reg <= (is_59_min & is_57_sec)? 1'b1:
                              (is_29_min & is_57_sec)? 1'b0:
                               l_hr_pulse_reg;
							   
            //if(is_59_min & is_57_sec)
            //    l_hr_pulse_reg <= 1'b1;
            //else if(is_29_min & is_57_sec)
            //    l_hr_pulse_reg <= 1'b0;
            //else 
            //    l_hr_pulse_reg <= l_hr_pulse_reg;   
        
            l_minute_reg <= l_minute_reg;
            
            //caculate minute before latch in
            if(l_minute_reg > 49) begin
                min_l_digit <= l_minute_reg - 50;
                min_h_digit <= 5;
            end
            else if(l_minute_reg > 39)  begin
                min_l_digit <= l_minute_reg - 40;
                min_h_digit <= 4;
            end 
            else if(l_minute_reg > 29)  begin
                min_l_digit <= l_minute_reg - 30;
                min_h_digit <= 3;
            end 
            else if(l_minute_reg > 19)  begin
                min_l_digit <= l_minute_reg - 20;
                min_h_digit <= 2;
            end 
            else if(l_minute_reg > 9)  begin
                min_l_digit <= l_minute_reg - 10;
                min_h_digit <= 1;
            end 
            else begin      
                min_l_digit <= l_minute_reg;
                min_h_digit <= 0;
            end         

        end
    end
end 

wire l_hr_pulse_wire;
assign l_hr_pulse_wire = l_hr_pulse_reg;

wire [4:0] l_hr_wire;
assign l_hr_wire[4:0] = {l_hr_reg[4:0]};

wire [4:0] test_23_hr;
assign test_23_hr = {l_hr_wire[4] ^ 1'b0, l_hr_wire[3] ^ 1'b1,
                     l_hr_wire[2] ^ 1'b0, l_hr_wire[1] ^ 1'b0, l_hr_wire[0] ^ 1'b0}; //0x17
wire is_23_hr = &test_23_hr;

reg [3:0] hr_h_digit;
reg [3:0] hr_l_digit;
reg [1:0] hr_pulse_tap;
wire l_hr_pulse_posedge;
assign l_hr_pulse_posedge = hr_pulse_tap[0] & ~hr_pulse_tap[1];

always @ (posedge i_sec_pulse or posedge i_rst) begin
    if(i_rst) begin
        l_hr_reg[4:0] <= 5'b00000;
        hr_h_digit <= 0;
        hr_l_digit <= 0;
        hr_pulse_tap <= 0;
    end
    else begin
        hr_pulse_tap[1:0] <= {hr_pulse_tap[0], l_hr_pulse_wire};
        
        if(l_hr_pulse_posedge) begin
            l_hr_reg[4:0] <= (is_23_hr)? 5'b00000:
                             l_hr_reg[4:0] + 1'b1;
            //if(is_23_hr) begin
            //    l_hr_reg[4:0] <= 5'b00000;
            //end
            //else begin
            //    l_hr_reg[4:0] <= l_hr_reg[4:0] + 1'b1;
            //end 
        end
        else begin
            //convert hr into 2 decimal digits for display
            if(l_hr_reg > 19) begin
                hr_l_digit <= l_hr_reg - 20;
                hr_h_digit <= 2;
            end
            else if(l_hr_reg > 9)  begin
                hr_l_digit <= l_hr_reg - 10;
                hr_h_digit <= 1;
            end         
            else begin
                hr_l_digit <= l_hr_reg;
                hr_h_digit <= 0;
            end 
            l_hr_reg <= l_hr_reg;           
        end

    end
end


endmodule
         
