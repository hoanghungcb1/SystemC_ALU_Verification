module TOP(
  input logic clk,
  input logic [15:0] A,
  input logic [15:0] B,
  input logic [3:0] control,
  output logic [15:0] result,
  output logic [15:0] result_X
);

alu dut(
	.A(A),
	.B(B),
	.control(control),
	.result(result),
	.result_X(result_X)
);

always @(negedge clk) begin : proc_assertions
	if (control == 3'b000)
		assert (result == (A + B));
	if (control == 3'b001)
		assert (result == (A - B));
	if (control == 3'b010)
		assert (result == (A & B));
	if (control == 3'b011)
		assert (result == ( ~A));
	if (control == 3'b100)
		assert (result == (A | B));
	if (control == 3'b101)
		assert (result == (A ^ B));
	if (control == 3'b110)
		assert (result == (A << B[3:0]));
	if (control == 3'b111)
		assert (result == (A >> B[3:0]));
end

endmodule
