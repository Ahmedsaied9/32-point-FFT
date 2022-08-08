module MAC #(parameter data_width =32)
(
	input wire signed [data_width-1:0] dataa,
	input wire signed [data_width-1:0] datab,
	input wire clk, aclr,  sload,		//clken,
	output reg signed [data_width-1:0] adder_out
);

	// Declare registers and wires
	//reg  [data_width-1:0] dataa_reg, datab_reg;
	reg  sload_reg;
	reg signed [data_width-1:0] old_result;
	wire signed [(2*data_width)-1:0] multa;
	wire A_is_pos, B_is_pos;
	
	
//**************************************Multiplier*******************************************\\
	
//	multiplier #(.data_width(data_width)) multiplier_i
//	(.clk(clk), .aclr(aclr), .dataa(dataa),.datab(datab),.multa(multa));
	
	
	
	assign multa = dataa * datab;
	
	
		
	
	// Store the value of the accumulation (or clear it)
	always @ (adder_out, sload_reg)
	begin
		if (sload_reg)
			old_result <= 0;
		else
			old_result <= adder_out;
	end
	
	// Clear or update data, as appropriate
	always @ (posedge clk or negedge aclr)
	begin
		if (~aclr)
		begin
			
			sload_reg <= 0;
			adder_out <= 0;
		end
		
		else 
		begin
			
			sload_reg <= sload;
			adder_out <= old_result + multa[23:8];
		end
	end
endmodule
