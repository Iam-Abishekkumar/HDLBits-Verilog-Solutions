// HDLBits: Counter 1-12
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q7a

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output reg c_enable,
    output reg c_load,
    output reg [3:0] c_d
); //

    count4 the_counter (clk, c_enable, c_load, c_d , Q );
    
    always@(*)
        begin 
            c_load = 0;
            c_d = 0;
            c_enable =0;
            
            if(reset)begin 
                c_load = 1;
                c_d = 1;
            end 
            else if (enable )
                begin 
                    
                    c_enable = 1; 
                    
                    if(	Q==12)begin
                        c_load = 1;
                    c_d = 1;
                    end
                end 
        end 

endmodule
