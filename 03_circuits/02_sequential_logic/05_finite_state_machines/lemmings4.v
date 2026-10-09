// HDLBits: Lemmings 4
// https://hdlbits.01xz.net/wiki/lemmings4

module top_module(
    input  clk,
    input  areset,
    input  bump_left,
    input  bump_right,
    input  ground,
    input  dig,
    output reg walk_left,
    output reg walk_right,
    output reg  aaah,
    output reg digging
);
    
    
    
    localparam  [3:0] left =0, right =1, fall_l =2, fall_r = 3, dig_r = 4, dig_l =5,splat=6;
    reg [3:0]state, next;
    reg [4:0] count;
    
    always@(posedge clk or posedge areset)
        
        begin 
            
            if(areset)
                begin 
                  state<=left;  
                   count <=0; 
                end 
            else begin 
              //state <= next;
               
                if((state == fall_l || state == fall_r)) begin
                    count <= (count < 5'd31) ? count + 1'b1: count ;
                    state <= next;
                end 
                
                else  begin
                count <= 0;
                    state <= next;
                end 
            end 
            
            
        end 
    
    
    always@(*)
        begin 
            next= state;
            
            case(state)
               	    left : begin 
                        if(~ground)
                            next = fall_l;
                        else if (dig)
                            next = dig_l;
                        else if (bump_left)
                            next = right;
                        else next = left;
                        
                    end 
                    right :begin 
                        if(~ground)
                            next = fall_r;
                        else if (dig)
                            next = dig_r;
                        else if (bump_right)
                            next = left;
                        else next = right;
                    end 
                    fall_l :
                        begin 
                            if(ground)begin 
                                if( count > 5'd19)begin next = splat;
                                    
                                end 
                            else next = left;
                                
                            end 
                        else next = fall_l;
                    end 
                    fall_r :begin 
                            if(ground)begin 
                                if( count > 5'd19) begin next = splat; 
                                    
                                end 
                            else next = right;
                                
                            end 
                        else next = fall_r;
                    end 
                    dig_r  : begin 
                        if(~ground)
                            next = fall_r;
                        else next = dig_r;
                    end 
                     dig_l : begin 
                         if(~ground)
                            next = fall_l;
                        else next = dig_l;
                     end 
                   splat : begin 
                       next = splat;
                   end 
            endcase 
  
        end 
    
    always@(*)
        begin 
         walk_left = 1'b0;
         walk_right= 1'b0;
         aaah  = 1'b0;
         digging   = 1'b0;
            case(state)
                    left :  walk_left = 1'b1;
                    right :  walk_right = 1'b1;
                    fall_l :  aaah = 1'b1;
                    fall_r :  aaah = 1'b1;
                    dig_r :   digging = 1'b1;
                    dig_l :  digging = 1'b1;

            endcase
            
        end 
    
    
    
endmodule 
/*
module top_module(
    input  clk,
    input  areset,
    input  bump_left,
    input  bump_right,
    input  ground,
    input  dig,
    output reg walk_left,
    output reg walk_right,
    output reg aaah,
    output reg digging
);

    localparam [3:0] left   = 0, right  = 1,
                     fall_l = 2, fall_r = 3,
                     dig_r  = 4, dig_l  = 5,
                     splat  = 6;

    reg [3:0] state, next;
    reg [4:0] count;

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= left;
            count <= 0;
        end
        else begin
            state <= next;
            // Track count based on NEXT state to avoid 1-cycle lag
            if (next == fall_l || next == fall_r)
                count <= ( count < 5'd31) ? count + 1'b1: count;
            else
                count <= 0;
        end
    end

    always @(*) begin
        next = state;
        case (state)
            left : begin
                if      (~ground)   next = fall_l;
                else if (dig)       next = dig_l;
                else if (bump_left) next = right;
                else                next = left;
            end
            right : begin
                if      (~ground)    next = fall_r;
                else if (dig)        next = dig_r;
                else if (bump_right) next = left;
                else                 next = right;
            end
            fall_l : begin
                if (ground) begin
                    // count+1 because count registers at end of this cycle
                    if ((count ) > 20) next = splat;
                    else                  next = left;
                end
                else next = fall_l;
            end
            fall_r : begin
                if (ground) begin
                    if ((count ) > 20) next = splat;
                    else                  next = right;
                end
                else next = fall_r;
            end
            dig_l : begin
                if (~ground) next = fall_l;
                else         next = dig_l;
            end
            dig_r : begin
                if (~ground) next = fall_r;
                else         next = dig_r;
            end
            splat : next = splat;
        endcase
    end

    always @(*) begin
        walk_left  = 1'b0;
        walk_right = 1'b0;
        aaah       = 1'b0;
        digging    = 1'b0;
        case (state)
            left   : walk_left  = 1'b1;
            right  : walk_right = 1'b1;
            fall_l : aaah       = 1'b1;
            fall_r : aaah       = 1'b1;
            dig_l  : digging    = 1'b1;
            dig_r  : digging    = 1'b1;
        endcase
    end

endmodule
*/