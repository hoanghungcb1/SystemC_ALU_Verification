module design_alu (
	input  logic [15:0] data_i,
	input  logic clk_i,data_clk_A,data_clk_B,data_clk_C,rstn,
	output logic lcd_e, lcd_rs,lcd_on,lcd_blon,lcd_rw,
	output logic [7:0] data_lcd
	
);
	logic [7:0] A_lcd [4:0];
	logic [7:0] B_lcd [4:0];
	logic [7:0] result_lcd [4:0];
	logic [7:0] result_X_lcd[4:0];
	logic [15:0] result,result_X;
	logic [15:0] A,B;
	logic [3:0] C;
	logic [7:0] sign_A,sign_B,sign_result,sign_result_X;

	always_ff @(negedge data_clk_A or negedge rstn or negedge data_clk_B or negedge data_clk_C) begin
	if (!data_clk_A) A <= data_i;
	if (!data_clk_B) B <= data_i;
	if (!data_clk_C) C <= data_i [3:0];
	if (!rstn) begin
	A <= 0;
	B <= 0;
	C <= 0;
	end 
	end 
	
	alu alu0 (
		.A (A),
		.B (B),
		.control (C),
		.result(result),
		.result_X(result_X)
	);

	
	bin2dec bin2dec0 (
		.bin_i(A),
		.dec_o(A_lcd),
		.sign(sign_A)
	);

	bin2dec bin2dec1 (
		.bin_i(B),
		.dec_o(B_lcd),
		.sign(sign_B)
	);
	
	bin2dec bin2dec2 (
		.bin_i(result),
		.dec_o(result_lcd),
		.sign(sign_result)
	);
	
	bin2dec bin2dec3 (
		.bin_i(result_X),
		.dec_o(result_X_lcd),
		.sign(sign_result_X)
	);

	LCD LCD (
		.clk(clk_i),
		.lcd_e(lcd_e),
		.lcd_rs(lcd_rs),
		.lcd_on(lcd_on),
		.lcd_blon(lcd_blon),
		.lcd_rw(lcd_rw),
		.data_lcd(data_lcd),
		.data_i0(A_lcd),
		.data_i1(B_lcd),
		.data_i2(result_lcd),
		.data_i3(result_X_lcd),
		.sign0(sign_A),
		.sign1(sign_B),
		.sign2(sign_result),
		.sign3(sign_result_X)
	);
endmodule
