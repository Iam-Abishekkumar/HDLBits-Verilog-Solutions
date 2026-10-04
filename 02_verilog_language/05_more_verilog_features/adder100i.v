// HDLBits: Generate for-loop: 100-bit binary adder 2
// https://hdlbits.01xz.net/wiki/adder100i

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    wire [100:0] cout_r;
    assign cout_r[0] = cin ;
    assign cout = cout_r[100:1];
    
    
    genvar i;
    generate 
        for ( i =0; i<100; i = i+1) begin : gen_fa
            fa  adder( .a(a[i]),
                  .b(b[i]),
                 .cin(cout_r[i]),
                 .c(cout_r[i+1]),
                  .sum(sum[i])
                 );
               end
               endgenerate 

endmodule


module fa( input a, input b, input cin ,output c, output sum );
    
    assign {c, sum } = a +b+cin;
endmodule 
