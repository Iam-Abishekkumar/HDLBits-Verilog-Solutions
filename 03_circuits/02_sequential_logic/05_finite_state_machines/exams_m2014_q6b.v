// HDLBits: Q6b: FSM next-state logic
// https://hdlbits.01xz.net/wiki/exams/m2014_q6b

module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
     
        assign Y2 = w ? (( y == 1) || (y==2) || (y==4) || (y ==5) )  : ((y == 1) || (y == 5 ));
endmodule
