module registerfile(Load, DS, clk,Ddata, SA, SB, Adata, Bdata,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);
	input [7:0] Ddata;
	input [2:0] SA, SB, DS;
	input Load, clk;
	reg [7:0] R0;
	reg [7:0] R1;
	reg [7:0] R2;
	reg [7:0] R3;
	reg [7:0] R4;
	reg [7:0] R5;
	reg [7:0] R6;
	reg [7:0] R7;
	reg LE0,LE1,LE2,LE3,LE4,LE5,LE6,LE7;
	reg LD0,LD1,LD2,LD3,LD4,LD5,LD6,LD7;
	output reg [7:0] Adata, Bdata;
	output reg [7:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7; 

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
	outR0 = R0;
	outR1 = R1;
	outR2 = R2;
	outR3 = R3;
	outR4 = R4;
	outR5 = R5;
	outR6 = R6;
	outR7 = R7;
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