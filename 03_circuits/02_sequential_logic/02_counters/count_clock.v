// HDLBits: 12-hour clock
// https://hdlbits.01xz.net/wiki/count_clock

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    
    reg [1:0]h_enable,m_enable,s_enable;
    reg [7:0]h_load,m_load,s_load;
    reg [1:0]h_enable_h,m_enable_m,s_enable_s;
   
    
    bcd h0( clk, h_enable_h[0], h_enable[0], h_load[3:0], hh[3:0]);
    bcd h1( clk, h_enable_h[1], h_enable[1], h_load[7:4], hh[7:4]);
    bcd m0( clk, m_enable_m[0], m_enable[0], m_load[3:0], mm[3:0]);
    bcd m1( clk, m_enable_m[1], m_enable[1], m_load[7:4], mm[7:4]);
    bcd s0( clk, s_enable_s[0], s_enable[0], s_load[3:0], ss[3:0]);
    bcd s1( clk, s_enable_s[1], s_enable[1], s_load[7:4], ss[7:4]);     
    
    always@(*)
        begin 
            h_enable = 0;
            m_enable =0;
            s_enable = 0; 
            h_enable_h = 0;
            m_enable_m =0;
            s_enable_s = 0; 
            h_load = 0 ;
            m_load = 0;
            s_load = 0;
        
            
            if( reset)
                begin 
                    {h_enable, m_enable , s_enable } = 6'b111111;
                    {h_load , m_load, s_load } = 24'h12_00_00;
                    
                end 
            
         
            else if  ( ena)
                begin 
                    s_enable_s[0] = 1'b1;
                    s_enable_s[1] = (ss[3:0] == 9);
                    m_enable_m[0] = ( ss[3:0] == 9 && ss[7:4] == 5) ;
                    m_enable_m[1] = ( ss[3:0] == 9 && ss[7:4] == 5 && mm[3:0] == 9); 
                    h_enable_h[0] = ( ss[3:0] == 9 && ss[7:4] == 5 && mm[3:0] == 9 && mm[7:4] == 5);
                    h_enable_h[1] = ( ss[3:0] == 9 & ss[7:4] == 5 && mm[3:0] == 9 && mm[7:4] == 5 && hh[3:0] ==9 ); 
                    
                    if( ss == 8'h59 ) begin 
                        s_enable[1] = 1'b1;
                        s_load[7:4] = 4'b0;
                    end 
                    
                    if( mm == 8'h59 &&  ss == 8'h59  ) begin 
                        m_enable[1] = 1'b1;
                        m_load[7:4] = 4'b0;
                    end 
                    if( hh == 8'h12 && mm == 8'h59 && ss == 8'h59  ) begin 
                        h_enable = 2'b11;
                        h_load[7:0] = 8'h01;
                      
                    end 
                 
                    
                    
                end 
             end 
 
    
    
    always@(posedge clk)
        begin 
            if(reset)
                pm = 0;
            else   if( hh == 8'h11 && mm == 8'h59 && ss == 8'h59  ) begin 
                        pm = ~pm ;
                    end   
        end 
    
   /* initial 
    begin 
                    {h_enable, m_enable , s_enable } = 6'b111111;
                    {h_load , m_load, s_load } = 24'h12_00_00;
                     pm=1'b0;
                     count = 0;
    end */
   
endmodule





module bcd( input clk,  enable,load_enable, input [3:0]load ,  output reg [3:0] q);
    
    always@(posedge clk)
        begin 
            
            
            if(load_enable)
                q<=load;
                
              else   if(enable)
                    begin 
                        if(q==9)
                            q<=0;
                      
                        else 
                            q<=q+1;
                    end 
            
                else 
                    q<=q;
             
                
        end 
    
    
    
endmodule 