
`timescale 1ns/100ps
module MAC_tb();

localparam data_width = 4;


	reg clk, aclr,sload;
	reg [data_width-1 : 0] dataa,datab;
	wire				[(2*data_width)-1:0] adder_out;

MAC #(.data_width(data_width)) DUT 
			(.clk(clk), .aclr(aclr), .dataa(dataa),.datab(datab),.adder_out(adder_out), .sload(sload)) ;
			 
 always #5 clk = ~clk;
 
 initial 
 begin
 $dumpfile("multiplier.vcd");
 $dumpvars;
 initialize();
 reset();
 inputs('d5, 'b1010 );
 #10
 inputs('b1011, 'b1010 );
 #40
 sload = 1'b1;
 #10
 sload = 1'b0;
 #20
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
clk = 1'b1;
aclr = 1'b1;

end
endtask

task inputs (input reg [data_width-1 : 0] a, input reg [data_width-1 : 0] b) ;

begin
	dataa = a;
	datab = b;
	
end
endtask			 

endmodule