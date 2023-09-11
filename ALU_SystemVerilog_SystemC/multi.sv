module multi (
	input logic [15:0] M_i, N_i,
	output logic [31:0] P
);
	logic [16:0] N;
	logic [31:0] M, M0, M2, M4, M6, M8, M10, M12, M14;
	always_comb begin
		N = {N_i, 1'b0};
		if(M_i[15]) begin
			M = {16'b1111111111111111, M_i};
		end
		else begin
			M = {16'b0000000000000000, M_i};
		end

		case(N[2:0])
			3'b010: M0 = M;
			3'b100: M0 = (~M + 1) * 2;
			3'b110: M0 = ~M + 1;
			default: M0 = '0;
		endcase
		case(N[4:2])
			3'b000, 3'b111: M2 = '0;
			3'b001, 3'b010: M2 = M << 2;
			3'b011: M2 = (M << 2) * 2;
			3'b100: M2 = (~(M << 2) + 1) * 2;
			3'b101, 3'b110: M2 = (~(M << 2) + 1);
		endcase
		case(N[6:4])
			3'b000, 3'b111: M4 = '0;
			3'b001, 3'b010: M4 = M << 4;
			3'b011: M4 = (M << 4) * 2;
			3'b100: M4 = (~(M << 4) + 1) * 2;
			3'b101, 3'b110: M4 = (~(M << 4) + 1);
		endcase
		case(N[8:6])
			3'b000, 3'b111: M6 = '0;
			3'b001, 3'b010: M6 = M << 6;
			3'b011: M6 = (M << 6) * 2;
			3'b100: M6 = (~(M << 6) + 1) * 2;
			3'b101, 3'b110: M6 = (~(M << 6) + 1);
		endcase
		case(N[10:8])
			3'b000, 3'b111: M8 = '0;
			3'b001, 3'b010: M8 = M << 8;
			3'b011: M8 = (M << 8) * 2;
			3'b100: M8 = (~(M << 8) + 1) * 2;
			3'b101, 3'b110: M8 = (~(M << 8) + 1);
		endcase
		case(N[12:10])
			3'b000, 3'b111: M10 = '0;
			3'b001, 3'b010: M10 = M << 10;
			3'b011: M10 = (M << 10) * 2;
			3'b100: M10 = (~(M << 10) + 1) * 2;
			3'b101, 3'b110: M10 = (~(M << 10) + 1);
		endcase
		case(N[14:12])
			3'b000, 3'b111: M12 = '0;
			3'b001, 3'b010: M12 = M << 12;
			3'b011: M12 = (M << 12) * 2;
			3'b100: M12 = (~(M << 12) + 1) * 2;
			3'b101, 3'b110: M12 = (~(M << 12) + 1);
		endcase
		case(N[16:14])
			3'b000, 3'b111: M14 = '0;
			3'b001, 3'b010: M14 = M << 14;
			3'b011: M14 = (M << 14) * 2;
			3'b100: M14 = (~(M << 14) + 1) * 2;
			3'b101, 3'b110: M14 = (~(M << 14) + 1);
		endcase
		P = M0 + M2 + M4 + M6 + M8 + M10 + M12 + M14;
	end
endmodule