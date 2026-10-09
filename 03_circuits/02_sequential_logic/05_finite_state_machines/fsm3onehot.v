// HDLBits: Simple one-hot state transitions 3
// https://hdlbits.01xz.net/wiki/fsm3onehot

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[0]&(~in) | state[2]&(~in);
    assign next_state[B] = state[0]&(in) | state[B]&(in) | state[D]&(in) ;
    assign next_state[C] = state[B]&(~in) | state[D]&(~in);
    assign next_state[D] =state[C]&(in) ;

    // Output logic: 
    assign out = state[D] ? 1 : 0;

endmodule
