// (C) 1992-2015 Altera Corporation. All rights reserved.                         
// Your use of Altera Corporation's design tools, logic functions and other       
// software and tools, and its AMPP partner logic functions, and any output       
// files any of the foregoing (including device programming or simulation         
// files), and any associated documentation or information are expressly subject  
// to the terms and conditions of the Altera Program License Subscription         
// Agreement, Altera MegaCore Function License Agreement, or other applicable     
// license agreement, including, without limitation, that your use is for the     
// sole purpose of programming logic devices manufactured by Altera and sold by   
// Altera or its authorized distributors.  Please refer to the applicable         
// agreement for further details.                                                 
    



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module acl_int_mult (
	enable,
	clock,
	dataa,
	datab,
	result);

  parameter INPUT1_WIDTH = 64;
  parameter INPUT2_WIDTH = 64;
  parameter OUTPUT_WIDTH = 64;
  parameter SIGNED = 0;
  parameter LATENCY = 3;
 
  // Determine the complete size of the output.
  localparam O_WIDTH = (OUTPUT_WIDTH > (INPUT1_WIDTH + INPUT2_WIDTH)) ? OUTPUT_WIDTH : (INPUT1_WIDTH + INPUT2_WIDTH);
  localparam REP_STRING = (SIGNED == 0) ? "UNSIGNED" : "SIGNED";
    
  input	  [INPUT1_WIDTH - 1 : 0]  dataa;
  input	  [INPUT2_WIDTH - 1 : 0]  datab;
  input	  enable;
  input	  clock;
  output	[OUTPUT_WIDTH - 1 : 0]  result;

  generate
  if ((INPUT1_WIDTH>=19) && (INPUT1_WIDTH<=27) && (INPUT2_WIDTH>=19) && (INPUT2_WIDTH<=27))
  begin
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg	[INPUT1_WIDTH - 1 : 0]  reg_dataa;
    (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg	[INPUT2_WIDTH - 1 : 0]  reg_datab;
  
    // Use a special WYSIWYG for the 27x27 multiplier mode
    always@(posedge clock)
    begin
      if (enable)
      begin
        reg_dataa <= dataa;
        reg_datab <= datab;
      end
    end

    wire [53:0] output_wire;
    wire [26:0] inp_a;
    wire [26:0] inp_b;

    assign inp_a = reg_dataa;
    assign inp_b = reg_datab;

    sv_mult27 the_multiplier(clock,enable,inp_a,inp_b, output_wire);
      defparam the_multiplier.REPRESENTATION = REP_STRING;

    if (SIGNED == 0)
    begin
       if (OUTPUT_WIDTH > 54)
         assign result = {{{OUTPUT_WIDTH-54}{1'b0}}, output_wire};
       else
         assign result = output_wire[OUTPUT_WIDTH-1:0];
    end
    else
    begin
       if (OUTPUT_WIDTH > 54)
         assign result = {{{OUTPUT_WIDTH-54}{output_wire[53]}}, output_wire};
       else
         assign result = output_wire[OUTPUT_WIDTH-1:0];
    end
  end
  else if (((SIGNED == 0) && (OUTPUT_WIDTH >= 33) && (OUTPUT_WIDTH <= 64)) && ((INPUT1_WIDTH == 64) && (INPUT2_WIDTH >= 32) || (INPUT2_WIDTH == 64) && (INPUT1_WIDTH >= 32)))
  begin : GEN_LONG_MUL //Karatsuba algorithm
  	 localparam TMP1_WIDTH = (INPUT1_WIDTH > 32)? INPUT1_WIDTH : 33;
	 localparam TMP2_WIDTH = (INPUT2_WIDTH > 32)? INPUT2_WIDTH : 33;  
    reg [63:0] temp0;
    reg [TMP1_WIDTH-1:0] R_a;
    reg [TMP2_WIDTH-1:0] R_b;
    reg [31:0] temp1, temp2;
    reg [63:0] output_wire;
    always@(posedge clock)
    begin
      if(enable)
      begin
        R_a <= dataa;
        R_b <= datab;
        temp0 <= R_a[31:0] * R_b[31:0];
        temp1 <= R_a[31:0] * R_b[TMP2_WIDTH-1:32];
        temp2 <= R_a[TMP1_WIDTH-1:32] * R_b[31:0];
        output_wire[63:32] <= temp0[63:32] + temp1 + temp2;
        output_wire[31:0] <= temp0[31:0];
      end
    end
    
    assign result = output_wire[OUTPUT_WIDTH-1:0];  
  end
  else if (LATENCY == 2)
  begin
    // Replacement for LPM_MULT with better QoR - uses a single input register
    if (SIGNED == 0)
    begin
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [O_WIDTH-1:0] output_reg;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT1_WIDTH - 1 : 0]  reg_dataa;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT2_WIDTH - 1 : 0]  reg_datab;
    
      always@(posedge clock)
      begin
        if (enable)
        begin
          output_reg <= reg_dataa * reg_datab; 
          reg_dataa <= dataa;
          reg_datab <= datab;
        end
      end 

      assign result = output_reg[OUTPUT_WIDTH-1:0];
    end
    else
    begin
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [O_WIDTH-1:0] output_reg;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT1_WIDTH - 1 : 0]  reg_dataa;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT2_WIDTH - 1 : 0]  reg_datab;
   
      always@(posedge clock)
      begin
        if (enable)
        begin
          output_reg <= reg_dataa * reg_datab; 
          reg_dataa <= dataa;
          reg_datab <= datab;
        end
      end
      
      assign result = output_reg[OUTPUT_WIDTH-1:0];  
    end    
  end
  else
  begin
    // Similar to above but uses 2 input registers to account for the pipeline register
    if (SIGNED == 0)
    begin
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [O_WIDTH-1:0] output_reg[LATENCY - 3 : 0];
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT1_WIDTH - 1 : 0]  reg_dataa;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT2_WIDTH - 1 : 0]  reg_datab;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT1_WIDTH - 1 : 0]  reg_dataa2;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg [INPUT2_WIDTH - 1 : 0]  reg_datab2;
    
      genvar i;
      for (i = 0; i < LATENCY - 3; i++) begin: postregs
         always @(posedge clock) 
         begin
            if (enable) begin
               output_reg[i + 1] <= output_reg[i];
            end
         end
      end


      always@(posedge clock)
      begin
        if (enable)
        begin
          output_reg[0] <= reg_dataa2 * reg_datab2; 
          reg_dataa <= dataa;
          reg_datab <= datab;
          reg_dataa2 <= reg_dataa;
          reg_datab2 <= reg_datab;
        end
      end 

      assign result = output_reg[LATENCY - 3][OUTPUT_WIDTH-1:0];
    end
    else
    begin
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [O_WIDTH-1:0] output_reg[LATENCY - 3 : 0];
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT1_WIDTH - 1 : 0]  reg_dataa;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT2_WIDTH - 1 : 0]  reg_datab;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT1_WIDTH - 1 : 0]  reg_dataa2;
      (* altera_attribute = "-name auto_shift_register_recognition OFF" *) reg signed [INPUT2_WIDTH - 1 : 0]  reg_datab2;
   
      genvar i;
      for (i = 0; i < LATENCY - 3; i++) begin: postregs
         always @(posedge clock)
         begin
            if (enable) begin
               output_reg[i + 1] <= output_reg[i];
            end
         end
      end
 
      always@(posedge clock)
      begin
        if (enable)
        begin
          output_reg[0] <= reg_dataa2 * reg_datab2; 
          reg_dataa <= dataa;
          reg_datab <= datab;
          reg_dataa2 <= reg_dataa;
          reg_datab2 <= reg_datab;
        end
      end
      
      assign result = output_reg[LATENCY - 3][OUTPUT_WIDTH-1:0];  
    end    
  end
  endgenerate   
  
endmodule
