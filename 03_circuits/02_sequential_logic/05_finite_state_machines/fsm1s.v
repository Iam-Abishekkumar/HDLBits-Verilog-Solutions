// HDLBits: Simple FSM 1 (synchronous reset)
// https://hdlbits.01xz.net/wiki/fsm1s

// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
localparam a =0 , b=1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset)  
            present_state <= b;
            else 
                present_state <= next_state;
    end 
    always@(*)begin 
        next_state=present_state;
        
            case (present_state)
                b : if(!in) next_state = a;
                a: if(!in) next_state = b;
            endcase

           
        
    end
    assign out = (present_state ==b ) ? 1  :0;

endmodule
