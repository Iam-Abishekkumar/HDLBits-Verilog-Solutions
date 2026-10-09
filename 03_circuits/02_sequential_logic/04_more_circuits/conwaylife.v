// HDLBits: Conway's Game of Life 16x16
// https://hdlbits.01xz.net/wiki/conwaylife

module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 

    
    reg [255:0]next;
    reg [3:0] count;
    integer row, column,rm1,rp1,cm1,cp1;
    reg[7:0]idx;
    
    
    
    always@(posedge clk)
        begin 
            if(load)
                q<= data;
              else 
                  q<=next;
                  
                  
        end 
         always@(*)
                      begin 
                          
                          for(row = 0; row<16; row=row+1)
                              begin 
                                  for(column= 0; column<16; column=column+1)
                                      begin 
                                          rm1 = (row == 0)  ? 15 : row - 1;
                                          rp1 = (row == 15) ? 0  : row + 1;
                                          cm1 = (column == 0)  ? 15 : column - 1;
                                          cp1 = (column == 15) ? 0  : column + 1;
                                          
                                          count = q[rm1*16 + cm1]+ q[rm1*16 + column]+
                                          q[rm1*16 + cp1]+
                                          q[row*16 + cm1]+
                                          q[row*16 + cp1]+
                                          q[rp1*16 + cm1]+
                                          q[rp1*16 + column]+
                                          q[rp1*16 + cp1];
                                          idx = row*16 + column;
                                         if (count == 3)
                                            next[idx] = 1;
                                        else if (count == 2)
                                            next[idx] = q[idx];
                                        else
                                            next[idx] = 0;
                                         
                                      end 
                                  
                                  
                              end 
                          
                          
                          
                      end 
    
    
    
    
endmodule
