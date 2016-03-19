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
    


module acl_mem_staging_reg #(
  parameter WIDTH       = 32,
  parameter LOW_LATENCY =  0 //used by mem1x when the latency through the memory is only 1 cycle
)
(
    input wire clk,
    input wire resetn,
    input wire enable,
    input wire [WIDTH-1:0] rdata_in,
    output logic [WIDTH-1:0] rdata_out
);

    generate
        if (LOW_LATENCY) begin
            reg [WIDTH-1:0] rdata_r;
            reg enable_r;

            always @(posedge clk or negedge resetn) begin
               if (!resetn) begin
                  enable_r <= 1'b1;
               end else begin
                  enable_r <= enable;

                  if (enable_r) begin
                      rdata_r <= rdata_in;
                  end
               end
            end

            assign rdata_out = enable_r ? rdata_in : rdata_r;

        end else begin

            reg [WIDTH-1:0] rdata_r[0:1];
            reg [1:0] rdata_vld_r;
            reg enable_r;

            always @(posedge clk or negedge resetn) begin
               if (!resetn) begin
                  rdata_vld_r <= 2'b00;
                  enable_r <= 1'b0;
               end else begin
                  if (~rdata_vld_r[1] | enable) begin
                      enable_r <= enable;
                      rdata_vld_r[0] <= ~enable | (~rdata_vld_r[1] & ~enable_r & enable); //use the first staging register if disabled, or re-enabled after only one cycle
                      rdata_vld_r[1] <= rdata_vld_r[0] & (rdata_vld_r[1] | ~enable);
                      rdata_r[1] <= rdata_r[0];
                      rdata_r[0] <= rdata_in;
                  end
               end
            end

            always @(*) begin
                case (rdata_vld_r)
                    2'b00: rdata_out = rdata_in;
                    2'b01: rdata_out = rdata_r[0];
                    2'b10: rdata_out = rdata_r[1];
                    2'b11: rdata_out = rdata_r[1];
                    default: rdata_out = {WIDTH{1'bx}};
                endcase
            end

        end

    endgenerate

endmodule

// vim:set filetype=verilog:
