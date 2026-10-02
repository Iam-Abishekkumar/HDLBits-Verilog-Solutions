// HDLBits: Carry-select adder
// https://hdlbits.01xz.net/wiki/module_cseladd

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
); wire [15:0]aa,bb;
    wire cout;
    add16 u1 ( a[15:0], b[15:0],1'b0, sum[15:0], cout);
    add16 u2 ( a[31:16], b[31:16],1'b0, aa[15:0]);
    add16 u3 ( a[31:16], b[31:16],1'b1, bb[15:0]);
   
    mux16x1 u4(aa, bb, cout, sum[31:16] );
    
    
endmodule

module mux16x1 ( input [15:0]a,
                input [15:0]b,
                input sel,
                output [15:0]y
               );
    assign y = sel ? b : a;
endmodule 
