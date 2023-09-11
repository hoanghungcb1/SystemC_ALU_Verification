module log_e (
    input logic [15:0] data,
    output logic [31:0] result
);
logic [31:0] y;
logic [15:0] x,t;

always_comb begin
//stage 1
	 x=data;
	 y=32'ha65af;
  if(x<16'h0080) begin
  x= x<< 8;              
  y = y - 32'h58b91; end
  if(x<16'h0800) begin
  x= x<< 4;              
  y = y - 32'h2c5c8; end
  if(x<16'h2000) begin 
  x= x<< 2;
  y = y - 32'h162e4; end
  if(x<16'h4000) begin 
  x= x<< 1;
  y = y - 32'h0b172; end
// stage 2
  t=x+(x>>1); 
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h067cd; end
  t=x+(x>>2); 
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h03920; end
  t=x+(x>>3); 
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h00f85; end
  t=x+(x>>4); 
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h01e27; end
  t=x+(x>>5);
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h007e1; end
  t=x+(x>>6); 
  if((t&16'h8000)==0) begin 
  x=t;
  y = y - 32'h003f8; end
  t=x+(x>>7); 
  if((t&16'h8000)==0) begin
  x=t;
  y = y - 32'h001fe; end

if (data == '0) y = '0;
result = y;

end
endmodule
