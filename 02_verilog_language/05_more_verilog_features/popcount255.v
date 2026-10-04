// HDLBits: Combinational for-loop: 255-bit population count
// https://hdlbits.01xz.net/wiki/popcount255

module top_module( 
    input [254:0] in,
    output  reg [7:0] out );
    
    always@(*)
        begin
          out =0;
            for ( int i =0 ; i <$bits(in); i=i+1)
                 begin 
                     if (in[i] == 1'b1)
                        out = out +1'b1;
                 end 
          
            
        end 
endmodule
