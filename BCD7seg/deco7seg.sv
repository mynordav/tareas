/****************************************************************************
Module name:
	deco7seg.sv
Description:
	Decoder from BCD numbers to 7 segments displays.
Inputs:
	BCD data
Outputs:
	Segments of the displays.
Version:
	1.0
Autors:
	Mynor Davila
	Montserrat De Aguinaga
Date:
	30/may/17
****************************************************************************/

/*`define NUM0 7b'1000000
`define NUM1 7b'1111001
`define NUM2 7b'0100100
`define NUM3 7b'1001111
`define NUM4 7b'0011001
`define NUM5 7b'1010010
`define NUM6 7b'0000010
`define NUM7 7b'1111000
`define NUM8 7b'0000000
`define NUM9 7b'0010000
`define ERROR 7'b0000110*/

module deco7seg(
	input  [3:0] bcd_data,
	output [6:0] segments
);

wire [6:0] segments_wire;

/* Every case for each number that can appear on the displays (0-9) */
	
assign segments_wire = 	(bcd_data === 4'd0) ? 7'b1000000 : 
								(bcd_data === 4'd1) ? 7'b1111001 :
								(bcd_data === 4'd2) ? 7'b0100100 :
								(bcd_data === 4'd3) ? 7'b0110000 :
								(bcd_data === 4'd4) ? 7'b0011001 :
								(bcd_data === 4'd5) ? 7'b0010010 :
								(bcd_data === 4'd6) ? 7'b0000010 :
								(bcd_data === 4'd7) ? 7'b1111000 :
								(bcd_data === 4'd8) ? 7'b0000000 :
								(bcd_data === 4'd9) ? 7'b0010000 :
													       7'b0000110;

assign segments = segments_wire;

endmodule //deco7seg