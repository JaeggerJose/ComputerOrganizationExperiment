module registerfile(Load, DS, clk,Ddata, SA, SB, Adata, Bdata);
	input [7:0] Ddata;
	input [2:0] SA, SB, DS;
	input Load, clk;
	reg [7:0] R0,R1,R2,R3,R4,R5,R6,R7;
	output reg [7:0] Adata, Bdata;

always @(posedge clk) begin
	if (Load) begin
		case(DS)
			3'b000: R0 <= Ddata;
			3'b001: R1 <= Ddata;
			3'b010: R2 <= Ddata;
			3'b011: R3 <= Ddata;
			3'b100: R4 <= Ddata;
			3'b101: R5 <= Ddata;
			3'b110: R6 <= Ddata;
			3'b111: R7 <= Ddata;
		endcase
	end
end

always @(*) begin	
	
	case(SA)
		3'b000: Adata[7:0]=R0[7:0];
		3'b001: Adata[7:0]=R1[7:0];
		3'b010: Adata[7:0]=R2[7:0];
		3'b011: Adata[7:0]=R3[7:0];
		3'b100: Adata[7:0]=R4[7:0];
		3'b101: Adata[7:0]=R5[7:0];
		3'b110: Adata[7:0]=R6[7:0];
		3'b111: Adata[7:0]=R7[7:0];
		default: Adata=0;
	endcase

	case(SB)
		3'b000: Bdata[7:0]=R0[7:0];
		3'b001: Bdata[7:0]=R1[7:0];
		3'b010: Bdata[7:0]=R2[7:0];
		3'b011: Bdata[7:0]=R3[7:0];
		3'b100: Bdata[7:0]=R4[7:0];
		3'b101: Bdata[7:0]=R5[7:0];
		3'b110: Bdata[7:0]=R6[7:0];
		3'b111: Bdata[7:0]=R7[7:0];
		default: Bdata=0;
	endcase
		
end
endmodule 