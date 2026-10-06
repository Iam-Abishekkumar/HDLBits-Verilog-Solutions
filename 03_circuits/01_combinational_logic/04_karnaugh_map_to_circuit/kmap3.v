// HDLBits: 4-variable
// https://hdlbits.01xz.net/wiki/kmap3

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = a | ( ~b & c);
endmodule
