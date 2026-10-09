// HDLBits: Q6c: FSM one-hot next-state logic
// https://hdlbits.01xz.net/wiki/exams/m2014_q6c

module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    assign Y2 =   y[1] & ~w;
        assign Y4 = w &  ( y[2] | y[3] | y[5] | y[6] );

endmodule
