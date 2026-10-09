// HDLBits: PS/2 packet parser and datapath
// https://hdlbits.01xz.net/wiki/fsm_ps2data

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

    localparam [2:0]byte1 =0, byte2=1, byte3 =2, donee =3, donee_byte2 =4;
    reg [2:0] state,next;
    
    
    always@(posedge clk)
        begin 
            if(reset)begin 
                state <= byte1;
              
            end 
            else 
                state <= next;

        end 
    
    

    // State flip-flops (sequential)
    reg [7:0] temp;
    always@(*)
        begin 
            
            next = state;
            case(state)
                
                byte1 : begin 
                    if(in[3]) begin  next = byte2;
                        out_bytes[23:16] = in;
                    end 
                end 
                    byte2: begin 
                        next = byte3;
                        out_bytes[15:8] = in;
                    end 
                    byte3: begin 
                        next = donee;
                        out_bytes[7:0] = in;
                    end 
                donee: begin
                    if(in[3])
                        begin 
                           next = donee_byte2;
                           temp = in;
                end 
                    else next=byte1;
                end 
                
                donee_byte2 : begin 
                    next = byte3;
                    out_bytes[15:8] = in;
                    out_bytes[23:16] = temp;
                end 
                
            endcase 
            
        end 
 
    // Output logic
    
    
    assign done = (state == donee);


endmodule
