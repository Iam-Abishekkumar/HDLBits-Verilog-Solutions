// HDLBits: AND gate
// https://hdlbits.01xz.net/wiki/tb/and

module top_module();

    reg [1:0] in;
    wire out ;
    
    andgate dut( in, out);
    
    initial begin 
          in = 0;
        
        #10 in =1;
        
        #10 in =2;
        #10 in =3;
        
        
    end 
    
endmodule
