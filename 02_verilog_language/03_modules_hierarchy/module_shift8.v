// HDLBits: Modules and vectors
// https://hdlbits.01xz.net/wiki/module_shift8

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    reg [7:0] q1;
    wire [7:0]w1, w2,w3;
    my_dff8 d1( clk , d, w1);
    my_dff8 d2( clk , w1, w2);
    my_dff8 d3( clk , w2, w3);
    always@(*)
        begin 
            case(sel)
                2'b00: q1 = d;
                2'b01:q1 = w1;
                2'b10: q1= w2;
                2'b11: q1 = w3;
            endcase 
        end 
    assign q = q1;

endmodule
