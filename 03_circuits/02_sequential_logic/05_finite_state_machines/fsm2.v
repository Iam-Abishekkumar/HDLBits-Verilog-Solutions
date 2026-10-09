// HDLBits: Simple FSM 2 (asynchronous reset)
// https://hdlbits.01xz.net/wiki/fsm2

module top_module(
    input clk,
    input areset,    
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
       next_state = state;
        case(state)
            OFF : if(j) next_state = ON;
            ON :  if(k) next_state = OFF;
        endcase 
        
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= OFF;
        else 
            state <= next_state;
    end

    assign out = (state == ON) ? 1 : 0;

endmodule
