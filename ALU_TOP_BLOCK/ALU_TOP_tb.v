module ALU_TOP_tb ();
 // all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire  
  
  reg  [15:0] A_tb;
  reg  [15:0] B_tb;
  reg  [3:0]  alu_fun_tb;
  reg         clk_tb;
  reg         rest_tb;
  wire [15:0] ari_out_tb;
  wire        carry_out_tb;
  wire        ari_flag_tb;
  wire [15:0] log_out_tb;
  wire        log_flag_tb;
  wire [15:0] cmp_out_tb;
  wire        cmp_flag_tb;
  wire [15:0] shift_out_tb;
  wire        shift_flag_tb;
  
  // intial block 
  initial 
  begin
  $dumpfile("ALU_TOP.vcd") ;
  $dumpvars ;
  //initial values
  A_tb=16'b0;
  B_tb=16'b0;
  alu_fun_tb=4'b0;
  clk_tb=1'b0;
  rest_tb=1'b1;  // generate rest
  
  $display ("TEST CASE 1") ;  // test arthimatic operation (A+B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0010;
  alu_fun_tb=4'b0;
  #7
  if(ari_out_tb==16'b0101)
    $display ("this is addition operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 2") ;  // test arthimatic operation (A-B)
  #3
  A_tb=16'b0100;
  B_tb=16'b0010;
  alu_fun_tb=4'b0001;
  rest_tb=1'b0;   // rest all outputs 
  #7
  if(ari_out_tb==16'b0010)
    $display ("this is subtraction operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 3") ;  // test arthimatic operation (A*B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0010;
  alu_fun_tb=4'b0010;
  rest_tb=1'b1;
  #7
  if(ari_out_tb==16'b0110)
    $display ("this is multiplication operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 4") ;  // test arthimatic operation (A/B)
  #3
  A_tb=16'b0110;
  B_tb=16'b0010;
  alu_fun_tb=4'b0011;
  #7
  if(ari_out_tb==16'b0011)
    $display ("this is division operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 5") ;  // test logic operation (A&B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0101;
  alu_fun_tb=4'b0100;
  #7
  if(log_out_tb==16'b0001)
    $display ("this is AND operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 6") ;  // test logic operation (A|B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0101;
  alu_fun_tb=4'b0101;
  #7
  if(log_out_tb==16'b0111)
    $display ("this is OR operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 7") ;  // test logic operation ~(A&B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0101;
  alu_fun_tb=4'b0110;
  #7
  if(log_out_tb==16'b1110)
    $display ("this is NAND operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 8") ;  // test logic operation ~(A|B)
  #3
  A_tb=16'b0011;
  B_tb=16'b0101;
  alu_fun_tb=4'b0111;
  #7
  if(log_out_tb==16'b1000)
    $display ("this is NOR operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 9") ;  // test compare operation 
  #3
  A_tb=16'b0011;
  B_tb=16'b0101;
  alu_fun_tb=4'b1000;
  #7
  if(cmp_out_tb==16'b0000)
    $display ("this is NOP operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 10") ;  // test compare operation 
  #3
  A_tb=16'b0011;
  B_tb=16'b0011;
  alu_fun_tb=4'b1001;
  #7
  if(cmp_out_tb==16'b0001)
    $display ("this is Equal operation" );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 11") ;  // test compare operation 
  #3
  A_tb=16'b0011;
  B_tb=16'b0001;
  alu_fun_tb=4'b1010;
  #7
  if(cmp_out_tb==16'b0010)
    $display (" A is larger " );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 12") ;  // test compare operation 
  #3
  A_tb=16'b0001;
  B_tb=16'b0011;
  alu_fun_tb=4'b1011;
  #7
  if(cmp_out_tb==16'b0011)
    $display (" B is larger " );
  else  
  $display ("no operation ");
  
  $display ("TEST CASE 13") ;  // test shift operation 
  #3
  A_tb=16'b0011;
  alu_fun_tb=4'b1100;
  #7
  if(shift_out_tb==16'b0001)
    $display (" A>>1 " );
  else  
  $display ("no operation ");
  
   $display ("TEST CASE 14") ;  // test shift operation 
  #3
  A_tb=16'b0011;
  alu_fun_tb=4'b1101;
  #7
  if(shift_out_tb==16'b0110)
    $display (" A<<1 " );
  else  
  $display ("no operation ");
  
   $display ("TEST CASE 15") ;  // test shift operation 
  #3
  B_tb=16'b0100;
  alu_fun_tb=4'b1110;
  #7
  if(shift_out_tb==16'b0010)
    $display (" B>>1 " );
  else  
  $display ("no operation ");
  
   $display ("TEST CASE 16") ;  // test shift operation 
  #3
  B_tb=16'b0100;
  alu_fun_tb=4'b1111;
  #7
  if(shift_out_tb==16'b1000)
    $display (" B<<1 " );
  else  
  $display ("no operation ");
  
 #50
 $finish;  
 end
  // Clock Generator  
  always 
  begin
     #4 clk_tb = 1'b1;
     #6 clk_tb = 1'b0;
   end
 
  
  //port mapping
  
ALU_TOP U_alu_top (
   .A(A_tb),
   .B(B_tb),
   .alu_fun(alu_fun_tb),
   .clk(clk_tb),
   .rest(rest_tb),
   .ari_out(ari_out_tb),
   .carry_out(carry_out_tb),
   .ari_flag(ari_flag_tb),
   .log_out(log_out_tb),
   .log_flag(log_flag_tb),
   .cmp_out(cmp_out_tb),
   .cmp_flag(cmp_flag_tb),
   .shift_out(shift_out_tb),
   .shift_flag(shift_flag_tb)
  );
endmodule 
  
  
  
  
  
  
  
  
