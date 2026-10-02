// HDLBits: Combinational for-loop: Vector reversal 2
// https://hdlbits.01xz.net/wiki/vector100r

module top_module( 
    input [99:0] in,
    output [99:0] out
);
    reg [99:0] out_r =0;
    integer i;
    always@(*)begin
        for ( i=0; i<100; i = i+1)
            out_r[99-i] = in[i];
    end 
        assign out = out_r;
    
endmodule
