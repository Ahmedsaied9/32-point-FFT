module Butterfly_D #(parameter data_width=16)
(   input wire signed [data_width-1:0] A_real, A_imag, B_real, B_imag, W_real, W_imag,
	input  clk_MAC, aclr, sload,
	input [1:0] select,
	output reg signed [data_width-1:0] O_real, O_imag

);

wire signed [data_width-1:0] W_real_neg;

assign W_real_neg = ~W_real + 1'b1;

wire signed [data_width-1:0] W_imag_neg;

assign W_imag_neg = ~W_imag + 1'b1;

///////////////////////////////////////////////////////////*********MULTIPLEXERS****************************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

wire signed [data_width-1:0] MUX1_o, MUX2_o, MUX3_o, MUX4_o;

MUX_4x1 #(.data_width(data_width)) MUX1 (.D(B_real), .A(B_imag), .C(A_real), .B(16'b0), .MUX_o(MUX1_o), .sel(select));

MUX_4x1 #(.data_width(data_width)) MUX2(.D(W_real_neg), .A(W_imag), .C(16'b0000000100000000),.B(16'b0), .MUX_o(MUX2_o), .sel(select));

MUX_4x1 #(.data_width(data_width)) MUX3 (.D(B_real), .A(B_imag), .C(A_imag),.B(16'b0), .MUX_o(MUX3_o), .sel(select));

MUX_4x1 #(.data_width(data_width)) MUX4 (.D(W_imag_neg), .A(W_real_neg), .C(16'b0000000100000000),.B(16'b0), .MUX_o(MUX4_o), .sel(select));

//////////////////////////////////////////////////*************2MACs*********************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

wire signed [data_width-1:0] adder_out1, adder_out2;

always @(adder_out1, adder_out2)
begin
	O_real = adder_out1;
	O_imag = adder_out2;
end

 MAC #(.data_width(data_width)) MAC1
(
	.dataa(MUX1_o),
	.datab(MUX2_o),
	.clk(clk_MAC), .aclr(aclr),  .sload(sload),		
	.adder_out(adder_out1)
);

MAC #(.data_width(data_width)) MAC2
(
	.dataa(MUX3_o),
	.datab(MUX4_o),
	.clk(clk_MAC), .aclr(aclr),  .sload(sload),		
	.adder_out(adder_out2)
);

endmodule
