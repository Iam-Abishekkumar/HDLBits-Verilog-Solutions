// HDLBits: Mux and DFF
// https://hdlbits.01xz.net/wiki/mt2015_muxdff

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
  wire w; 
    
    assign w = L ? r_in : q_in ;
    always@(posedge clk)
        begin 
            Q<=w;
        end 
    
    
    

endmodule




/*module dfm ( input a , b sel, clk, output q);
    
    wire w; 
    
    assign w = sel ? b : a;
    always@(posedge clk)
        begin 
            q<=w;
        end 
        
        
endmodule */
