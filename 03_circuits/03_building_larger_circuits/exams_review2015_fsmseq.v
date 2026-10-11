// HDLBits: FSM: Sequence 1101 recognizer
// https://hdlbits.01xz.net/wiki/exams/review2015_fsmseq

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    localparam  [2:0] a= 0, b=1,c=2,d=3,e=4;
    reg [2:0] state, next;
    
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
                a: next = data ? b : a;
                b: next = data ? c : a;
                c: next = data ? c : d;
                d: next = data ? e : a;
                e : next = e;
                
            endcase

        end 
    
   //assign start_shifting  = ((state == d) && data ) || (state == e);
    assign start_shifting  = (state == e);
    

endmodule
