// HDLBits: Combinational circuit 3
// https://hdlbits.01xz.net/wiki/sim/circuit3

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (a|b) & (c|d); // Fix me

endmodule
