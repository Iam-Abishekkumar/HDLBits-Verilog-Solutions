// HDLBits: 5-bit LFSR
// https://hdlbits.01xz.net/wiki/lfsr5

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output  reg [4:0] q
); 
    
    wire w,x;
    
    dfff d5 ( clk,1'b0,reset, w, q[4]);
    dfff d4 ( clk  ,1'b0,reset,q[4], q[3]);
    dfff d3( clk , 1'b0,reset,x, q[2]);
    dfff d2 ( clk  ,1'b0,reset,q[2], q[1]);
    dfff d1 ( clk  ,1'b1,reset,q[1], q[0]);
    
    assign w = 1'b0 ^ q[0];
    assign x = q[3] ^ q[0];
    
   
    
    
    

endmodule




module dfff( input clk, load,reset, d, output reg q);
    
    always@(posedge clk)
        begin 
            if(reset)
                q<=load;
            else 
                q<=d;
            
        end 
    
endmodule 

