// HDLBits: 3-bit population count
// https://hdlbits.01xz.net/wiki/popcount3

module top_module( 
    input [2:0] in,
    output reg [1:0] out );
    always @(*)begin 
        out = 0;
        for (int i =0; i<3; i =i +1'b1)
            begin 
                if(in[i])
                out = out +1'b1 ;   
            end 
    end
    
endmodule
