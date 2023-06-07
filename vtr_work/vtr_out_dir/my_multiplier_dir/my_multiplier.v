`define DWIDTH 36


module my_multiplier_top(a, b, clk, reset, out_0_col, out_1_col, out_2_col);

input clk, reset;
input [36-1:0] a, b;
output [72-1:0] out_0_col, out_1_col, out_2_col;


wire [72-1:0] out_00_in_10;
wire [72-1:0] out_10_in_20;
wire [72-1:0] out_20_in_30;
wire [72-1:0] out_30_in_40;
wire [72-1:0] out_40_in_50;
wire [72-1:0] out_50_in_60;

wire [72-1:0] out_01_in_11;
wire [72-1:0] out_11_in_21;
wire [72-1:0] out_21_in_31;
wire [72-1:0] out_31_in_41;
wire [72-1:0] out_41_in_51;
wire [72-1:0] out_51_in_61;

wire [72-1:0] out_02_in_12;
wire [72-1:0] out_12_in_22;
wire [72-1:0] out_22_in_32;
wire [72-1:0] out_32_in_42;
wire [72-1:0] out_42_in_52;
wire [72-1:0] out_52_in_62;

wire [72-1:0] C_mult_wire;
reg [72-1:0] C_mult_reg;

always @(posedge clk)
begin
	if (reset) begin
		C_mult_reg <= 0;
	end
	else begin
		C_mult_reg <= C_mult_wire;
	end
end

my_multiplier_module mult_inst(.A(a), .B(b), .C(C_mult_wire));


wire [20-1:0] bram00_0_out1, bram00_1_out1, bram00_0_out2, bram00_1_out2;
reg [10-1:0] bram00_0_addr1, bram00_0_addr2, bram00_1_addr1, bram00_1_addr2;
reg bram00_0_we1, bram00_0_we2, bram00_1_we1, bram00_1_we2;
reg [20-1:0] bram00_0_data1, bram00_0_data2, bram00_1_data1, bram00_1_data2;


dual_port_ram bram00_0(.addr1(bram00_0_addr1), .we1(bram00_0_we1), .data1(bram00_0_data1), .out1(bram00_0_out1),
                              .addr2(bram00_0_addr2), .we2(bram00_0_we2), .data2(bram00_0_data2), .out2(bram00_0_out2), .clk(clk));

dual_port_ram bram00_1(.addr1(bram00_0_addr1), .we1(bram00_0_we1), .data1(bram00_0_data1), .out1(bram00_1_out1),
                              .addr2(bram00_0_addr2), .we2(bram00_0_we2), .data2(bram00_0_data2), .out2(bram00_1_out2), .clk(clk));


wire [36-1:0] a00_data_in, b00_data_in;
assign a00_data_in = {bram00_0_out1[16-1:0], bram00_0_out1};
assign b00_data_in = {bram00_0_out2[16-1:0], bram00_0_out2};



hard_model u_hard_model_00 (.clk(clk), .reset(reset), .a(bram00_0_out1), .b(bram00_0_out2), .out(out_00_in_10));

hard_model u_hard_model_10 (.clk(clk), .reset(reset), .a(out_00_in_10[35:0]), .b(out_00_in_10[72:36]), .out(out_10_in_20));

hard_model u_hard_model_20 (.clk(clk), .reset(reset), .a(out_10_in_20[35:0]), .b(out_10_in_20[72:36]), .out(out_20_in_30));

hard_model u_hard_model_30 (.clk(clk), .reset(reset), .a(out_20_in_30[35:0]), .b(out_20_in_30[72:36]), .out(out_30_in_40));

hard_model u_hard_model_40 (.clk(clk), .reset(reset), .a(out_30_in_40[35:0]), .b(out_30_in_40[72:36]), .out(out_40_in_50));

hard_model u_hard_model_50 (.clk(clk), .reset(reset), .a(out_40_in_50[35:0]), .b(out_40_in_50[72:36]), .out(out_50_in_60));

hard_model u_hard_model_60 (.clk(clk), .reset(reset), .a(out_50_in_60[35:0]), .b(out_50_in_60[72:36]), .out(out_0_col));




hard_model u_hard_model_01 (.clk(clk), .reset(reset), .a(bram00_1_out1), .b(bram00_1_out2), .out(out_01_in_11));

hard_model u_hard_model_11 (.clk(clk), .reset(reset), .a(out_01_in_11[35:0]), .b(out_01_in_11[72:36]), .out(out_11_in_21));

hard_model u_hard_model_21 (.clk(clk), .reset(reset), .a(out_11_in_21[35:0]), .b(out_11_in_21[72:36]), .out(out_21_in_31));

hard_model u_hard_model_31 (.clk(clk), .reset(reset), .a(out_21_in_31[35:0]), .b(out_21_in_31[72:36]), .out(out_31_in_41));

hard_model u_hard_model_41 (.clk(clk), .reset(reset), .a(out_31_in_41[35:0]), .b(out_31_in_41[72:36]), .out(out_41_in_51));

hard_model u_hard_model_51 (.clk(clk), .reset(reset), .a(out_41_in_51[35:0]), .b(out_41_in_51[72:36]), .out(out_51_in_61));

hard_model u_hard_model_61 (.clk(clk), .reset(reset), .a(out_51_in_61[35:0]), .b(out_51_in_61[72:36]), .out(out_1_col));



hard_model u_hard_model_02 (.clk(clk), .reset(reset), .a(C_mult_reg[35:0]), .b(C_mult_reg[72:36]), .out(out_02_in_12));

hard_model u_hard_model_12 (.clk(clk), .reset(reset), .a(out_02_in_12[35:0]), .b(out_02_in_12[72:36]), .out(out_12_in_22));

hard_model u_hard_model_22 (.clk(clk), .reset(reset), .a(out_12_in_22[35:0]), .b(out_12_in_22[72:36]), .out(out_22_in_32));

hard_model u_hard_model_32 (.clk(clk), .reset(reset), .a(out_22_in_32[35:0]), .b(out_22_in_32[72:36]), .out(out_32_in_42));

hard_model u_hard_model_42 (.clk(clk), .reset(reset), .a(out_32_in_42[35:0]), .b(out_32_in_42[72:36]), .out(out_42_in_52));

hard_model u_hard_model_52 (.clk(clk), .reset(reset), .a(out_42_in_52[35:0]), .b(out_42_in_52[72:36]), .out(out_52_in_62));

hard_model u_hard_model_62 (.clk(clk), .reset(reset), .a(out_52_in_62[35:0]), .b(out_52_in_62[72:36]), .out(out_2_col));


endmodule




module my_multiplier_module(A, B, C);

input [`DWIDTH-1:0] A, B;
output [2*`DWIDTH-1:0] C;

assign C = A + B;

endmodule
