
module dec_unit  // Parameterized design 

// Port declaration 

(     
       input           [1:0]     alu_fun,
       output    reg             ari_EN,
       output    reg             log_EN,
       output    reg             cmp_EN,
       output    reg             shift_EN
       );
       
         
              
       // combinational always 
       
 always @(*)  
       begin 
       ari_EN=1'b0;
       log_EN=1'b0;
       cmp_EN=1'b0;
       shift_EN=1'b0;
       casex(alu_fun)
         2'b00:ari_EN=1'b1;
         2'b11:shift_EN=1'b1;
         2'b10:cmp_EN=1'b1;
         2'b01:log_EN=1'b1;
         default: begin
                   ari_EN=1'b0;
                   log_EN=1'b0;
                   cmp_EN=1'b0;
                   shift_EN=1'b0;
                  end
       endcase           
       end         
endmodule 