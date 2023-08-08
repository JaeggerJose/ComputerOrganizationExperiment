module CPU(IR,Data_in,PC,Address_out,Data_out,MW,clk,reset,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,sol);
	input clk,reset;
	input [15:0] IR;
	input [7:0] Data_in;
	output MW;
	output [7:0] PC,Address_out,Data_out,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	reg [7:0] PC,OP,AD,Constant_in;
	reg [6:0] Opcode;
	reg [7:0] R [0:7];
	reg [2:0] DR,SA,SB;
	reg MW,MB,MD,RW,PL,JB,BC;
	reg [3:0] FS;
	wire V,C,N,Z;
	output [8:0] sol;
	Rep_Lab_07 rep(Constant_in,Data_in,FS,MD,MB,RW,DR,clk,SA,IR[2:0],Address_out,Data_out,V,C,N,Z,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,sol);
	
	always @(*) begin
		Opcode = IR[15:9];
		DR = IR[8:6];
		SA = IR[5:3];
		SB = IR[2:0];
		OP = {5'b00000,IR[2:0]};
		Constant_in = OP;
		AD = {{2{IR[8]}},IR[8:6],IR[2:0]};
		MW = IR[14]&&!IR[15];
		MB = IR[15];
		MD = IR[13];
		FS[3] = IR[12];
		FS[2] = IR[11];
		FS[1] = IR[10];
		FS[0] = (~(IR[15]&&IR[14])&&IR[9]);
		RW = ~IR[14];
		PL = IR[15]&&IR[14];
		JB = IR[13];
		BC = IR[9];
	end
	
	// Comment the following two lines after insesrting the datapath circuit
	//assign Address_out = R[SA];
	//assign Data_out = IR[15] ? Constant_in : R[SB];

	always @ (posedge clk) begin
		if(reset)begin
			PC <= 0;
		end
		else begin
			if ((IR[15]&&IR[14])==0)
				PC <= PC+1;
		end
		if(PL) begin
			if((~BC&&Z)||(BC&&N))
				PC <= PC+AD;
			else
				PC <= PC+1;
			
			if(JB)
				PC <= Address_out;
				
		end
	end
endmodule
