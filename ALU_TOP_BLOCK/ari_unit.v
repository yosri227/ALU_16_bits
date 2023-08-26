module ari_unit #(parameter width =16,parameter MSB=32) // Parameterized design 

// Port declaration 

(      input      [width-1:0] A,
       input      [width-1:0] B,
       input                  clk,
       input                  rest,
       input      [1:0]       alu_fun,
       input                  ari_EN,
       output reg [width-1:0] ari_out, //change is done in size 
       output reg             carry_out,
       output reg             ari_flag
       );
         
       reg  [width-1:0] ari_out_reg; // width*2 as in multiplication we need n+n bits the largest num of bits
       
             // sequential always 
       
 always @(posedge clk or negedge rest) //Asynchronous rest
       begin 
         if(!rest)
        ari_out ='b0;
      else
          ari_out <=ari_out_reg;
       end  
       
     // combinational always
      
 always @(*)
      begin 
        carry_out=1'b0;
        ari_flag=1'b0;
        ari_out_reg='b0;
        if(ari_EN)
          begin
          case(alu_fun)   // case statement 
          2'b00: begin
                 { carry_out,ari_out_reg}=A+B;
                  ari_flag=1'b1;
                  end 
          2'b01:begin
                {carry_out,ari_out_reg}=A-B;                  
                 ari_flag=1'b1;
                end                               
          2'b10:begin
                ari_out_reg=A*B;
                ari_flag=1'b1;
                end                                 
          2'b11:begin
                ari_out_reg=A/B;
                ari_flag=1'b1;
               end                   
          default: ari_out_reg='b0; 
          endcase
        end  
        else
            begin
            ari_out_reg='b0;
            end   
      end
  endmodule   

