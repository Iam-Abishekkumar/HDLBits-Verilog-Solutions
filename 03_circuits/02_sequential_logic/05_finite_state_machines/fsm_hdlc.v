// HDLBits: Sequence recognition
// https://hdlbits.01xz.net/wiki/fsm_hdlc

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output reg disc,
    output reg flag,
    output reg err);

    localparam [4:0] none =0, one=1,two=2, three = 3, four = 4, five = 5, six = 6, error = 7, discc = 8, flagg = 9;
    
    reg [4:0]state, next;
    
    always@(posedge clk)
        begin 
            
            if(reset)
                state <= none;
            else 
                state <= next;
            
        end 
    
    always@(*)
        
        begin 
            next = state;
            disc = 0;
            flag = 0;
            err = 0;
            
            
            case(state)
                none :  begin 
                    if(in) next = one;
                   else next = none;
                end 
                one: begin 
                    if(in) next = two;
                   
                    else next = none;
                end
                two :begin 
                    if(in) next = three;
                    else next = none;
                end
                three :begin 
                     if(in) next = four;
                    else next = none;
                end 
                four : begin 
                    if(in) next = five;
                    else next = none;
                end 
                five: 
                    begin 
                        if(in) next = six;
                        else next = discc;
                    end 
                six : begin
                    if(~in) next = flagg;
                    else next = error;
                end
                error: begin 
                    err =1;
                    if(~in) next = none;
                    else next = error;
                    
                end     
                        
                     discc : 
                         begin
                              disc = 1;
                             if(in) next = one;
                             else next = none;
                            
                    end 
                        
                    flagg :begin 
                        
                        flag = 1;
                        if(in) next = one;
                        else next = none;
                        
                    end 
            endcase
            
            
        end 
    
endmodule
