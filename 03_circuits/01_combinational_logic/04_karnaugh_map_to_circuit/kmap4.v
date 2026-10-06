// HDLBits: 4-variable
// https://hdlbits.01xz.net/wiki/kmap4

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
assign out = a ^ b^c^ d;
    
endmodule
