// HDLBits: timer
// https://hdlbits.01xz.net/wiki/cs450/timer

module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output  tc
);
    reg [9:0] count;
    reg t;
    
    always@(posedge clk)
        begin 
           
            if(load) begin 
                
                count <= data;
                if( ! data) t <= 1;
                else t<= 0;

            end 
            else begin 
                if(!count)
                    t <=1;
                else if(count ==1)
                    begin 
                        count <= 0;
                        t <= 1;
                        
                    end 
                
                else begin 
                    
                     count <= count -1; 
                      t <= 0;
                end 
  
            end 
            
        end 
    assign tc = t;
    
    
endmodule
