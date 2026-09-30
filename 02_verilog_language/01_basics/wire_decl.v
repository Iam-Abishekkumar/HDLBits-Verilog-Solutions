// HDLBits: Declaring wires
// https://hdlbits.01xz.net/wiki/wire_decl

`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire w,x;
    
    assign w  = a & b;
    assign x = c & d;
    assign out = w | x;
    assign out_n = ~ out;
    
    
    

endmodule
