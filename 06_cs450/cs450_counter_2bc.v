// HDLBits: counter_2bc
// https://hdlbits.01xz.net/wiki/cs450/counter_2bc

module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    
    reg [1:0] counter=0;
    always@(posedge clk or posedge areset)
        begin 
            if(areset)
                counter <= 1;
            else 
                
                begin 
                    
                    case({train_valid, train_taken})
                           2'b00: counter <= counter;
                           2'b01: counter <= counter;
                           2'b10: counter <=   (counter == 0) ? 0 : (counter = counter - 1);
                           2'b11: counter <=   (counter == 3) ? 3 : (counter = counter + 1);

                    endcase 
                    
                    
                end 
           
            
        end 

    
    assign state = counter; 
    
endmodule
