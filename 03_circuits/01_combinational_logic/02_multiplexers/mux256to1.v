// HDLBits: 256-to-1 multiplexer
// https://hdlbits.01xz.net/wiki/mux256to1

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out = in[sel];
    

endmodule
