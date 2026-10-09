// HDLBits: Serial receiver with parity checking
// https://hdlbits.01xz.net/wiki/fsm_serialdp

/*module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    localparam [2:0]  start = 0, bits =1, stop = 2,donee = 3,search = 4, parity = 5;
    reg [2:0] state, next;
    
    
    
    reg [4:0] count;
    reg [8:0] data;
    
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
                    
                    if(~in) next = bits;
                end 
                 bits : begin 
                      //data[count] = in;
                     if( count > 7 ) next = stop;   
                 end 
                
                stop : begin 
                    if(in) begin 
                        if(^data)
                        next = donee;
                        else next = start;
                    end 
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
    assign out_byte = data[7:0];

endmodule
*/

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    localparam [2:0]  start = 0, bits =1, stop = 2,donee = 3,search = 4;
    reg [2:0] state, next;
    
    
    
    reg [4:0] count;
    reg [8:0] data;
    reg rst;
    wire odd;
                                          // first nammmale parity kandu pudichathu nalathan module vachi easy
    always@(posedge clk)                   // ya poda mudinchu 
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
                        
                        count <= count + 1'b1;
                    end 
                     else 
                         count <=0;
                end 
        end 
    always@(*)
        begin 
            next = state; 
            rst = 0;
            case(state)
                start :begin 
                      rst = 1;
                    if(~in) next = bits;
                end 
                 bits : begin 
                     if( count > 7 ) next = stop;   
                 end 
                
                stop : begin 
                    if(in) begin 
                        if(odd)
                        next = donee;
                        else next = start;
                    end 
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
       
    parity dut (
        .clk(clk),
        .reset(rst),
        .in(in),
        .odd(odd)
    );
    
    
    assign done = (state == donee);
    assign out_byte = data[7:0];

endmodule


