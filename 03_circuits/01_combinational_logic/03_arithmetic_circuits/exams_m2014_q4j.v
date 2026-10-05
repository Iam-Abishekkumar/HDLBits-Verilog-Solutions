// HDLBits: Adder
// https://hdlbits.01xz.net/wiki/exams/m2014_q4j

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    
    wire [4:0] cout_r;
    assign  cout_r[0] = 1'b0;
    assign sum[4] = cout_r[4];
    
    genvar i; 
    generate 
        for ( i = 0; i<4; i = i+1'b1) begin : fa
            fa add( .a(x[i]),
                   .b(y[i]),
                   .cin(cout_r[i]),
                   .sum(sum[i]),
                   .cout ( cout_r[i+1])
                  );
                   
     end 
    endgenerate 
    
    
    
endmodule


                   module fa ( input a , b, cin, output sum, cout);
    
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin ;
    
endmodule 
