// HDLBits: Gates and vectors
// https://hdlbits.01xz.net/wiki/gatesv

module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    
    genvar i; 
    generate 
        for ( i =0 ; i<3; i =i+1) begin : outboth
           assign  out_both[i] = in[i] & in[i+1];
        end
        
    endgenerate 
    
    genvar j; 
    generate 
        for ( j =1; j<4; j=j+1) begin : outany
            assign  out_any[j] = in[j] | in[j-1];
        end
        
    endgenerate 
    
    genvar k; 
    generate 
        for ( k=0 ; k<3; k =k+1) begin : outdifferent
           assign  out_different[k] = in[k] ^ in[k+1];
        end
        
    endgenerate 
    
    assign out_different[3] = in[3] ^ in[0];
    
    
    
endmodule
