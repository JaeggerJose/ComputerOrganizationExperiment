module Absolute2(A, B, CLK, out);
	input [3:0] A, B;
	input CLK;
	reg [3:0] store;
	reg [1:0] state;
	output reg [3:0] out;

always @(posedge CLK) begin
	case(state)
		2'b00: state<=2'b01;
		2'b01: begin store<=(A-B); state<=2'b10; end
		2'b10: begin
			if(store[3]) begin 
				store<=(B-A);
			end
			state<=2'b11;
		end
		2'b11: begin out<=store; state<=2'b00; end
	endcase
end
endmodule
				