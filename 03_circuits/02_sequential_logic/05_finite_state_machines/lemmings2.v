// HDLBits: Lemmings 2
// https://hdlbits.01xz.net/wiki/lemmings2

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output  aaah ); 

    
    localparam [1:0] right = 0, left = 1, fall=2;
    
    reg [1:0] state, next, prev;
    reg aah;
    always@(posedge clk or posedge areset)
        begin 
            //aah <=1'b0;
            if(areset) begin 
                state<= left;
                aah <=1'b0;
            end 
            else if(~ground)
                begin  
                state <= fall;
                aah <=1'b1;
                
            end 
            
            else begin 
                
                state<=next;
                 prev <= next;
                aah <= 1'b0;
               
            end 
        end 
    always@(*)
        begin 
            next = state;
            case (state)
               left :
                   begin 
                       if(bump_left)
                           next = right;
                       
                       else 
                           next = left;
                   end 
                
                right : begin 
                    
                    if(bump_right)
                        next  = left;
                    else 
                           next = right ;
                end
                
                fall : begin 
                    if(ground)
                        next = prev;
                    else next = fall;
                end 
                
                
            endcase
        end 
    
    
    assign walk_left = (state == fall ) ? 0 :  ( state == left);
        assign walk_right =  ( state == fall) ? 0 : ( state == right);
    assign aaah = aah;
    
    
    
    
    
    
    
    
    
endmodule
