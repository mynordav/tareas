/****************************************************************************
Module name:
	bin2bcd.sv
Description:
	Decoder from binary numbers to BCD with sign.
Inputs:
	Binary data
Outputs:
	BCD data divided in hundreds, tens and ones.
Version:
	1.0
Autors:
	Mynor Davila
	Montserrat De Aguinaga
Date:
	30/may/17
****************************************************************************/

module bin2bcd(
	input  [7:0] bin_data,
	output [3:0] bcd_ones,
	output [3:0] bcd_tens,
	output [3:0] bcd_hundreds,
	output sign
);
integer i;
logic [3:0] ones_log;
logic [3:0] tens_log;
logic [3:0] hundreds_log;
logic [7:0] bin_data_posi;

always_comb begin
	if(bin_data[7] === 1)									/* Check for negative numbers */
		bin_data_posi = (~bin_data) + 8'b1;				/* If negative, calculate two's compelement */
	else
		bin_data_posi = {1'b0, bin_data[6:0]};			/* Else, ignore msb */
	
	hundreds_log = 4'd0;										/* Initialization with 0 for the left shifts */
	tens_log 	 = 4'd0;
	ones_log		 = 4'd0;
	
	/**************************************************************
	If any number (hundreds, tens or ones) is 5 or greater, add 3 
	Left shifting one position
	Stop after 8 shifts (8 bits)
	***************************************************************/
	for(i = 7; i >= 0; i = i - 1) begin				
		if(hundreds_log >= 4'd5)
			hundreds_log = hundreds_log + 4'd3;
		if(tens_log >= 4'd5)
			tens_log = tens_log + 4'd3;
		if(ones_log >= 4'd5)
			ones_log = ones_log + 4'd3;
		
		hundreds_log = hundreds_log << 1;
		hundreds_log[0] = tens_log[3];
		tens_log = tens_log << 1;
		tens_log[0] = ones_log[3];
		ones_log = ones_log << 1;
		ones_log[0] = bin_data_posi[i];
	end

end

assign bcd_ones     = ones_log;
assign bcd_tens 	  = tens_log;
assign bcd_hundreds = hundreds_log;
assign sign         = ~bin_data[7];		/* Sign bit is the complement because the displays are common anode */
endmodule // bin2bcd