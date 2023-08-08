module prelab4(RLswi, clk_50M, swi, button_in, LED, button_in2,button_in3,out1, out2);
	input [7:0] swi;
	input button_in, clk_50M, button_in2, RLswi, button_in3;
	output reg [7:0] LED;
	output [6:0] out1, out2;
	reg [3:0] step1, step2;
	wire button_out;
	debounce(clk_50M, button_in, button_out);
	debounce(clk_50M, button_in2, button_out2);
	debounce(clk_50M, button_in3, button_out3);
	sib(LED[3:0], out1);
	sib(LED[7:4], out2);
	
always @(posedge clk_50M) begin
	//basic
	if(button_out) begin
		LED[0] <= swi[0];
		LED[1] <= swi[1];
		LED[2] <= swi[2];
		LED[3] <= swi[3];
		LED[4] <= swi[4];
		LED[5] <= swi[5];
		LED[6] <= swi[6];
		LED[7] <= swi[7];
	end
	//bounce 1
	if(button_out2) begin
		case(RLswi)
			1'b0: LED<={LED[0],LED[7:1]};
			1'b1: LED<={LED[6:0],LED[7]};
		endcase
	end
	if(button_out3) begin
		LED <= swi + LED; //bounce 2
	end
end
endmodule 
