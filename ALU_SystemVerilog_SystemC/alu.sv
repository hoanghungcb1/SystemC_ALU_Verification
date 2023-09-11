module alu(
  input logic [15:0] A,
  input logic [15:0] B,
  input logic [3:0] control,
  output logic [15:0] result,
  output logic [15:0] result_X
);
logic [31:0] mul_result,log_result,sqrt_result;
logic [15:0] divide_result,R;
	
multi multi0 (
	.M_i (A ),
	.N_i (B ),
	.P (mul_result )
);

divide divide0 (
	.Q (A ),
	.M (B ),
	.result (divide_result ),
	.R (R )
);
	
log_e log_e0 (
	.data (A ),
	.result (log_result )
);

sqrt sqrt (
	.data_i (A ),
	.result_o (sqrt_result )
);

  always_comb begin
  result = 16'hxxxx;
  result_X = 16'hxxxx;
    case(control)
	4'b0000: begin
		result = A + B; // Addition
		result_X = '0;
		end
	4'b0001: begin
		result = A - B; // Subtraction
		result_X = '0;
		end
	4'b0010: begin
		result = A & B; // Bitwise AND
		result_X = '0;
		end
	4'b0011: begin
		result = (~A); // Bitwise NOT
		result_X = '0;
		end
	4'b0100: begin
		result = A | B; // Bitwise OR
		result_X = '0;
		end
	4'b0101: begin
		result = A ^ B; // Bitwise XOR
		result_X = '0;
		end
	4'b0110: begin
		result = A << B[3:0]; // Shift left
		result_X = '0;
		end
	4'b0111: begin
		result = A >> B[3:0]; // Shift right
		result_X = '0;
		end
	4'b1000: begin
		result = mul_result[15:0];
		result_X = mul_result[31:16];
		end
	4'b1001: begin
		result = divide_result;
		result_X = R;
		end
	4'b1010: begin
		result = log_result[31:16];
		result_X = log_result[15:0];
		end
	4'b1011: begin
		result = sqrt_result[20:5];
		result_X = sqrt_result[4:0];
		end
	default: result = A + B;
    endcase
end
endmodule

