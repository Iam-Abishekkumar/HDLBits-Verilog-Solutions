// HDLBits: Counter 1000
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q7b

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    wire [3:0] q1,q2,q3;
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = ( q1 == 9);
    assign c_enable[2] = ( q2 ==9 & q1 ==9);
    assign OneHertz = (q3 ==9 & q2 ==9 & q1 ==9 );
    bcdcount counter0 (clk, reset, c_enable[0],q1);
    bcdcount counter1 (clk, reset, c_enable[1],q2);
    bcdcount counter2 (clk, reset, c_enable[2],q3);
    

endmodule
