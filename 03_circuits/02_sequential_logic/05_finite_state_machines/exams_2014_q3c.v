// HDLBits: Q3c: FSM logic
// https://hdlbits.01xz.net/wiki/exams/2014_q3c

module top_module (
    input clk,
    input [2:0] y,
    input x,
    output reg Y0,
    output z
);
    localparam [2:0] a=0,b=1,c=2,d=3,e=4;
    
    
    always@(*)
        begin 
            Y0 = 0;
            case(y)
               a: begin 
                   if(x) Y0 =1;
                   else Y0  = 0;
                   
               end 
                b: begin 
                    if(~x) Y0 =1;
                   else Y0  = 0;
                    
                end 
                c: begin 
                      if(x) Y0 =1;
                   else Y0  = 0;
                    
                end 
                
                d: begin 
                    if(~x) Y0 =1;
                   else Y0  = 0;
                    
                    
                end 
                e: begin 
                    if(~x) Y0 =1;
                   else Y0  = 0;
                end 
                
            endcase
            
            
            
        end 
    
    
    assign z = (y==d) || (y==e);

    
    
    //assign Y0 = ( y==0 && x) || (y==1 && ~x) ||( y==2 && x ) || ( y ==3 &&  ~x) || ( y==4 && ~x);
    //assign z = y== 3|| y==4;
     
    

endmodule