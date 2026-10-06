// HDLBits: Karnaugh map
// https://hdlbits.01xz.net/wiki/exams/m2014_q3

module top_module (
    input [4:1] x, 
    output f );

    
    assign f = (x[4]&x[2]) | (~x[1] & x[3]) ;
    
endmodule
