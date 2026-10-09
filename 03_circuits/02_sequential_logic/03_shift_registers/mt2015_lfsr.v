// HDLBits: 3-bit LFSR
// https://hdlbits.01xz.net/wiki/mt2015_lfsr

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q


    wire w,x,y,z;
    assign w = KEY[1] ? SW[0] : LEDR[2];
    assign x = KEY[1] ? SW[1] : LEDR[0];
    assign y =  LEDR[2] ^ LEDR[1];
    assign z = KEY[1] ? SW[2] : y;
    
    dfff d0 ( KEY[0], w, LEDR[0]); 
    dfff d1 ( KEY[0], x, LEDR[1]); 
    dfff d2 ( KEY[0], z, LEDR[2]); 
    
  
    
endmodule



module dfff( input clk, d, output reg q);
    
    
    always@(posedge clk)
        begin 
            
           q<=d;
            
        end 
    
    
    
endmodule 







