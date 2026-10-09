// HDLBits: 3-input LUT
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q12

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] q;
    wire [2:0]x;
    always@(posedge clk)
    begin 
        if(enable)
            begin 
                q<= {q[6:0], S};
                
            end 
        else begin 
            q<= q;
           
        end 
    end 
    assign x = {A,B,C};
    assign Z = q[x];
    

endmodule
