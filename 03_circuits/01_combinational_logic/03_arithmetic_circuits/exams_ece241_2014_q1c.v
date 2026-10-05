// HDLBits: Signed addition overflow
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q1c

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
     assign s = a + b;
    assign overflow = ((a[7] == 1 && b [7] == 1 && s[7] == 0)  || (a[7] == 0 && b [7] == 0 && s[7] == 1)) ;

endmodule
