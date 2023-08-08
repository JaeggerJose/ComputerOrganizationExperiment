module perlab3(clk_50M, LED, button_in, clk_1_2);
	input clk_50M, button_in;
	output reg LED, clk_1_2;
	wire button_out;
	reg [1:0] state;
	reg [25:0] counter;
	debounce(clk_50M, button_in, button_out);

always @(posedge clk_50M) begin
	if(button_out) begin
		case(state)
			2'b00: state<=2'b01;
			2'b01: state<=2'b10;
			2'b10: state<=2'b00;
			default state<=2'b00;
		endcase
	end
end

always @(posedge clk_50M) begin
	counter <= counter+1;
	if(counter > 26'd50000000-26'd1) begin 
		counter <= 0;
		clk_1_2 <= ~clk_1_2;
	end
end
	
always @(*) begin
	case(state)
		2'b00: LED<=0;
		2'b01: LED<=1;
		2'b10: LED<=clk_1_2;
		default: LED<=0;
	endcase
end 
endmodule 