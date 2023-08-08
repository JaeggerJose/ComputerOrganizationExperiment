module Rep_Lab_07(Cosin,Datain,FS,MD,MB,LD,DS,clk,AA,BA,Addout,Dataout,V,C,N,Z,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,sol);
	input [7:0] Cosin, Datain;
	input [3:0] FS;
	input [2:0] DS,AA,BA;
	wire [7:0] Adata,Bdata,F;
	output V,C,N,Z;
	reg [7:0] BusB = 0;
	reg [7:0] BusD = 0;
	reg MF;
	output reg [7:0] Addout,Dataout;
	output [8:0] sol;
	output [7:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	input MD,MB,LD,clk;
	registerfile  rff(LD,DS,clk,BusD,AA,BA,Adata,Bdata,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);
	funtion_unit  fuu(Adata,BusB,FS,V,C,N,Z,F,sol);
	
	
always @(*) begin
	if(MB)
		BusB = Cosin;
	else
		BusB = Bdata;	
	
	if(MD)
		BusD = Datain;
	else
		BusD = F;
	
	Dataout = BusB;
	Addout = Adata;
end
endmodule 