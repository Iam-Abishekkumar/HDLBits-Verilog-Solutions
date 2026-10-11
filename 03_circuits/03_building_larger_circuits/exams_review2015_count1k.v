// HDLBits: Counter with period 1000
// https://hdlbits.01xz.net/wiki/exams/review2015_count1k

module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    
    reg [9:0] count;
    
    always@(posedge clk)
        begin 
            if(reset)
                count <= 0 ;
                
                else begin 
                    if( count == 999) 
                        count<= 0;
                    
                    else count <= count + 1;

                end 
            
        end 
    
    assign q = count;

endmodule
