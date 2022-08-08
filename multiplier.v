module multiplier #(parameter data_width =32)
( 	input wire signed [data_width-1:0] dataa,
	input wire signed  [data_width-1:0] datab,
	input clk, aclr,
	output reg signed  [(2*data_width)-1:0] multa
);


reg signed [(2*data_width)-1:0] multa_comb, multa_complement;
wire A_is_pos, B_is_pos;
reg signed  [data_width-1:0]	dataa_comb,datab_comb;

/*checking whether input numbers are +Ve or -Ve
		//assign A_is_pos = (dataa[data_width-1]==1'b0) ? 1'b1 : 1'b0;
		//assign B_is_pos = (datab[data_width-1]==1'b0) ? 1'b1 : 1'b0;
	
	// Store the results of the operations on the current data
	//always @ (*)
	//begin
		//case({A_is_pos, B_is_pos})
		//2'b00 : begin
			//	dataa_comb = ~dataa + 1'b1;
				//datab_comb = ~datab + 1'b1;		
				//multa_complement = dataa_comb * datab_comb;	
		//		multa_comb = multa_complement;
				end
//		2'b01 : begin
//				dataa_comb = ~dataa + 1'b1;
//				datab_comb = datab;				
//				multa_complement = dataa_comb * datab_comb;
//				multa_comb = ~multa_complement + 1'b1;
//				end
//		2'b11 : begin
//				dataa_comb = dataa ;
//				datab_comb = datab ;
//				multa_complement = dataa_comb * datab_comb;	
//				multa_comb = multa_complement;
//				end
		2'b10 : begin
				dataa_comb = dataa;
				datab_comb = ~datab + 1'b1;	
				multa_complement = dataa_comb * datab_comb;
				multa_comb = ~multa_complement + 1'b1;				
				end

	endcase
	end
	*/
	
	
	
	always @ (posedge clk or negedge aclr)
	begin
		if (~aclr)
		begin
			multa <= 0;
		end
		
		else 
		begin
			multa <= multa_comb;
		end
		
	end
	
endmodule	