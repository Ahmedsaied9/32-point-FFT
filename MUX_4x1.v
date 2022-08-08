module MUX_4x1 #(parameter data_width=32)
(
	input wire signed [data_width-1:0] A, B,C,D,
	input wire [1:0]	sel,
	output reg signed [data_width-1:0] MUX_o
);

always @ (*)
begin
	case (sel)
	
			2'b00:	begin
						MUX_o = A;
					end
			2'b01:	begin
						MUX_o = B;
					end
			2'b10:	begin
						MUX_o = C;
					end		
			2'b11:	begin
						MUX_o = D;
					end
			
	endcase
end

endmodule