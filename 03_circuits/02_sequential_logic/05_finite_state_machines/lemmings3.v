// HDLBits: Lemmings 3
// https://hdlbits.01xz.net/wiki/lemmings3

/*module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output reg digging ); 
    
    
    
    localparam [1:0] right = 0, left = 1, fall=2, digg =3 ;
    
    reg [1:0] state, next, prev, prev1;
    reg aah;
    always@(posedge clk or posedge areset)
        begin 
            //aah <=1'b0;
            if(areset) begin 
                state<= left;
                aah <=1'b0;
             prev <= left;
            end 
            else if(~ground)
                begin  
                state <= fall;
                aah <=1'b1;
               // prev1<= fall;
            end 
           
   
            else if ( dig && (state == left || state == right))
                begin 
                state <= digg;
                    aah<=1'b0;
                
            end 
            
            else  if (state != digg) 
                begin 
                
                state<=next;
                 prev <= next;
                aah <= 1'b0;
                 //prev1 <= next;
            end 
        end 
    always@(*)
        begin 
            next = state;
            digging = 1'b0;
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
                
                digg : begin 
                    
                    digging = 1'b1;
                   next = digg;
                end 
                
                
            endcase
        end 
    
    
    assign walk_left = (state == digg) ? 0 : ( (state == fall ) ? 0 :  ( state == left));
    assign walk_right = (state == digg) ? 0 : ( ( state == fall) ? 0 : ( state == right));
    assign aaah = aah;
    


endmodule

*/

/*module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output reg digging );

    localparam [1:0] RIGHT = 0, LEFT = 1, FALL = 2, DIGG = 3;

    reg [1:0] state, next, prev;
    reg aah;

    // Sequential block
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;
            prev  <= LEFT;    // <-- initialize prev too
            aah   <= 1'b0;
        end
        else if (~ground) begin
            // Save walking direction ONLY when transitioning from a walk state
            if (state == LEFT || state == RIGHT)
                prev <= state;  // <-- save before falling
            state <= FALL;
            aah   <= 1'b1;
        end
        else if (dig && (state == LEFT || state == RIGHT)) begin
            prev  <= state;   // <-- save before digging
            state <= DIGG;
            aah   <= 1'b0;
        end
        else begin
            state <= next;
            aah   <= 1'b0;
            // No prev update here — prev only saved at walk→fall or walk→digg
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next    = state;
        digging = 1'b0;
        case (state)
            LEFT  : next = bump_left  ? RIGHT : LEFT;
            RIGHT : next = bump_right ? LEFT  : RIGHT;
            FALL  : next = ground     ? prev  : FALL;  // restore saved direction
            DIGG  : begin
                digging = 1'b1;
                next    = DIGG;
            end
        endcase
    end

    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah       = aah;

endmodule
*/
// check 

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
    output     aaah,
    output reg digging
);

    localparam [1:0] right = 0, left = 1, fall = 2, digg = 3;

    reg [1:0] state, next, prev, prev1;
    reg       aah;

    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= left;
            prev  <= left;
        end
        else if (~ground) begin
            state <= fall;
        end
        else if (dig && (state == left || state == right)) begin
            state <= digg;
        end
        else if (state != digg) begin
            state <= next;
            prev  <= next;
        end
    end

    always @(*) begin
        next       = state;
        digging    = 1'b0;
        walk_left  = 1'b0;
        walk_right = 1'b0;
        aah        = 1'b0;

        case (state)
            left : begin
                walk_left = 1'b1;
                if (bump_left) next = right;
                else           next = left;
            end

            right : begin
                walk_right = 1'b1;
                if (bump_right) next = left;
                else            next = right;
            end

            fall : begin
                aah = 1'b1;
                if (ground) next = prev;
                else        next = fall;
            end

            digg : begin
                digging = 1'b1;
                next    = digg;
            end
        endcase
    end

    assign aaah = aah;

endmodule
*/

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
    
    
    
    localparam  [3:0] left =0, right =1, fall_l =2, fall_r = 3, dig_r = 4, dig_l =5;
    reg [3:0]state, next;
    
    
    always@(posedge clk or posedge areset)
        
        begin 
            if(areset)
                begin 
                  state<=left;  
                    
                end 
            else 
                state <= next;

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
                        if(ground)
                            next = left;
                        else next = fall_l;
                    end 
                    fall_r :begin 
                        if(ground)
                            next = right;
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

