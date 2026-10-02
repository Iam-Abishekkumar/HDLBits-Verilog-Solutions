// HDLBits: Adder 2
// https://hdlbits.01xz.net/wiki/module_fadd

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c1;
    add16 ( a[15:0],b[15:0], 1'b0,sum[15:0],c1);
    add16 ( a[31:16], b[31:16], c1, sum[31:16] );
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout, sum} = a+b+cin;
endmodule

/*module add16 (
    input [15:0]a,
    input [15:0] b,
   input cin,
    output [15:0] sum,
    output cout
);
    
   wire c0,c1,c2,c3,c4,c5,c6,c8,c9,c10,c11,c12,c13,c14,c7;
    add1 a1( a[0], b[0], cin1, s[0], c0);
    add1 a2( a[1], b[1], c0, s[1], c1);
    add1 a3( a[2], b[2], c1, s[2], c2);
    add1 a4( a[3], b[3], c2, s[3], c3);
    add1 a5( a[4], b[4], c3, s[4], c4);
    add1 a6( a[5], b[5], c4, s[5], c5);
    add1 a7( a[6], b[6], c5, s[6], c6);
    add1 a8( a[7], b[7], c6, s[7], c7);
    add1 a9( a[8], b[8], c7, s[8], c8);
    add1 a10( a[9], b[9], c8, s[9], c9);
    add1 a11( a[10], b[10], c9, s[10], c10);
    add1 a12( a[11], b[11], c10, s[11], c11);
    add1 a13( a[12], b[12], c11, s[12], c12);
    add1 a14( a[13], b[13], c12, s[13], c13);
    add1 a15( a[14], b[14], c13, s[14], c14);
    add1 a16( a[15], b[15], c14, s[15], cout);
endmodule 
*/