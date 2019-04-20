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



`ifdef POST_SYNC
reg [6:0] segment1, segment2, segment3, segment4;
assign o_segment1 = segment1;
assign o_segment2 = segment2;
assign o_segment3 = segment3;
assign o_segment4 = segment4;

always @(posedge i_clk)
begin
    //if(sec_pulse_test) begin
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
    //end
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
        sec_l_digit[3:0] <= sec_l_digit[3:0] + 4'h1;
	
        if(is_59_sec) begin
            sec_l_digit[3:0] <= 4'b0000;
			sec_h_digit[3:0] <= 4'b0000;
        end 
        else if(~|(sec_l_digit ^ 4'd9))  begin
                sec_l_digit <= 0;
                sec_h_digit <= sec_h_digit + 1;
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
        min_l_digit[3:0] <= min_l_digit[3:0] + 4'h1;
	
        if(is_59_min) begin
            min_l_digit[3:0] <= 4'b0000;
			min_h_digit[3:0] <= 4'b0000;
        end 
        else if(~|(min_l_digit ^ 4'd9))  begin
                min_l_digit <= 0;
                min_h_digit <= min_h_digit + 1;
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
        hr_l_digit[3:0] <= hr_l_digit[3:0] + 4'h1;
	
        if(is_23_hr) begin
            hr_l_digit[3:0] <= 4'b0000;
			hr_h_digit[1:0] <= 2'b00;
        end 
        else if(~|(hr_l_digit ^ 4'd9))  begin
                hr_l_digit <= 0;
                hr_h_digit <= hr_h_digit + 1;
        end         
    end
end


endmodule
         

