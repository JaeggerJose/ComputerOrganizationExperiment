module minussib(in, out);
	input in;
	output reg [6:0] out;
	
always @(*) begin
	case(in)
		4'b0000:out=7'b1111111;
		4'b0001:out=7'b0111111;
		default:out=7'b1111111;
	endcase
end
endmodule 