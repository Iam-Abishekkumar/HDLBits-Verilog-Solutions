// HDLBits: Rule 110
// https://hdlbits.01xz.net/wiki/rule110

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 
    
    always@(posedge clk)
        begin 
            if(load)
                q<=data;
            
            else 
                
                q<= (q ^ {q[510:0],1'b0}) | (~ ({1'b0, q[511 : 1] }) & { q[510:0],1'b0} );
        end 
    
    
endmodule
