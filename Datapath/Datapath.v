module Absolute(Ain, Bin, CLK, Output);
	input [3:0] Ain, Bin;
	reg [1:0] step;
	input CLK;
	output reg [3:0] Output;

always @(posedge CLK) begin
	case(step)
		2'b00: step<=2'b01;
		2'b01: begin 
			if(Ain>Bin) begin 
				step<=2'b10;
			end
			else begin 
				step<=2'b11;
			end
		end 
		2'b10: begin
			Output<=(Ain+(~Bin)+1);
			step<=2'b00;
		end
		2'b11: begin 
			Output<=((~Ain)+Bin+1); 
			step<=2'b00;
		end
	endcase
end
endmodule 
		