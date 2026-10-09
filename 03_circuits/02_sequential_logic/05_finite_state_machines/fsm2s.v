// HDLBits: Simple FSM 2 (synchronous reset)
// https://hdlbits.01xz.net/wiki/fsm2s

module top_module(
    input clk,
    input reset,    
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

    always @(posedge clk) begin
        if(reset)
            state <= OFF;
        else 
            state <= next_state;
    end

    assign out = (state == ON) ? 1 : 0;

endmodule
