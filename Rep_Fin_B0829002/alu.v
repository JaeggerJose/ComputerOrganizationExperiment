 module alu(input [7:0] A, input [7:0] B, input [2:0] s,output reg [7:0] G, input cin, output reg cout,output reg [8:0] sol);
	wire [3:0] ALU_Sel;
	assign ALU_Sel = {s,cin};
	reg [7:0] tmp;
always @(*) begin
	G = 8'b0000000;
	sol = 9'b000000000;
	cout = 0;
	tmp = 0;
	if(ALU_Sel[3]) begin
		case(ALU_Sel[1:0])
			2'b00: G = A & B;
			2'b01: G = A | B;
			2'b10: G = A ^ B;
			2'b11: G = ~A;
			default:  G = 8'b00000000;
		endcase
	end else begin
		case(ALU_Sel[2:1])
			2'b00: tmp = 8'b00000000;
			2'b01: tmp = B;
			2'b10: tmp = ~B;
			2'b11: tmp = 8'b11111111;
			default: tmp = 8'b00000000;
		endcase
		sol = A + cin + tmp;
		cout = sol[8];
		G = sol[7:0];
	end
end
endmodule
	