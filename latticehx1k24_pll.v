module latticehx1k24_pll(REFERENCECLK,
                         PLLOUTCORE,
                         PLLOUTGLOBAL,
                         RESET);

input REFERENCECLK;
input RESET;    /* To initialize the simulation properly, the RESET signal (Active Low) must be asserted at the beginning of the simulation */ 
output PLLOUTCORE;
output PLLOUTGLOBAL;

SB_PLL40_CORE latticehx1k24_pll_inst(.REFERENCECLK(REFERENCECLK),
                                     .PLLOUTCORE(PLLOUTCORE),
                                     .PLLOUTGLOBAL(PLLOUTGLOBAL),
                                     .EXTFEEDBACK(),
                                     .DYNAMICDELAY(),
                                     .RESETB(RESET),
                                     .BYPASS(1'b0),
                                     .LATCHINPUTVALUE(),
                                     .LOCK(),
                                     .SDI(),
                                     .SDO(),
                                     .SCLK());

//\\ Fin=12, Fout=24;
defparam latticehx1k24_pll_inst.DIVR = 4'b0000;
defparam latticehx1k24_pll_inst.DIVF = 7'b0111111;
defparam latticehx1k24_pll_inst.DIVQ = 3'b101;
defparam latticehx1k24_pll_inst.FILTER_RANGE = 3'b001;
defparam latticehx1k24_pll_inst.FEEDBACK_PATH = "SIMPLE";
defparam latticehx1k24_pll_inst.DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED";
defparam latticehx1k24_pll_inst.FDA_FEEDBACK = 4'b0000;
defparam latticehx1k24_pll_inst.DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED";
defparam latticehx1k24_pll_inst.FDA_RELATIVE = 4'b0000;
defparam latticehx1k24_pll_inst.SHIFTREG_DIV_MODE = 2'b00;
defparam latticehx1k24_pll_inst.PLLOUT_SELECT = "GENCLK";
defparam latticehx1k24_pll_inst.ENABLE_ICEGATE = 1'b0;

endmodule
