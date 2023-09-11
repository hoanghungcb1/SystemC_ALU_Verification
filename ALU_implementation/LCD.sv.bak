module LCD (clk,lcd_e,lcd_rs,lcd_on,lcd_blon,data_lcd,data_i,data_i_tp,lcd_rw);
/* verilator lint_off BLKSEQ */
input clk;
input [7:0] data_i [4:0];
input [7:0] data_i_tp [4:0];
output reg lcd_e, lcd_rs,lcd_on,lcd_blon,lcd_rw;
output reg [7:0] data_lcd;
integer i = 0;
integer j = 1;

reg [7:0] Datas [1:31];

always @(posedge clk) begin
lcd_blon = '1;
lcd_on = '1;
lcd_rw = '0;
Datas[1]   =  8'h38;   	//-- control instruction : configure - 2 lines
Datas[2]   =  8'h0C;   	//-- control instruction : Display on, cursor off --
Datas[3]   =  8'h06;   	//-- control instruction : Increment cursor : shift cursor to right --
Datas[4]   =  8'h01;   	//-- control instruction : clear display screen --
Datas[5]   =  8'h80;   	//-- control instruction : force cursor to begin at first line --

Datas[6]   =  8'h53;   	//-- S --
Datas[7]   =  8'h51;   	//-- Q --
Datas[8]   =  8'h52;   	//-- R --
Datas[9]   =  8'h54;   	//-- T --
Datas[10]  =  8'h28;   	//-- ( --
Datas[11]  =  8'h58;   	//-- X --
Datas[12]  =  8'h5E;   	//-- ^ --
Datas[13]  =  8'h32;   	//-- 2 --
Datas[14]  =  8'h2B;		//-- + --
Datas[15]  =  8'h59; 	//-- Y --
Datas[16]  =  8'h5E;		//-- ^ --
Datas[17]  =  8'h32;		//-- 2 --
Datas[18]  =  8'h29;		//-- ) --
Datas[19]  =  8'h3D;   	//-- = --
Datas[20]  =  8'hC2;   	//-- control instruction : force cursor to move to 2nd Line --
Datas[21]  =  data_i[4] + 8'h30;	
Datas[22]  =  data_i[3] + 8'h30;
Datas[23]  =  data_i[2] + 8'h30;
Datas[24]  =  data_i[1] + 8'h30;
Datas[25]  =  data_i[0] + 8'h30;
Datas[26]  =  8'h2E;   	//-- . --
Datas[27]  =  data_i_tp[4] + 8'h30;
Datas[28]  =  data_i_tp[3] + 8'h30;
Datas[29]  =  data_i_tp[2] + 8'h30;
Datas[30]  =  data_i_tp[1] + 8'h30;
Datas[31]  =  data_i_tp[0] + 8'h30;
end		
		
always @(posedge clk) begin

//-- Delay for writing data
	
  if (i <= 1000000) begin
  i = i + 1; lcd_e = 1;
  data_lcd = Datas[j];
  end
  
  else if (i > 1000000 & i < 2000000) begin
  i = i + 1; lcd_e = 0;
  end
  
  else if (i == 2000000) begin
  j = j + 1; i = 0;
  end
  else i = 0;
  
 //-- LCD_RS signal should be set to 0 for writing commands and to 1 for writing data

  if (j <= 5 ) lcd_rs = 0;  
  else if (j > 5 & j < 20) lcd_rs = 1;   
  else if (j == 20) lcd_rs = 0;
  else if (j > 20 & j < 32) lcd_rs = 1;
  else j=5;
  
end
/* verilator lint_on BLKSEQ */
endmodule
