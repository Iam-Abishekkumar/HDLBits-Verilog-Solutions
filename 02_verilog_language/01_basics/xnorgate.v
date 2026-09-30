// HDLBits: XNOR gate
// https://hdlbits.01xz.net/wiki/xnorgate

module top_module( 
    input a, 
    input b, 
    output out );
assign out=~(a^b);
endmodule
