// HDLBits: Detect an edge
// https://hdlbits.01xz.net/wiki/edgedetect

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] a;
    always@(posedge clk)
        begin 
            a <=in;
            //if(in!=pedge)
            pedge <= (in & ~a); 
        end 

endmodule
