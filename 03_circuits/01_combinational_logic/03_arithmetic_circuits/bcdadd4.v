// HDLBits: 4-digit BCD adder
// https://hdlbits.01xz.net/wiki/bcdadd4

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [4:0]cout_r;
    assign cout_r[0] = cin;
    assign cout = cout_r[4];
    
    genvar i; 
    generate 
        for ( i =0;  i<4; i = i +1'b1) begin : bcdd
            bcd_fadd fadd( .a(a[4*i +: 4]),
                           .b(b[4*i +: 4]),
                          .cin(cout_r[i]),
                          .cout(cout_r[i+1]),
                          .sum(sum[4*i +: 4])
                         );
        end 
    endgenerate 
    
    

endmodule
