/****************************************************************************
Module name:
	display7seg.sv
Description:
	Decoder from binary numbers to BCD with sign, showed on the 7 segments displays.
Inputs:
	Binary data
Outputs:
	Display data.
Version:
	1.0
Autors:
	Mynor Davila
	Montserrat De Aguinaga
Date:
	30/may/17
****************************************************************************/

module display7seg (
	input  [7:0] bin_data,
	output [6:0] display_ones,
	output [6:0] display_tens,
	output [6:0] display_hundreds,
	output display_sign
);

wire [3:0] ones_wire;
wire [3:0] tens_wire;
wire [3:0] hundreds_wire;

/* Decoder binary to BCD */
bin2bcd bcd_decoder(
	.bin_data(bin_data),  .bcd_ones(ones_wire),
	.bcd_tens(tens_wire), .bcd_hundreds(hundreds_wire),
	.sign(display_sign)
);

/* Decoder BCD ones to display */
deco7seg ones7seg(
	.bcd_data(ones_wire), .segments(display_ones)
);

/* Decoder BCD tens to display */
deco7seg tens7seg(
	.bcd_data(tens_wire), .segments(display_tens)
);

/* Decoder BCD hundreds to display */
deco7seg hundreds7seg(
	.bcd_data(hundreds_wire), .segments(display_hundreds)
);


endmodule //display7seg