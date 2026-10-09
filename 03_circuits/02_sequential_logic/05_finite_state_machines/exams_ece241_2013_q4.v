// HDLBits: Design a Moore FSM
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q4

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output dfr
); 
    
    
    
    localparam a =0,b=1,c=2,d=3;
    reg [1:0] state, next_state;
   // reg [1:0]check ;
    reg dfr_reg;
    always@(posedge clk)
        begin 
            if(reset) begin 
                state <= a;
                //check <=0;
                dfr_reg <=1;
            end 
            else begin 
                state <= next_state;
                //check <= state;
                //temp <= next_state;
                if (next_state != state)                          // ← ADD THIS
                dfr_reg <= (state > next_state) ? 1'b1 : 1'b0;
        end      
            
        end 
    always@(*)
        begin 
            next_state = state;
            { fr1,fr2,fr3 } = 3'd0;
            case(state)
                a :  begin 
                    
                    { fr1,fr2,fr3 } = {1'b1, 1'b1, 1'b1};
                    
                    if (s[1] & ~s[2] & ~s[3])
                        next_state = b ;
                    else  if(s[1] & s[2] & ~s[3]) 
                        next_state = c;
                    else if(s[1] & s[2] & s[3] )
                        next_state = d;
                    else next_state = a;
                    
                end 
                
                b : begin 
                    { fr1,fr2,fr3 } = {1'b1, 1'b1, 1'b0};
                    if(s[1] & s[2]& ~s[3])
                        next_state = c;
                    else if (~s[1] & ~s[2]& ~s[3])
                        next_state = a;
                    else  if(s[1] & s[2] & s[3] )
                        next_state = d;
                    else next_state = b; 
                end 
            
                c : begin 
                    { fr1,fr2,fr3 } = {1'b1, 1'b0, 1'b0};
                    
                    if(s[1] & s[2] & s[3] )
                        next_state = d;
                    else if (s[1]& ~s[2] & ~s[3])
                        next_state = b;
                    else if (~s[1] & ~s[2] & ~s[3] )
                        next_state = a;
                    else next_state = c;
                end 
            d : begin 
                { fr1,fr2,fr3 } = 3'd0;
                if (s[1] & ~s[2] & ~s[3])
                        next_state = b;
                else if (~s[1] & ~s[2] & ~s[3] )
                        next_state = a;
                else if(s[1] & s[2] & ~s[3])
                        next_state = c;
                else next_state = d;
            end 
                
            endcase
        end 
    
    
    assign dfr = dfr_reg;
    
endmodule
