// HDLBits: Lemmings 1
// https://hdlbits.01xz.net/wiki/lemmings1

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    localparam left = 0 , right = 1;
    reg state, next_state;

    always @(*) begin
        
        next_state = state;
        case(state)
            left : if(bump_left) next_state = right;
            right : if(bump_right) next_state = left;
        endcase 
        
        
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= left;
        else 
            state <= next_state;
    end

    // Output logic
    assign walk_left = (state == left);
    assign walk_right = (state == right);

endmodule
