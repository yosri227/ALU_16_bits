
module shift_unit #(parameter width =16) // Parameterized design 

// Port declaration 

(      input      [width-1:0] A,
       input      [width-1:0] B,
       input                  clk,
       input                  rest,
       input      [1:0]       alu_fun,
       input                  shift_EN,
       output reg [(width*2)-1:0] shift_out,
       output reg             shift_flag
       );
         
       reg  [(width*2)-1:0]  shift_out_reg; 
              
       // sequential always 
       
 always @(posedge clk or negedge rest)  //Asynchronous rest
       begin 
         if(!rest)
        shift_out <='b0;
      else
          shift_out <=shift_out_reg;
       end  
       
     // combinational always
      
 always @(*)
      begin 
        shift_flag=1'b0;
        shift_out_reg='b0;
        if(shift_EN)
          begin
          case(alu_fun)   // case statement 
              2'b00:begin              
                        shift_out_reg=A>>1;
                        shift_flag=1'b1;
                    end                                   
              2'b01:begin
                        shift_out_reg=A<<1;
                        shift_flag=1'b1;
                    end                 
              2'b10:begin
                        shift_out_reg=B>>1;
                        shift_flag=1'b1;
                    end 
              2'b11:begin   
                        shift_out_reg=B<<1;
                        shift_flag=1'b1;
                    end 
             default: shift_out_reg='b0; 
             endcase  
          end
          else
             begin
             shift_out_reg='b0;
             end
      end       
  endmodule   





