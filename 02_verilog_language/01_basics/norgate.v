// HDLBits: NOR gate
// https://hdlbits.01xz.net/wiki/norgate

module top_module( 
    input a, 
    input b, 
    output out );
assign out= ~(a|b);
endmodule
