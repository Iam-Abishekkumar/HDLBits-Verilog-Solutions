// HDLBits: Simple FSM 3 (synchronous reset)
// https://hdlbits.01xz.net/wiki/fsm3s

module top_module(
    input clk,
    input in,
    input reset,
    output out); //

  
 localparam a =0,b=1,c=2,d=3;
    reg [1:0]  state, next; 
    always@(posedge clk   )
        begin
            if(reset)
                state <= a;
            else state <= next;
        end 
    
    always@(*)
        begin 
            next = state;
            case(state)
                a: if(in) next = b;
                    b: begin
                        if(in) next = b;
                        else next = c;
                    end 
                    c:begin
                        if(in) next = d;
                        else next = a;
                    end 
                    d:begin
                        if(in) next = b;
                        else next = c;
                    end 
                
            endcase 
        end 
    
    assign out = (state == d) ? 1 :0;
   
endmodule



