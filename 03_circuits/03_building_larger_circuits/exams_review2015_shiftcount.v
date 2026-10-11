// HDLBits: 4-bit shift register and down counter
// https://hdlbits.01xz.net/wiki/exams/review2015_shiftcount

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    reg [3:0] c =0;
    
    always@(posedge clk)
        begin 
            
            if(shift_ena)
                c <= {c[2:0],data};
            if(count_ena)
                c <= c - 1;
        end 
    
    assign q  = c;

endmodule
