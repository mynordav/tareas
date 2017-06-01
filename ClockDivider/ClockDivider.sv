module ClockDivider
#(
	parameter OUT_FREQUENCY = 100,
	parameter IN_FREQUENCY = 50000000
)
(
	input clk_in,
	input rst,
	
	output reg clk
);

localparam MAX_COUNT = IN_FREQUENCY/(2*OUT_FREQUENCY);

integer counter = 0;

always_ff@(posedge clk_in or negedge rst) begin
	if (rst == 1'b0) begin
		clk <= 1'b0;
		counter <= 0;
	end
	else begin 
		if(counter == MAX_COUNT) begin
			clk <= ~clk;
			counter <= 0;
		end
		else
			counter++;
	end
end
endmodule



