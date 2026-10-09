// HDLBits: Q5a: Serial two's complementer (Moore FSM)
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q5a

module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    
    localparam [1:0] idle =0, first =1, second = 2;
    
    reg [1:0] state , next ;
    
    always@(posedge clk or  posedge areset)
        begin 
            if(areset)
                begin 
                state <= idle;
                z<= 0 ;
                end 
            else begin 
                
                state <= next;
                
                if(state == idle ) z<= x;
                if(state == first) z <= x;
                if(state == second) z <= ~x;
                    
            end 
        end 
    
    always@(*)
        begin 
            next  = state;
            
            case(state)
                
                idle : begin 
                    
                    if(~x) next = first;
                    if(x) next = second ;
                    
                end
                first : begin 
                    
                    if(x) next = second;
                    else next = first;
                    
                end 
                
                second : begin 
                    
                    next = second;
                     
                end 
                
                
                
                

            endcase 
            
        end 
    
    
    
    
   /* always@(*)
        begin 
            case(state)
                idle : z = 0;
                first : z = x;
                second : z = ~x;
            endcase
        end */

endmodule

    
