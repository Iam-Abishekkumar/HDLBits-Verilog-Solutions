// HDLBits: The complete timer
// https://hdlbits.01xz.net/wiki/exams/review2015_fancytimer

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    
    localparam [3:0]  a=0,b=1, c=2, d=3, e=4, f=5,g=6,h=7,i=8,j=9;
    reg [3:0]  state, next;
    
    reg [3:0] delay;
    reg counting_ena;
    
    wire done_c;
    
    always@(posedge clk)
        begin 
            if(reset)begin
                state <= a;
                delay <= 0;
            end
            else begin
                state <= next;
                if( (state == e) || (state == f) || (state == g) || (state == h) )
                    begin 
                        delay <= {delay[2:0], data};   
                    end 
                
                 
                    
              if(state == i && done_c == 1 ) delay <= delay - 1;
                
                
            end 
        end 
    
    
    always@(*)
        begin  
            next = state;
           counting_ena = 0;
            counting = 0;
            done = 0;
            case(state)
                
                a: next = data ? b : a;
                b: next = data ? c : a;
                c: next = data ? c : d;
                d : next = data ? e : a;

            e : begin  next = f; end 
            f: begin  next = g; end 
            g: begin  next = h; end 
            h: begin  next = i; end 
            i: begin 
                counting = 1;
                counting_ena = 1;
                if(delay == 0 )
                    begin 
                if(done_c == 1)
                    next = j;
                    //done = 1;   
                    end 
            end 
             
            j: begin 
                  done = 1;
                if(ack) next = a;
                
            end 
                endcase
            
        end 
    
    assign count = delay;
            
    count dut(
        .clk(clk),
        .reset(reset),
        .counting_ena(counting_ena),
        .done_c(done_c)
    );
    
endmodule


module count (
    input clk,
    input reset,
    input counting_ena,
    output done_c
);
    reg [9:0] count;
    
    assign done_c = (count == 999);                  /* imp chnage by claude */

    always @(posedge clk) begin
        if (reset)
            count <= 0;
        else if (counting_ena) begin
            if (count == 999)
                count <= 0;           
            else
                count <= count + 1;
        end else
            count <= 0;
    end
endmodule