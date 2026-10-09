// HDLBits: Serial receiver
// https://hdlbits.01xz.net/wiki/fsm_serial

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
);
    
    localparam [2:0]  start = 0, bits =1, stop = 2,donee = 3,search = 4;
    reg [2:0] state, next;
    
    
    //reg donee;
    reg [4:0] count;
    
    always@(posedge clk)
        begin 
            if(reset) begin 
              state <= start;
                count <= 0;
            end
            else 
                begin 
                    state <= next;
                    if(state == bits)
                        count <= count + 1'b1;
                     else 
                         count <=0;
                end 
        end 
    always@(*)
        begin 
            next = state; 
            
            case(state)
                start :begin 
                    if(~in) next = bits;
                end 
                 bits : begin 
                     if( count > 6) next = stop; 
                     
                 end 
                stop : begin 
                    if(in)
                        next = donee;
                    else 
                        next = search;
                end 
                donee : begin 
                    if(~in) next = bits;
                    else next = start;
                end 
                search : begin 
                    
                    if(in) next = start;

                end 
                
                
            endcase 
            
            
        end 
    
    
    assign done = (state == donee);
    
    
    

endmodule
