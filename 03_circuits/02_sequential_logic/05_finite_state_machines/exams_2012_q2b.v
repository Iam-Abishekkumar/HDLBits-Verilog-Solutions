// HDLBits: Q2b: One-hot FSM equations
// https://hdlbits.01xz.net/wiki/exams/2012_q2b

module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    assign Y1 =   y[0] & w;
    assign Y3 = ~w &  ( y[1] | y[2] | y[4] | y[5] );


endmodule
