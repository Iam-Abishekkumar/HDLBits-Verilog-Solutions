// HDLBits: Q5b: Serial two's complementer (Mealy FSM)
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q5b

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    localparam [1:0]a=1,b=2;
    reg[1:0] state ,next;
    
    always@(posedge clk or posedge areset)
        begin 
            if(areset) 
                state <= a;
            else 
                state <= next;
        end 
  
    assign next[0]  = ((state==a) && ~x );
    assign next[1] = ((state == a) && x) || (state == b);
    assign z = (state == b) ? ~x  :  x;
endmodule
