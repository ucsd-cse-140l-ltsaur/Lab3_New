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
// Example:
// defparam vbuf_count.N = 11;
//  wire [10:0] o_adder_vbuf_count;
//  wire       o_adder_vbuf_carry;
//  N_bit_adder vbuf_count(
//  .sum (o_adder_vbuf_count[10:0])   , // Output of the adder
//  .carry(o_adder_vbuf_carry)        , // Carry output of adder
//  .r1 (l_count[10:0])               , // first input
//  .r2 (11'h001)                        , // second input
//  .ci (1'b0)                            // carry input
//  );
//
// Revision History : 0.0
//---------------------------------------------------------------------
module N_bit_adder (
sum           , // Output of the adder
carry         , // Carry output of adder
r1            , // first input
r2            , // second input
ci              // carry input
);
parameter N = 4;
parameter N_1 = N - 1;
// Input Port Declarations       
input    [N_1:0]   r1         ;
input    [N_1:0]   r2         ;
input              ci         ;

// Output Port Declarations
output   [N_1:0]  sum         ;
output            carry       ;

// Port Wires
wire     [N_1:0]    r1        ;
wire     [N_1:0]    r2        ;
wire                ci        ;
wire     [N_1:0]    sum       ;
wire                carry     ;

// Internal variables
wire     [N:0]      c_L       ;
assign c_L[0] = ci;
assign carry = c_L[N];

genvar i;
generate
    for (i = 0; i < N; i=i+1) 
    begin : adder_gen_label
        full_adder adder_inst (
            .a(r1[i]),
            .b(r2[i]),
            .c(c_L[i]),
            .sum(sum[i]),
		    .carry(c_L[i+1])
        );
    end
endgenerate;

endmodule // End Of Module adder