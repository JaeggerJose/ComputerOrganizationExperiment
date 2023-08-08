module funtion_unit(A,B,FS,V,C,N,Z,F,sol);
	input [7:0] A,B;
	reg MF;
	input [3:0]FS;
	output reg [7:0] F;
	output reg V,N,Z;
	output C;
	wire [7:0] G,H;
	output [8:0] sol;
	alu auu(A,B,FS[3:1],G,FS[0],C,sol);
	shifter stt(B,H,FS[1:0]);
always @(*) begin
   MF = FS[3]&FS[2];
	N = G[7];
	Z = G==0;
	V = C^N;
	case(MF)
		1'b0: F=G;
		default: F=H;
	endcase
end
endmodule 