
module cmp_unit #(parameter width =16) // Parameterized design 

// Port declaration 

(      input      [width-1:0] A,
       input      [width-1:0] B,
       input                  clk,
       input                  rest,
       input      [1:0]       alu_fun,
       input                  cmp_EN,
       output reg [width-1:0] cmp_out,
       output reg             cmp_flag
       );
         
       reg [width-1:0]  cmp_out_reg; 
              
       // sequential always 
       
 always @(posedge clk or negedge rest)  //Asynchronous rest
       begin 
         if(!rest)
        cmp_out ='b0;
      else
          cmp_out <=cmp_out_reg;
       end  
       
     // combinational always
      
 always @(*)
      begin 
        cmp_flag=1'b0;
        cmp_out_reg=1'b0;
        if(cmp_EN)
          begin
              case(alu_fun)   // case statement 
              2'b00: begin
                        cmp_out_reg='b0;
                        cmp_flag=1'b1;
                     end                                       
              2'b01:begin
                     if(A==B)
                       begin
                        cmp_out_reg='b1;
                        cmp_flag=1'b1;
                       end 
                      else
                        begin
                        cmp_out_reg='b0;
                        end
                    end
              2'b10:begin
                     if(A>B)
                       begin
                        cmp_out_reg='b10;
                        cmp_flag=1'b1;
                       end 
                      else
                        begin
                        cmp_out_reg='b0;
                        end
                    end
              2'b11:begin
                     if(A<B)
                       begin
                        cmp_out_reg='b11;
                        cmp_flag=1'b1;
                       end 
                      else
                        begin
                        cmp_out_reg='b0;
                        end
                    end
              default: cmp_out_reg='b0; 
              endcase
       end        
       else
          begin
          cmp_out_reg='b0;
          end 
      end
  endmodule   



