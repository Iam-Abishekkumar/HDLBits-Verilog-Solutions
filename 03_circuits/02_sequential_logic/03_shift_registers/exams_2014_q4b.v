// HDLBits: Shift register
// https://hdlbits.01xz.net/wiki/exams/2014_q4b

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    
    MUXDFF d3 (KEY[0], KEY[3], KEY[1], SW[3], KEY[2], LEDR[3] , LEDR[3]);
    MUXDFF d2 (KEY[0], LEDR[3], KEY[1], SW[2], KEY[2], LEDR[2] , LEDR[2] );
    MUXDFF d1 (KEY[0], LEDR[2], KEY[1], SW[1], KEY[2], LEDR[1] , LEDR[1] );
    MUXDFF d0( KEY[0], LEDR[1], KEY[1], SW[0], KEY[2], LEDR[0] , LEDR[0]);
    
    
    
    
    
    
    
    

endmodule

module MUXDFF (input clk, w, e,r,l,d, output reg q);
    
    wire a,b;
    assign a = e ? w : q;
    assign b = l ? r : a;
    
    always@(posedge clk)
        
        begin 
            q<= b;
        end 

endmodule
