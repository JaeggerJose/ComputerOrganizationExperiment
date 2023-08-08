module test(clk,TA,but,sibTA,neg,Dataout,status);
	reg [7:0] Cosin = 0;
	reg [7:0] Datain = 0;
	reg [3:0] FS;
	wire but_new;
	reg MD,MB,LD;
	reg [2:0] DS,AA,BA;
	reg [7:0] tmpTA, negaitvetmpTA;
	wire [7:0] Addout;
	output reg [2:0] status;
	output [7:0] Dataout;
	output [6:0] sibTA,neg;
	input clk,but;
	input [4:0] TA;
	Rep_Lab_07  rr7(Cosin,Datain,FS,MD,MB,LD,DS,clk,AA,BA,Addout,Dataout);
	sib  sib1(negaitvetmpTA[4:0], sibTA);
	debounce  db(clk, but, but_new);
	minussib minussb(Dataout[7], neg);
	
	
always@(*) begin
	tmpTA <= {TA[4],TA[4],TA[4],TA};
	if(Dataout[7]) 
		negaitvetmpTA = (~Dataout)+1;
	else
		negaitvetmpTA = Dataout;
end
	
always @(posedge clk) begin
	if(status>=3'b100)
		status <=3'b000;
	if(but_new)
		status <= status+1;
		
	case(status)
		3'b000: begin 
		Cosin <= 0;
		Datain <= 0;
		FS <= 4'b0010;
		MD <= 1'b0;
		MB <= 1'b0;
		LD <= 1'b0;
		DS <= 3'b011;
		AA <= 3'b001;
		BA <= 3'b011;
		end
	
		3'b001: begin 
		Cosin <= 0;
		Datain <= tmpTA;
		FS <= 4'bxxxx;
		MD <= 1'b1;
		MB <= 1'b0;
		LD <= 1'b1;
		DS <= 3'b001;
		AA <= 3'bxxx;
		BA <= 3'b001;
		end
		
		3'b010: begin 
		Cosin <= 0;
		Datain <= tmpTA;
		FS <= 4'bxxxx;
		MD <= 1'b1;
		MB <= 1'b0;
		LD <= 1'b1;
		DS <= 3'b100;
		AA <= 3'bxxx;
		BA <= 3'b001;
		end
		
		3'b011: begin 
		Cosin <= 0;
		Datain <= 0;
		FS <= 4'b0010;
		MD <= 1'b0;
		MB <= 1'b0;
		LD <= 1'b1;
		DS <= 3'b011;
		AA <= 3'b001;
		BA <= 3'b100;
		end

		endcase
end 

endmodule 