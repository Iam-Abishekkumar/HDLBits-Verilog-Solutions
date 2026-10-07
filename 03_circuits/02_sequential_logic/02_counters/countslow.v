// HDLBits: Slow decade counter
// https://hdlbits.01xz.net/wiki/countslow

module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);
    
    
        always@(posedge clk)
        begin 
            if(reset)
                q<=0;
            else if (slowena)
                begin 
                    if(q==9)
                        q<=0;
                    else     
                q <= q + 1'b1;
                    end 
            else q<=q;
        end 

endmodule
