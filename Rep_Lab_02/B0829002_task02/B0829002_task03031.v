module task0302( swi,led);
	input [2:0]  swi;
	output [7:0] led;
	reg [7:0] led;

 always @(*)begin
		 led=8'd0;
		 case (swi)
			  3'b000: led[0]=1'b1;
			  3'b001: led[1]=1'b1;
			  3'b010: led[2]=1'b1;
			  3'b011: led[3]=1'b1;
			  3'b100: led[4]=1'b1;
			  3'b101: led[5]=1'b1;
			  3'b110: led[6]=1'b1;
			  3'b111: led[7]=1'b1;
			  default: led=8'd0;
		 endcase
	end
endmodule