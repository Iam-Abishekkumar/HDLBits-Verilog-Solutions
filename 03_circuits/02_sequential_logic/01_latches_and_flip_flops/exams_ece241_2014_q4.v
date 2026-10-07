// HDLBits: DFFs and gates
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q4

module top_module (
    input clk,
    input x,
    output z
); 

    wire w,v,y,q1,q2,q3,q1b,q2b,q3b;
    assign w = x ^ q1;
    assign v = x & q2b;
    assign y = x | q3b; 
    assign z = ~ (q1 | q2| q3);
    
    df a1( .d(w),
          .clk(clk),
          .q(q1)
         );
    df a2( .d(v),
          .clk(clk),
          .q(q2),
          .qb(q2b)
         );
    
    df a3( .d(y),
          .clk(clk),
          .q(q3),
          .qb(q3b)
         );
    
    
  
    
endmodule



module df( input d, clk, output reg q,output reg qb);
        
    always@(posedge clk)
        begin 
            q<=d;
            qb<= ~d;
            end 
    
  initial 
        begin 
            q<=0;
            qb<=1;
        end 
        
    endmodule 
    
