
module log_unit #(parameter width =16) // Parameterized design 

// Port declaration 

(      input      [width-1:0] A,
       input      [width-1:0] B,
       input                  clk,
       input                  rest,
       input      [1:0]       alu_fun,
       input                  log_EN,
       output reg [width-1:0] log_out,
       output reg             log_flag
       );
         
       reg  [width-1:0] log_out_reg; 
              
       // sequential always 
       
 always @(posedge clk or negedge rest)  //Asynchronous rest
       begin 
         if(!rest)
        log_out =1'b0;
      else
          log_out <=log_out_reg;
       end  
       
     // combinational always
      
 always @(*)
      begin 
        log_flag=1'b0;
        log_out_reg='b0;
        if(log_EN)
        begin  
             case(alu_fun)   // case statement 
             2'b00: begin                    
                        log_out_reg=A&B;
                        log_flag=1'b1;
                    end                                     
            2'b01:begin     
                        log_out_reg=A|B;
                        log_flag=1'b1;
                   end     
            2'b10:begin                  
                        log_out_reg=~(A&B);
                        log_flag=1'b1;
                  end                    
           2'b11:begin           
                        log_out_reg=~(A|B);
                        log_flag=1'b1;
                 end                  
           default: log_out_reg='b0; 
          endcase  
        end
        else
            begin
            log_out_reg='b0;
            end
      end      
  endmodule   

