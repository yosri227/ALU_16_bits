module ALU_TOP #(parameter wid =16,parameter MB=32)  //parameterized design 
  
  //ports declaration 
  
  (
   input  wire [wid-1:0] A,
   input  wire [wid-1:0] B,
   input  wire [3:0]     alu_fun,
   input  wire           clk,
   input  wire           rest,
   output wire  [wid-1:0]  ari_out,  // change is done in size 
   output wire            carry_out,
   output wire            ari_flag,
   output wire  [wid-1:0] log_out,
   output wire            log_flag,
   output wire  [wid-1:0] cmp_out,
   output wire            cmp_flag,
   output wire  [wid-1:0] shift_out,
   output wire            shift_flag
   ); 
  
   
   //internal connection 
  wire  AR_EN,LO_EN,CM_EN,SH_EN; 
  wire [1:0]  ms,ls;
  assign ms=alu_fun[1:0];
  assign ls=alu_fun[3:2];
  
   
   //port mapping 
   
  ari_unit U_arithmatic (
  .A(A),
  .B(B),
  .clk(clk),
  .rest(rest),
  .alu_fun(ms),
  .ari_EN(AR_EN),
  .ari_out(ari_out),
  .carry_out(carry_out),
  .ari_flag(ari_flag)
  );
  
  cmp_unit U_compare (
  .A(A),
  .B(B),
  .clk(clk),
  .rest(rest),
  .alu_fun(ms),
  .cmp_EN(CM_EN),
  .cmp_out(cmp_out),
  .cmp_flag(cmp_flag)
  );
  
  log_unit U_logic (
  .A(A),
  .B(B),
  .clk(clk),
  .rest(rest),
  .alu_fun(ms),
  .log_EN(LO_EN),
  .log_out(log_out),
  .log_flag(log_flag)
  );
  
  shift_unit U_shift (
  .A(A),
  .B(B),
  .clk(clk),
  .rest(rest),
  .alu_fun(ms),
  .shift_EN(SH_EN),
  .shift_out(shift_out),
  .shift_flag(shift_flag)
  );
  
  dec_unit U_decoder (
  .alu_fun(ls),
  .cmp_EN(CM_EN),
  .ari_EN(AR_EN),
  .shift_EN(SH_EN),
  .log_EN(LO_EN)
  );
  
endmodule 

  
