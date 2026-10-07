// HDLBits: DFF+gate
// https://hdlbits.01xz.net/wiki/exams/m2014_q4d

module top_module (
    input clk,
    input in, 
    output out);
    
    wire w;
    assign w = in ^ out ;
    always@(posedge clk)
        begin 
            
            out <= w;
        end 

endmodule
