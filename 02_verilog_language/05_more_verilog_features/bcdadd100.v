// HDLBits: Generate for-loop: 100-digit BCD adder
// https://hdlbits.01xz.net/wiki/bcdadd100

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    
    wire [100:0]cout_r;
    assign cout_r[0] = cin;
    assign cout = cout_r[100];

    genvar i;
    generate 
        for ( i = 0; i<100; i=i+1'b1 ) begin : bcdadder
            bcd_fadd adder(
                .a(a[4*i+: 4]),
                .b(b[4*i+:4]),
                .cin(cout_r[i]),
                .cout(cout_r[i+1]),
                .sum(sum[4*i+:4])
            );
                
                
        end 
    endgenerate 
    
    
    
    
endmodule
