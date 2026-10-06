// HDLBits: 4-variable
// https://hdlbits.01xz.net/wiki/kmap2

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (~c&~b) | (~a&~d) | (b&c&d) | (a&~b&d);

endmodule
