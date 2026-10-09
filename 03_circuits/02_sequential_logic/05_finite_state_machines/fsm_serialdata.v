// HDLBits: Serial receiver and datapath
// https://hdlbits.01xz.net/wiki/fsm_serialdata

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output  [7:0] out_byte,
    output done
); //

        localparam [2:0]  start = 0, bits =1, stop = 2,donee = 3,search = 4;
    reg [2:0] state, next;
    
    
    //reg donee;
    reg [4:0] count;
    reg [7:0] data;
    always@(posedge clk)
        begin 
            if(reset) begin 
              state <= start;
                count <= 0;
                data <=0;
            end
            else 
                begin 
                    state <= next;
                    
                   if (state == bits)
                       data[count] <= in;
                    
                    if(state == bits) begin 
                        //data[count] <= in;
                        count <= count + 1'b1;
                    end 
                     else 
                         count <=0;
                end 
        end 
    always@(*)
        begin 
            next = state; 
            
            case(state)
                start :begin 
                    //data = 0;
                    if(~in) next = bits;
                end 
                 bits : begin 
                      //data[count] = in;
                     if( count > 6 ) next = stop;   
                 end 
                
                stop : begin 
                    if(in)
                        next = donee;
                    else 
                        next = search;
                end 
                donee : begin 
                    if(~in) next = bits;
                    else next = start;
                end 
                search : begin 
                    
                    if(in) next = start;

                end 
                
                
            endcase 
            
            
        end 
    
    
    assign done = (state == donee);
    //assign out_byte = (state == donee) ? data : 0; 
 assign out_byte = data;
endmodule
