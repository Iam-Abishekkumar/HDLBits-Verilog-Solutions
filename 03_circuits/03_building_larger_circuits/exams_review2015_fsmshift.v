// HDLBits: FSM: Enable shift register
// https://hdlbits.01xz.net/wiki/exams/review2015_fsmshift

/*module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [1:0] count;
    
    always@(posedge clk)
        begin 
            if(reset) begin
                shift_ena <= 1; 
                count <= 0;
            end
            else 
                begin 
                    if(count == 3)
                        begin 
                          shift_ena <=0;  
                           //count <= 0;
                        end 
                    
                    else begin 
                        
                      shift_ena <=1;
                      count <= count + 1;
                        
                    end 
                    
                    
                end 
            
            
            
        end 

endmodule */

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] count;
    
    always@(posedge clk)
        begin 
            if(reset) begin
                shift_ena <= 1; 
                count <= 3;
            end
            else 
                begin 
                    
                    if(count > 0 ) begin
                        shift_ena <=1;
                        count = count -1;
                    end
                    
                    else 
                    shift_ena <=0;
                    
                end 
            
            
            
        end 

endmodule
