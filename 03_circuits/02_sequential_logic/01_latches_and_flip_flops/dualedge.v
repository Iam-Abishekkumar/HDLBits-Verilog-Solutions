// HDLBits: Dual-edge triggered flip-flop
// https://hdlbits.01xz.net/wiki/dualedge

module top_module (
    input clk,
    input d,
    output q
);
    
reg q_pos;
reg q_neg;

always @(posedge clk)
    q_pos <= d;

always @(negedge clk)
    q_neg <= d;

assign q = clk ? q_pos : q_neg;

endmodule
