// HDLBits: 4-digit decimal counter
// https://hdlbits.01xz.net/wiki/countbcd

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    
    assign ena[1] = (q[3:0] == 9);
    assign ena[2] = (q[7:4] == 9 & q[3:0] == 9);
    assign ena[3] = (q[11:8] == 9 & q[7:4] == 9 & q[3:0] == 9);
    
    bcd b0( clk, reset, 1'b1, q[3:0]);
    bcd b1( clk, reset, ena[1], q[7:4]);
    bcd b2( clk, reset, ena[2], q[11:8]);
    bcd b3( clk, reset, ena[3], q[15:12]);

endmodule




module bcd ( input clk, reset, enable , output reg [3:0]q);
    
    
    
    always@(posedge clk)
        begin 
            if(reset) 
                q<=0;
            else  if(enable)
                begin 
                    
                    if(q==9)
                        q<=0;
                    else 
                        q<=q+1;
                end 
            else q <= q;
            
            
        end 
    
endmodule 
