// HDLBits: Detect both edges
// https://hdlbits.01xz.net/wiki/edgedetect2

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
     reg [7:0] a;
    always@(posedge clk)
        begin 
            a <=in;
            //if(in!=pedge)
            anyedge <= (in ^ a); 
        end 


endmodule
