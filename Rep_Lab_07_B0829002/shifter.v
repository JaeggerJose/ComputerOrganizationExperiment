module shifter(B,H,HS);
	input [7:0] B;
	input [1:0] HS;
	reg IR = 0;
	reg IL = 0;
	output reg [7:0] H;
always @(*) begin
	case(HS)
		2'b00: H = B;
		2'b01: H = {IR,B[7:1]};
		2'b10: H = {B[6:0],IL};
		default H = 0;
	endcase
end
endmodule 