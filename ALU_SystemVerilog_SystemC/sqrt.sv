module sqrt(
	input logic [15:0] data_i,
	output logic [31:0] result_o
);
	
	integer i;
	logic [45:0] Y;
	logic [21:0] P, X_i;
	always_comb begin
		P = 22'd0;
		X_i = data_i << 10;
		for(i = 21; i >= 0; i--) begin
			Y = (P << (i + 1)) + (22'd1 << (i + i));
			if(Y <= X_i) begin
				P[i] = 1;
				X_i = X_i - Y;
			end
			else P[i] = 0;
		end
	result_o = P ;
	end
endmodule
