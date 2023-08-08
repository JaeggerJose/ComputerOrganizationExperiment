module Rep_Lab_07(Cosin,Datain,FS,MD,MB,LD,DS,clk,AA,BA,Addout,Dataout);
	input [7:0] Cosin, Datain;
	input [3:0] FS;
	input [2:0] DS,AA,BA;
	wire [7:0] Adata,Bdata,F;
	wire V,C,N,Z;
	reg [7:0] BusB = 0;
	reg [7:0] BusD = 0;
	reg MF;
	output reg [7:0] Addout,Dataout;
	input MD,MB,LD,clk;
	registerfile  rff(LD,DS,clk,BusD,AA,BA,Adata,Bdata);
	funtion_unit  fuu(Adata,BusB,FS,V,C,N,Z,F);
	
	
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