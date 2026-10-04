// HDLBits: Two-bit equality
// https://hdlbits.01xz.net/wiki/mt2015_eq2

module top_module ( input [1:0] A, input [1:0] B, output  z ); 
    
    wire w1,w2,w3,w4;
    
    assign w1 = ~A[1] & ~A[0] & ~B[1] & ~B[0] ;
    assign w2 = ~A[1] & A[0] & ~B[1] & B[0] ;
    assign w3 = A[1] & ~A[0] & B[1] & ~B[0] ;
    assign w4 = A[1] & A[0] & B[1] & B[0] ;
    
    assign z = w1 | w2 | w3 | w4 ;
    
endmodule
