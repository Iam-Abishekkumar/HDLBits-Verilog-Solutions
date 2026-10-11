// HDLBits: Q2b: Another FSM
// https://hdlbits.01xz.net/wiki/exams/2013_q2bfsm

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    localparam [3:0] a=0,b=1,c=2,d=3,e=4,f0=5,g0=6,h0=7,j=8,k=9;
    reg [3:0] state , next ;
    
    always@(posedge clk)
        begin 
            if(!resetn)
                state <= a;
            else
                begin 
                state <= next;
                end 
        end 
    always@(*)
        begin 
        next = state;
            
            case(state)
                    a: next =b;
                    b: next =c;
                    c: next = x ? d :c;  
                    d: next = x ? d : e;
                    e: next = x ? f0 : c;
                    f0 :  next =  y ? j : h0;
                    h0: next = y ? j : k;
                    j  : next =j;
                    k  : next =k;
                
            endcase 
        end 
    assign f = (state == b);
    assign  g= ( state ==f0 ) || (state ==h0) || (state ==j);
    
endmodule
