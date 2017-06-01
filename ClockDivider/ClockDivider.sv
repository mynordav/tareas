/****************************************************************************
Module name:
	ClockDivider.sv
Description:
	This module is a parametrizable frequency divider.
Inputs:
	Board clock and reset.
Outputs:
	Clock divided.
Version:
	1.0
Autors:
	Mynor Davila
	Montserrat De Aguinaga
Date:
	1/jun/17
****************************************************************************/

module ClockDivider
#(
	parameter OUT_FREQUENCY = 100,		/* Desire output frequency */
	parameter IN_FREQUENCY = 50000000	/* Input frequency */
)
(
	input clk_in,
	input rst,
	
	output reg clk
);

localparam MAX_COUNT = IN_FREQUENCY/(2*OUT_FREQUENCY);	/* Max value for half the period of the designed signal */

integer counter = 0;

always_ff@(posedge clk_in or negedge rst) begin
	if (rst == 1'b0) begin				/* If reset is pressed, clock and counter return to 0 */
		clk <= 1'b0;
		counter <= 0;
	end
	else begin 
		if(counter == MAX_COUNT - 1) begin	/* If counter reached the max value, togle the output */
			clk <= ~clk;			/* signal and restart counter */
			counter <= 0;
		end
		else
			counter++;			/* If counter hasnt reached max value, increase it */ 
	end
end


endmodule



