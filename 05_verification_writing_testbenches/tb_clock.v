// HDLBits: Clock
// https://hdlbits.01xz.net/wiki/tb/clock

module top_module ( );

    
    reg clk =0;
    always #5 clk = ~clk;
    
    
    dut clkkk( clk);
    
endmodule
