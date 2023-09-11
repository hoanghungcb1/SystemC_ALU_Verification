module divide (
    input logic [15:0] Q,M,
    output logic [15:0] result, R
);

	logic [15:0] Quo ;
	logic [15:0] Rem ;
	logic [15:0] a1,b1,p1;
	integer i;
	
always@ (Q or M) begin
	a1 = Q;
	b1 = M;
	p1 = 0;
	
	if (a1[15]==1) a1 = 16'b0 - a1;
	if (b1[15]==1) b1 = 16'b0 - b1;
	if ((b1[15]==1)&&(a1[15]==1)) begin
		b1 = 16'b0 - b1;
		a1 = 16'b0 - a1;
	end
	
	for (i=0;i<16;i=i+1) begin
		p1 = {p1[14:0],a1[15]};
		a1[15:1] = a1 [14:0];
		p1 = p1 - b1;
		if (p1[15]==1) begin
			a1[0]=0;
			p1 = p1 + b1;
		end
		else
			a1[0] = 1;
	end
		
		if ((Q[15]==1'b1)&&(M[15]==1'b0))
		begin
		Quo = 16'b0 - a1;
		Rem = 16'b0 - p1;
		end
		
		if ((Q[15]==1'b0)&&(M[15]==1'b1))
		begin
		Quo = 16'b0 - a1;
		Rem = p1;
		end
		
		if ((Q[15]==1'b1)&&(M[15]==1'b1))
		begin
		Quo = a1;
		Rem = 16'b0 - p1;
		end
		
		if ((Q[15]==1'b0)&&(M[15]==1'b0)) 
		begin
		Quo = a1;
		Rem = p1;
		end
		
		result = Quo;
		R = Rem;
end
endmodule
