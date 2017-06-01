
timeunit 10ns; //It specifies the time unit that all the delay will take in the simulation.
timeprecision 1ns;// It specifies the resolution in the simulation.

module ClockDivider_TB;

parameter OUT_FREQUENCY = 100;
//parameter IN_FREQUENCY = 50000000;

 // Input Ports
bit clk_in = 0;
bit rst;
	
  // Output Ports
logic clk; 

ClockDivider
#(
	// Parameter Declarations
	.OUT_FREQUENCY(OUT_FREQUENCY)
)
DUT
(
	// Input Ports
	.clk_in(clk_in),
	.rst(rst),
		
	// Output Ports
	.clk(clk) 


);	

/*********************************************************/
initial // Clock generator
  begin
    forever #1 clk_in = !clk_in;
  end
/*********************************************************/
initial begin // reset generator
	#0 rst = 0;
	#5 rst = 1;
end

endmodule
