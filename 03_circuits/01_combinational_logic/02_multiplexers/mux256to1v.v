// HDLBits: 256-to-1 4-bit multiplexer
// https://hdlbits.01xz.net/wiki/mux256to1v

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    assign out = in [ sel * 4 +: 4];

endmodule
