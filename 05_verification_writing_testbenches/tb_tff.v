// HDLBits: T flip-flop
// https://hdlbits.01xz.net/wiki/tb/tff

module top_module ();

    reg clk =0;
    reg reset;
    reg t;
    wire q;
    
    tff dut ( clk, reset,t,q);
    
    always #5 clk = ~ clk;
    
    initial begin 
        t =0;
        reset =1;
        #10
        reset =0;
        t =1;
        //#15 
        //t=0;
        
        
        
    end 
    
endmodule
