// HDLBits: Sequential circuit 10
// https://hdlbits.01xz.net/wiki/sim/circuit10

module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state  );
    
    assign q = a ^ b ^ state;
    always@(posedge clk)
        begin
            
            if( a==0 & b==0)
                state <= 0;
            if(a==1 & b==1)
                state <=1;
            end 

endmodule
