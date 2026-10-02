// HDLBits: Adder-subtractor
// https://hdlbits.01xz.net/wiki/module_addsub

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
); wire cout;
    wire [31:0]y;
    add16 u1( a[15:0],y[15:0], sub,sum[15:0],cout);
    add16 u2( a[31:16],y[31:16],cout,sum[31:16]);
    
    xor32 u3( b[31:0], sub, y[31:0]);
    
endmodule
module xor32 ( input [31:0]b,
            input sub,
            output [31:0] y
           );
    
    assign y = {32{sub}} ^ b;
endmodule