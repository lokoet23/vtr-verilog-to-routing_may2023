`define DWIDTH 36


module my_multiplier_top(a, b, out, clk, reset);

input clk, reset;
input [36-1:0] a, b;
output [72-1:0] out;

wire [72-1:0] out_00_in_01;
wire [72-1:0] out_01_in_02;
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

hard_model u_hard_model_00 (.a(C_mult_reg[35:0]), .b(C_mult_reg[71:36]), .clk(clk), .out(out_00_in_01));

hard_model u_hard_model_01 (.a(out_00_in_01[35:0]), .b(out_00_in_01[71:36]), .clk(clk), .out(out_01_in_02));

hard_model u_hard_model_02 (.a(out_01_in_02[35:0]), .b(out_01_in_02[71:36]), .clk(clk), .out(out));

// assign out = C_mult_reg;

endmodule




module my_multiplier_module(A, B, C);

input [`DWIDTH-1:0] A, B;
output [2*`DWIDTH-1:0] C;

assign C = A * B;

endmodule
