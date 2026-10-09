// HDLBits: Simple state transitions 3
// https://hdlbits.01xz.net/wiki/fsm3comb

module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    localparam A=0, B=1, C=2, D=3;
   /* reg state, next;
    always@(posedge clk)
        begin 
            state <=next_state;
        end */
    
    always@(*)
        begin 
            next_state = state ; 
            case(state)
                A: if(in) next_state = B ;
                B:begin if(in) next_state = B ;
                else next_state = C;
              end 
                C:begin if(in) next_state = D ;
                else next_state = A;
              end 
                D:begin if(in) next_state = B ;
                else next_state = C;
              end 
                
            endcase 
        end 
    assign out = ( state == D ) ? 1 :0;

endmodule
