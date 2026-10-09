// HDLBits: Q3b: FSM
// https://hdlbits.01xz.net/wiki/exams/2014_q3bfsm

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    localparam [3:0] a=0,b=1,c=2,d=3,e=4;
    reg [3:0] state , next;
    
    always@(posedge clk)
        begin 
            
            if(reset)
                state <= a;
            else state <= next;
 
        end 
    
    always@(*)
        begin 
            next = state;
            
            case(state)
               a: begin 
                   if(x) next = b;
                   else next = a;
                   
               end 
                b: begin 
                    if(x) next = e;
                   else next = b;
                    
                end 
                c: begin 
                     if(x) next = b;
                   else next = c;
                    
                end 
                
                d: begin 
                    if(x) next = c;
                   else next = b;
                    
                    
                end 
                e: begin 
                    if(x) next = e;
                   else next = d; 
                end 
                
            endcase
            
            
            
        end 
    
    
    assign z = (state==d) || (state==e);

endmodule
