// HDLBits: Half adder
// https://hdlbits.01xz.net/wiki/hadd

module top_module( 
    input a, b,
    output cout, sum );
    
    assign sum = a ^ b;
    assign cout = a & b;

endmodule
