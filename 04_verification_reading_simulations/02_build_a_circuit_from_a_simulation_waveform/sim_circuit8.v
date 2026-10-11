// HDLBits: Sequential circuit 8
// https://hdlbits.01xz.net/wiki/sim/circuit8

module top_module (
    input clock,
    input a,
    output p,
    output reg q );
    
     //reg r =1;
    
    always@ (negedge clock )
        begin 
            q<=a;
            
        end 
    
   
    assign p = clock ? a : q;

endmodule
