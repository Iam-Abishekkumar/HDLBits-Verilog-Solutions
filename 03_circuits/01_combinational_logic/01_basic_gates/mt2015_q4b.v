// HDLBits: Simple circuit B
// https://hdlbits.01xz.net/wiki/mt2015_q4b

module top_module ( input x, input y, output z );

    
    assign z = ~(x^y);
endmodule
