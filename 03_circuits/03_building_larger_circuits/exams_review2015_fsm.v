// HDLBits: FSM: The complete FSM
// https://hdlbits.01xz.net/wiki/exams/review2015_fsm

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    localparam [3:0]  a=0,b=1, c=2, d=3, e=4, f=5,g=6,h=7,i=8,j=9;
    reg [3:0]  state, next;
    
    //reg rst;
    //wire start_shift;
    
    always@(posedge clk)
        begin 
            if(reset)
                state <= a;
            else 
                state <= next;
        end 
    
    
    always@(*)
        begin  
            next = state;
            shift_ena=0;
            counting = 0;
            done = 0;
            case(state)
                
                a: next = data ? b : a;
                b: next = data ? c : a;
                c: next = data ? c : d;
                d : next = data ? e : a;

            e : begin shift_ena=1; next = f; end 
            f: begin shift_ena=1; next = g; end 
            g: begin shift_ena=1; next = h; end 
            h: begin shift_ena=1; next = i; end 
            i: begin 
                
                counting = 1;
                if(done_counting == 1)
                    next = j;
            end 
             
            j: begin 
                done = 1;
                if(ack) next = a;
                
            end 
                endcase
            
        end 
            
        
    
 
    

endmodule







