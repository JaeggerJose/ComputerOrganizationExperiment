module Top(clk,reset, PC,Address_out,Data_out,Data_in,IR,MW,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,sol);
	input clk,reset;
	output [7:0] PC,Address_out,Data_out,Data_in,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	output [15:0] IR;
	output [8:0] sol;
	output MW;
	CPU cpu(IR,Data_in,PC,Address_out,Data_out,MW,clk,reset,outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,sol);
	IMEM imem(.Address(PC),.Instruction_out(IR));
	DMEM dmem(.MW(MW),.Address(Address_out),.Data_in(Data_out),.Data_out(Data_in),.clk(clk));
endmodule
