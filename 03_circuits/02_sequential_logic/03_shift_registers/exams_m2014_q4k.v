// HDLBits: Shift register
// https://hdlbits.01xz.net/wiki/exams/m2014_q4k

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    
    reg [3:0] q;
    
    always@(posedge clk)
        begin 
            
            if(!resetn)
                q<= 4'b0;
            else 
                q<= { in , q[3:1]};
                
        end 
    
    assign out = q[0];
    
    
    
    
    
endmodule
