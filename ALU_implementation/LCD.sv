module LCD (clk,lcd_e,lcd_rs,lcd_on,lcd_blon,data_lcd,data_i0,data_i1,data_i2,data_i3,sign0,sign1,sign2,sign3,lcd_rw);
/* verilator lint_off BLKSEQ */
input clk;
input [7:0] data_i0 [4:0];
input [7:0] data_i1 [4:0];
input [7:0] data_i2 [4:0];
input [7:0] data_i3 [4:0];
input [7:0] sign0,sign1,sign2,sign3;
output reg lcd_e, lcd_rs,lcd_on,lcd_blon,lcd_rw;
output reg [7:0] data_lcd;
integer i = 0;
integer j = 1;

reg [7:0] Datas [1:36];

always @(posedge clk) begin
lcd_blon = '1;
lcd_on = '1;
lcd_rw = '0;
Datas[1]   =  8'h38;   	//-- control instruction : configure - 2 lines
Datas[2]   =  8'h0C;   	//-- control instruction : Display on, cursor off --
Datas[3]   =  8'h06;   	//-- control instruction : Increment cursor : shift cursor to right --
Datas[4]   =  8'h01;   	//-- control instruction : clear display screen --
Datas[5]   =  8'h80;   	//-- control instruction : force cursor to begin at first line --
Datas[6]   =  8'h41;   	//-- A --
Datas[7]   =  8'h3D;   	//-- = --
Datas[8]   =  sign0 + 8'h20;	
Datas[9]   =  data_i0[4] + 8'h30;	
Datas[10]  =  data_i0[3] + 8'h30;
Datas[11]  =  data_i0[2] + 8'h30;
Datas[12]  =  data_i0[1] + 8'h30;
Datas[13]  =  data_i0[0] + 8'h30;
Datas[14]  =  8'h3B;   	//-- ; --
Datas[15]  =  sign2 + 8'h20;	
Datas[16]  =  data_i2[4] + 8'h30;	
Datas[17]  =  data_i2[3] + 8'h30;
Datas[18]  =  data_i2[2] + 8'h30;
Datas[19]  =  data_i2[1] + 8'h30;
Datas[20]  =  data_i2[0] + 8'h30;
Datas[21]  =  8'hC0;   	//-- control instruction : force cursor to move to 2nd Line --
Datas[22]  =  8'h42;   	//-- B --
Datas[23]  =  8'h3D;   	//-- = --
Datas[24]  =  sign1 + 8'h20;	
Datas[25]  =  data_i1[4] + 8'h30;	
Datas[26]  =  data_i1[3] + 8'h30;
Datas[27]  =  data_i1[2] + 8'h30;
Datas[28]  =  data_i1[1] + 8'h30;
Datas[29]  =  data_i1[0] + 8'h30;
Datas[30]  =  8'h3B;   	//-- ; --
Datas[31]  =  sign3 + 8'h20;	
Datas[32]  =  data_i3[4] + 8'h30;	
Datas[33]  =  data_i3[3] + 8'h30;
Datas[34]  =  data_i3[2] + 8'h30;
Datas[35]  =  data_i3[1] + 8'h30;
Datas[36]  =  data_i3[0] + 8'h30;
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
  else if (j > 5 & j < 21) lcd_rs = 1;   
  else if (j == 21) lcd_rs = 0;
  else if (j > 21 & j < 37) lcd_rs = 1;
  else j=5;
  
end
/* verilator lint_on BLKSEQ */
endmodule
