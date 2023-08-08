module minussib(in, out);
	input in;
	output reg [6:0] out;
	
always @(*) begin
	case(in)
		0:out=7'b1111111;
		default:out=7'b0111111;
	endcase
end
endmodule 