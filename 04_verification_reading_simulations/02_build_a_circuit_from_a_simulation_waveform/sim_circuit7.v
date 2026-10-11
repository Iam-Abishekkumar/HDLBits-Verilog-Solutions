// HDLBits: Sequential circuit 7
// https://hdlbits.01xz.net/wiki/sim/circuit7

module top_module (
    input clk,
    input a,
    output reg q );
    
    always@(posedge clk)
        begin 
            
            q<= ~a;
        end 

endmodule
