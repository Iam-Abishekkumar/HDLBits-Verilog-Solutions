// HDLBits: Reduction operators
// https://hdlbits.01xz.net/wiki/reduction

module top_module (
    input [7:0] in,
    output parity); 
assign parity = ^in;
endmodule
