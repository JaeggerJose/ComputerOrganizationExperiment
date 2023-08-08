module timer(clkin, outsec0, outsec1, outmin0, outmin1,but, but2, mode, stop, but3, but4, speed);
	input clkin, but, but2, but3, but4;
	output reg mode, stop;
	reg [3:0] sec0, sec1, min0, min1;
	output reg [1:0] speed;
	output [6:0] outsec0, outsec1, outmin0, outmin1;
	wire clk, newbut, newbutt, newbut3, newbut4;
	clkdivede(clkin, clk, speed);
	sib(sec0 , outsec0);
	sib(sec1 , outsec1);
	sib(min0 , outmin0);
	sib(min1 , outmin1);
	debounce(clkin,but,newbut);
	debounce(clkin,but2,newbutt);
	debounce(clkin,but3,newbut3);
	debounce(clkin,but4,newbut4);
	
always @(posedge clk) begin
	if(stop) begin
	if(mode) begin
		sec0 <= sec0 + 1;
			if(min1>=5&&min0>=9&&sec1>=5&&sec0>=9) begin
			sec0 <= 0;
			sec1 <= 0;
			min0 <= 0;
			min1 <= 0;
		end else if(min0>=9&&sec1>=5&&sec0>=9) begin
			sec0 <= 0;
			sec1 <= 0;
			min0 <= 0;
			min1 <= min1+1;
		end else if(sec1>=5&&sec0>=9) begin
			sec0 <= 0;
			sec1 <= 0;
			min0 <= min0 +1;
		end else if(sec0>=9) begin
			sec0 <= 0;
			sec1 <= sec1+1;
		end
	end else begin
		sec0 <= sec0 - 1;
		if(min1<=0&&min0<=0&&sec1<=0&&sec0<=0) begin
			sec0 <= 9;
			sec1 <= 5;
			min0 <= 9;
			min1 <= 5;
		end else if(min0<=0&&sec1<=0&&sec0<=0) begin
			sec0 <= 9;
			sec1 <= 5;
			min0 <= 9;
			min1 <= min1-1;
		end else if(sec1<=0&&sec0<=0) begin
			sec0 <= 9;
			sec1 <= 5;
			min0 <= min0 -1;
		end else if(sec0<=0) begin
			sec0 <= 9;
			sec1 <= sec1-1;
		end
	end
	end
	end
 always @(posedge clkin) begin //the clock need to set with the same clock with debounce
 	if(newbutt) begin
		stop <= ~stop;
	end
	if(newbut) begin
		mode <= ~mode;
	end
	if(newbut3) begin
		speed[1]<= ~speed[1];
	end
	if(newbut4) begin
		speed[0]<= ~speed[0];
	end
	if(speed==2'b11) begin
		speed<=2'b00;
	end
end
endmodule 