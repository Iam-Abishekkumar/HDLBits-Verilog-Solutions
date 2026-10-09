// HDLBits: Q2a: FSM
// https://hdlbits.01xz.net/wiki/exams/2012_q2fsm

module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    localparam [2:0] a=0, b=1,c=2,d=3,e=4,f=5;
    reg [2:0] state , next;
    
    always@(posedge clk)
        begin 
            if( reset)
                state <= a; 
            else 
                state <= next ;

        end 
    always@(*)
        begin 
          next = state;
            
            case(state)
                   a: next = w ? b : a;
                   b: next = w ? c : d;
                   c: next = w ? e : d;
                   d: next = w ? f : a;
                   e: next = w ? e : d;
                   f: next = w ? c : d;

            endcase 
            
        end 
    
    assign z = (state == e) || (state == f);
    
endmodule
