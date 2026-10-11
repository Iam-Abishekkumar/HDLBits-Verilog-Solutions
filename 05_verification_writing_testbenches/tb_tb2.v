// HDLBits: Testbench2
// https://hdlbits.01xz.net/wiki/tb/tb2

module top_module();
    
    reg clk=0;
    reg in;
    reg [2:0]s;
    
    wire out;
    
    q7 dut ( clk,in,s,out);
    
    always #5 clk = ~clk;
    
    initial begin 
       in =0;
        s =2;
      #10 s =6;
        #10 in = 1;
           s =2;
        #10 in = 0;
        s =7;
        #10 s=0;
        in=1;
        #30 in =0;

    end
    

endmodule
