// HDLBits: NAND
// https://hdlbits.01xz.net/wiki/bugs_nand3

module top_module (input a, input b, input c, output out);//
    
    wire intm;

    andgate inst1 ( intm , a, b, c,1'b1,1'b1);
    assign out =  ~intm;

endmodule
