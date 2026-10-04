// HDLBits: Combine circuits A and B
// https://hdlbits.01xz.net/wiki/mt2015_q4

module top_module (input x, input y, output z);

    wire w1,w2,w3,w4,w5,w6;
    
    assign w1 = (x^y) & x;
    assign w3 = (x^y) & x;
    assign w2 = ~(x^y);
    assign w4 = ~(x^y);
    
    assign w5 = w1 | w2;
    assign w6 = w3 &w4 ;
    assign z = w5 ^w6;
    
    
endmodule
