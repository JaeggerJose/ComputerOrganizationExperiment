module lab6(input [2:0] s,input cin,input[4:0] A,input[4:0] B, output [6:0] sibG,input clk, output reg [3:0] G, output reg M , output [6:0] sibM, output [6:0] sibcout);
	reg [7:0] tmpA, tmpB, tmpG;
	reg [3:0] tmpcout;
	wire [7:0] wire_G;
	reg cout;
	alu ab(tmpA, tmpB, s, wire_G, cin, cout);
	sib cd(G, sibG);
	minussib mi(M, sibM);
	sib aj(tmpcout, sibcout);
always @(*) begin
	//pre
	tmpA = {A[4],A[4],A[4],A};
	tmpB = {B[4],B[4],B[4],B};
	tmpcout = {3'b000,cout};
	//nach	
	tmpG = wire_G;
	M = 1'b0;
	if(wire_G[4]) begin
		tmpG = (~wire_G)+1;
		M = 1'b1;
	end
	G = tmpG[3:0];
end
endmodule 