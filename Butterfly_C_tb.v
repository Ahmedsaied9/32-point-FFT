
`timescale 1ns/100ps
module Butterfly_C_tb();

localparam data_width = 4;

	reg [data_width-1:0]	A_real_tb, A_imag_tb, B_real_tb, B_imag_tb, W_real_tb, W_imag_tb;
	reg clk_MAC, aclr,sload;
	reg [1:0]	select;
	wire				[(2*data_width)-1:0] O_real, O_imag;

Butterfly #(.data_width(data_width)) DUT 
			(.A_real(A_real_tb), .A_imag(A_imag_tb), .B_real(B_real_tb), .B_imag(B_imag_tb), .W_real(W_real_tb), .W_imag(W_imag_tb),.clk_MAC(clk_MAC), .aclr(aclr), .sload(sload),.select(select), .O_real(O_real), .O_imag(O_imag)) ;
			 
 always #5 clk_MAC = ~clk_MAC;
 
 initial 
 begin
 $dumpfile("Butterfly_C.vcd");
 $dumpvars;
 initialize();
 reset();
 inputs('d5, 'd5,'d5,'d5,'d5,'d5 );
 select = 2'b00;
 #10
 select = 2'b01;
 #10
 select = 2'b10;
 #16
 select = 2'b00;
 sload = 1'b1;
 inputs('d5, 'd5,'d5,'d5,'d5,'d5);
 #10
 sload = 1'b0;
 select = 2'b01;
 #10
 select = 2'b10;
 #10
 sload = 1'b1;
 #40
 /*inputs('b1011, 'b0110 );
 #20*/
 $finish;
 end
 
 task reset;
 begin
 
 aclr = 1'b1;
 sload = 1'b0;
 #2
 aclr = 1'b0;
sload = 1'b1;
#2
sload = 1'b0;
aclr = 1'b1; 
 end
 endtask
 

task initialize;
begin
clk_MAC = 1'b1;
aclr = 1'b1;

end
endtask

task inputs 
(input reg [data_width-1 : 0] A_real,input reg [data_width-1 : 0] A_imag,input reg [data_width-1 : 0] B_real, input reg [data_width-1 : 0]B_imag, input reg [data_width-1 : 0] W_real,input reg [data_width-1 : 0] W_imag) ;

begin
	A_real_tb = A_real;
	A_imag_tb = A_imag;
	B_real_tb=B_real;
	B_imag_tb=B_imag;
	W_real_tb =W_real;
	 W_imag_tb= W_imag;
end
endtask			 

endmodule