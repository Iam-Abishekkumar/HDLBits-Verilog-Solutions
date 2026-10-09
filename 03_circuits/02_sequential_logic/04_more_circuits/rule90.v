// HDLBits: Rule 90
// https://hdlbits.01xz.net/wiki/rule90

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 

    wire [511:0]q_next;
    genvar i ;
    generate
        for ( i = 1; i <=510; i = i +1'b1) begin : gen
           assign  q_next[i] = q [i-1] ^ q [i+1];         
        end 
       endgenerate 
        assign q_next[511] = q[510];
        assign q_next[0] =    q[1];
        
  
    always@(posedge clk)
        begin 
            if(load) 
                q<= data; 
            else 
                q<= q_next;
             
        end 
    
    
    
    
endmodule
