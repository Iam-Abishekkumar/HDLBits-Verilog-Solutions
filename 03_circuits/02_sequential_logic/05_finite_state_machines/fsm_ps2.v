// HDLBits: PS/2 packet parser
// https://hdlbits.01xz.net/wiki/fsm_ps2

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    // State transition logic (combinational)
    
    localparam [2:0]byte1 =0, byte2=1, byte3 =2, donee =3;
    reg [2:0] state,next;
    
    
    always@(posedge clk)
        begin 
            if(reset)
                state <= byte1;
            else 
                state <= next;

        end 
    
    

    // State flip-flops (sequential)
    
    always@(*)
        begin 
            
            next = state;
            case(state)
                
                byte1 : begin 
                    if(in[3]) next = byte2;
                end 
                    byte2: begin 
                        next = byte3;
                    end 
                    byte3: begin 
                        next = donee;
                    end 
                donee: begin 
                    if(in[3]) next = byte2;
                    else next=byte1;
                end 
                
            endcase 
            
        end 
 
    // Output logic
    
    
    assign done = (state == donee);

endmodule
