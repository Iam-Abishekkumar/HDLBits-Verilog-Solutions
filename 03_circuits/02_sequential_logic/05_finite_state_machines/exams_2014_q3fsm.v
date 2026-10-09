// HDLBits: Q3a: FSM
// https://hdlbits.01xz.net/wiki/exams/2014_q3fsm

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output reg z
);
    
    localparam [1:0] a =0, b =1;
    reg  [1:0] state, next;
    reg [1:0] count, count_ones ;
    
    
    always@(posedge clk)
        begin 
            if(reset) begin 
                state <= a;
                count <= 0;
                count_ones <=0;
                
            end 
            else begin 
                
                state <= next;
                
                
                
                
                if( state == b)
                    begin 
                        
                        if(count ==3)begin 
                             count <=1;
                             if(w) count_ones <= 1;
                             else count_ones <=0;
                    end 
                     
                        else begin
                        
                        count <= count +1;
                        if(w) count_ones <= count_ones +1;
                        
                        end 
                        
                        
                    end 

            end 
            
        end
    
    always@(*)
        begin 
            next = state;
            z=0;
            case(state)
                
                a : begin 
                    if(s) next = b;
  
                end 
                
                b: begin 
                    if(count==3 && count_ones ==2)
                        begin 
                           z=1; 
                        end 
                    next = b;
                end 
                
            endcase
            
            
        end 
    
    
endmodule 
    
