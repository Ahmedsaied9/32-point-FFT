module MUX_4x1_tb();

localparam data_width = 4;

	reg [data_width-1:0] A_tb, B_tb,C_tb,D_tb;
	 reg [1:0]	sel_tb;
	wire [data_width-1:0] MUX_o_tb;
	
	reg clk;
	
	MUX_4x1 #(.data_width(data_width)) DUT 
			(.A(A_tb), .B(B_tb), .C(C_tb), .D(D_tb), .sel(sel_tb),.MUX_o(MUX_o_tb)) ;
			 
 always #5 clk = ~clk;
 
 initial 
 begin
 $dumpfile("MUX_4x1.vcd");
 $dumpvars;
 initialize();
 
 inputs('d5, 'd6,'d7,'d8);
 sel_tb = 2'b00;
 #10
 sel_tb = 2'b01;
 #10
 sel_tb = 2'b10;
 #10
 sel_tb = 2'b00;
 #40
 /*inputs('b1011, 'b0110 );
 #20*/
 $finish;
 end
 
 
 

task initialize;
begin
clk = 1'b1;
end
endtask

task inputs 
(input reg [data_width-1 : 0] A,input reg [data_width-1 : 0] B, input reg [data_width-1 : 0] C,input reg [data_width-1 : 0] D) ;

begin
	A_tb = A;
	
	B_tb=B;
	
	C_tb =C;
	D_tb= D;
end
endtask			 

endmodule