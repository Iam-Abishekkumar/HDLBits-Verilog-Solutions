// HDLBits: Create circuit from truth table
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q7

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    
    wire w ; 
    assign w  = ( j & ~	Q )| ( ~k & 	Q);
    always@(posedge clk)
        begin 
            	Q <= w;
        end 

endmodule
