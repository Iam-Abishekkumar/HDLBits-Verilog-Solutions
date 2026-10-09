// HDLBits: Q8: Design a Mealy FSM
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q8

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output reg z ); 
    
    localparam [1:0] one =0, zero = 1, detected =2;
    reg [1:0]state , next;
    
    always@(posedge clk or negedge aresetn)
        begin 
            if(!aresetn)
                state <= one;
            else state <= next;
            
        end 
    
    always@(*)
        begin 
            next = state;
            z = 0;
            
            case(state)
              one :
                  begin 
                      if(x) begin next = zero;
                          z=0;
                      end
                      else begin next = one;
                          z = 0;
                      end 
                      
                  end 
                zero :
                    
                    begin 
                        
                        if(~x)  begin 
                            next = detected ;
                            z=0;
                            
                        end 
                        else begin 
                            z=0;
                            next = zero;
                        end 
                        
                        
                    end 
                
                detected :
                    
                    begin 
                        
                       if(x)  begin 
                            next = zero ;
                            z=1;
                            
                        end 
                        else begin 
                            z=0;
                            next = one;
                        end 
                        
                        
                    end 
                
            endcase
            
        end 

endmodule
