module clkdivede(clkin ,clk, speed);
	input clkin;
	input [1:0] speed;
	output reg clk;
	reg [25:0] counter;
always @(posedge clkin) begin
	counter <= counter+1;
	case(speed)
	2'b00: begin
	if(counter > 26'd5000000-26'd1) begin 
		counter <= 0;
		clk <= ~clk;
	end
	end
	2'b01: begin
	if(counter > 26'd10000000-26'd1) begin 
		counter <= 0;
		clk <= ~clk;
	end
	end
	2'b10: begin
	if(counter > 26'd2500000-26'd1) begin 
		counter <= 0;
		clk <= ~clk;
	end
	end
	2'b11: begin
	if(counter > 26'd5000000-26'd1) begin 
		counter <= 0;
		clk <= ~clk;
	end
	end
	endcase
end
endmodule	