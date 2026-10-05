// HDLBits: 3-bit binary adder
// https://hdlbits.01xz.net/wiki/adder3

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire [3 :0] cout_r;
    assign cout_r[0] = cin;
    assign cout = cout_r[3:1];
    
    genvar i ;
    generate 
        for ( i = 0 ; i<3; i = i +1'b1) begin : RCA 
            fadd fa( .a(a[i]),
                    .b(b[i]),
                    .c(cout_r[i]),
                    .cout(cout_r[i+1]),
                    .sum(sum[i])
                   );
                     
        end 
    endgenerate 
    
    

endmodule


module fadd ( input a,b,c, output cout ,sum);
        assign sum = a ^ b^ c;
        assign cout = a&b | b&c | a&c;
    endmodule 
