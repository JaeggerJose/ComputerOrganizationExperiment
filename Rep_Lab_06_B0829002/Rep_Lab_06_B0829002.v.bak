module lab6(input [2:0] s,input cin,input[4:0] A,input[4:0] B, output [4:0] sibG,input clk);
	reg [7:0] tmpA, tmpB, G;
	wire tmpG;
	alu(tmpA, tmpB, s, tmpG, cin)
	sib(G, sibG)
	always @(*) begin
	if(A[4])
		tmpA = {3'b111,A};
	else
		tmpA = {3'b000,A};
	
	if(B[4])
		tmpB = {3'b111,B};
	else
		tmpB = {3'b000,B};
	if(tmpG[4])
		tmpG = ~tmpG+1;
	G = tmpG[4:0];
	end
endmodule 