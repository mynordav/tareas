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
localparam COUNTER_WIDTH = CeilLog2(MAX_COUNT);

logic [COUNTER_WIDTH-1:0] counter;

always_ff@(posedge clk_in or negedge rst) begin
	if (rst == 1'b0) begin
		clk <= 1'b0;
		counter <= 0;
	end
	else begin 
		if(counter == MAX_COUNT - 1) begin
			clk <= ~clk;
			counter <= 0;
		end
		else
			counter++;
	end
end


endmodule

/*Log Function*/
function integer CeilLog2;
 input integer data;
 integer i,result;
 begin
	 for(i=0; 2**i < data; i=i+1)
		 result = i + 1;
	 CeilLog2 = result;
 end
endfunction

