// HDLBits: Mux and DFF
// https://hdlbits.01xz.net/wiki/exams/2014_q4a

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire y,x;
    
    assign y = E ? w : Q;
    assign x = L ? R : y;
    always@(posedge clk)
        begin 
            Q <= x;
        end 

endmodule
