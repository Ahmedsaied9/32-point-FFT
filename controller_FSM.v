module controller_fsm (
input wire clk_20, clk_100,reset_all,
output reg aclr_s1, aclr_s2, aclr_s3, aclr_s4, aclr_s5,
output reg sload_s1, sload_s2, sload_s3, sload_s4, sload_s5,
output reg [2:0] counter_out
);

wire [2:0] counter_out_w;
counter counter_i (
.clk( clk_100 ),
.reset(reset_all),
.out(  counter_out_w )
);

always @ (counter_out_w) begin
counter_out <= counter_out_w;
end

localparam  reset_s = 3'd0,inputs_1 =  3'd1,inputs_2 =  3'd2,inputs_3 =  3'd3, none= 3'd4;
reg[3:0] state_reg, state_next;
	
always @(posedge clk_100, posedge reset_all)
begin
    if(reset_all) // go to state zero if rese
        begin
        state_reg <= reset_s;
        aclr_s1 <= 1'b0;
		aclr_s2 <= 1'b0;
		aclr_s3 <= 1'b0;
		aclr_s4 <= 1'b0;
		aclr_s5 <= 1'b0;
        end
    else // otherwise update the states
        begin
        state_reg <= state_next;
        aclr_s1 <= 1'b1;
		aclr_s2 <= 1'b1;
		aclr_s3 <= 1'b1;
		aclr_s4 <= 1'b1;
		aclr_s5 <= 1'b1;
        end
end	

// Moore Design 
always @(state_reg, counter_out )begin
		sload_s1 <= 1'b0;
		sload_s2 <= 1'b0;
		sload_s3 <= 1'b0;
		sload_s4 <= 1'b0;
		sload_s5 <= 1'b0;
    // store current state as next
    state_next = state_reg; 
    
    case(state_reg)
        reset_s: begin		
		sload_s1<= 1'b1;
		sload_s2<= 1'b1;
		sload_s3<= 1'b1;
		sload_s4<= 1'b1;
		sload_s5<= 1'b1;
            if(counter_out == 3'd1) 
                state_next = inputs_1; 
                else
                state_next = reset_s;
				end
        inputs_1:   
            begin
		sload_s1 <= 1'b0;
		sload_s2 <= 1'b0;
		sload_s3 <= 1'b0;
		sload_s4 <= 1'b0;
		sload_s5 <= 1'b0;
                if(counter_out == 3'd2) // if level is 1, 
                    state_next = inputs_2; // go to state one,
                else    
                    state_next = inputs_1; // else go to state zero.
            end
        inputs_2:
            begin
		sload_s1 <= 1'b0;
		sload_s2 <= 1'b0;
		sload_s3 <= 1'b0;
		sload_s4 <= 1'b0;
		sload_s5 <= 1'b0;
                if(counter_out == 3'd3) // if level is 1, 
                    state_next = inputs_3; // go to state one,
                else    
                    state_next = inputs_2; // else go to state zero.
            end
        inputs_3:
        begin
		sload_s1 <= 1'b0;
		sload_s2 <= 1'b0;
		sload_s3 <= 1'b0;
		sload_s4 <= 1'b0;
		sload_s5 <= 1'b0;
                if(counter_out == 3'd4) // if level is 1, 
                    state_next = none; // go to state one,
					else
					state_next = inputs_3;
		end
        none:
            begin
		sload_s1 <= 1'b0;
		sload_s2 <= 1'b0;
		sload_s3 <= 1'b0;
		sload_s4 <= 1'b0;
		sload_s5 <= 1'b0;
                if(counter_out == 3'd0) // if level is 1, 
                    state_next = reset_s; // go to state one,
					else
					state_next = none; 
            end	
			
    endcase
end
endmodule
	





