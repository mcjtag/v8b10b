`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dmitry Matyunin (https://github.com/mcjtag)
// 
// Create Date: 06.04.2021 23:10:30
// Design Name: 
// Module Name: decoder_8b10b
// Project Name: v8b10b
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module decoder_8b10b (
	input wire clk,
	input wire rst,
	input wire en,
	input wire [9:0]din,
	output wire [7:0]dout,
	output wire kout,
	output wire code_err,
	output wire disp,
	output wire disp_err
);
   
reg [7:0]do;
reg k;
reg ce;
reg [2:0]e;
reg p;
reg [3:0]pe;
wire [9:0]d;

assign d = din;
assign disp_err = pe?1'b1:1'b0;
assign dout = do;
assign kout = k;
assign code_err = ce;
assign disp = p;

always @(posedge clk) begin
	if (rst) begin
		k <= 0;
		do <= 8'b0; 
	end else begin
		if (en == 1'b1) begin
			k <= (((d[7]&d[6]&d[5]&d[4])|(!d[7]&!d[6]&!d[5]&!d[4]))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&(!d[5]&d[4]&d[2]&d[1]&d[0]))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]&!d[4]&!d[2]&!d[1]&!d[0])));
			do[7] <= ((d[0]^d[1])&!((!d[3]&d[2]&!d[1]&d[0]&!(!(d[7]|d[6]|d[5]|d[4])))|(!d[3]&d[2]&d[1]&!d[0]&(!(d[7]|d[6]|d[5]|d[4])))|(d[3]&!d[2]&!d[1]&d[0]&!(!(d[7]|d[6]|d[5]|d[4])))|(d[3]&!d[2]&d[1]&!d[0]&(!(d[7]|d[6]|d[5]|d[4])))))|(!d[3]&d[2]&d[1]&d[0])|(d[3]&!d[2]&!d[1]&!d[0]);
			do[6] <= (d[0]&!d[3]&(d[1]|!d[2]|!(!(d[7]|d[6]|d[5]|d[4]))))|(d[3]&!d[0]&(!d[1]|d[2]|(!(d[7]|d[6]|d[5]|d[4]))))|(!(!(d[7]|d[6]|d[5]|d[4]))&d[2]&d[1])|((!(d[7]|d[6]|d[5]|d[4]))&!d[2]&!d[1]);
			do[5] <= (d[0]&!d[3]&(d[1]|!d[2]|(!(d[7]|d[6]|d[5]|d[4]))))|(d[3]&!d[0]&(!d[1]|d[2]|!(!(d[7]|d[6]|d[5]|d[4]))))|((!(d[7]|d[6]|d[5]|d[4]))&d[2]&d[1])|(!(!(d[7]|d[6]|d[5]|d[4]))&!d[2]&!d[1]);
			do[4] <= d[5]^(((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5])|(!d[7]&!d[6]&!d[5]&!d[4])|(!d[9]&!d[8]&!d[5]&!d[4]))|((((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[9]&!d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6])) & !d[9] & !d[8]))&!d[4]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&d[6]&d[5]&d[4])|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[8]&!d[7]&(!(d[5]^d[4])))));
			do[3] <= d[6]^(((d[9]&d[8]&d[5]&d[4])|(!d[7]&!d[6]&!d[5]&!d[4])|(((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[4]))|((((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[9]&d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&d[6]&d[5]&d[4])|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[8]&!d[7]&(!(d[5]^d[4])))));
			do[2] <= d[7]^(((((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[9]&!d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[4])|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[8]&d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&d[6]&d[5]&d[4]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5])|(!d[7]&!d[6]&!d[5]&!d[4])|(!d[9]&!d[8]&!d[5]&!d[4])));
			do[1] <= d[8]^(((d[9]&d[8]&d[5]&d[4])|(!d[7]&!d[6]&!d[5]&!d[4])|(((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[4]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[4])|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[8]&d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&d[6]&d[5]&d[4]))|((((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[9]&d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5])));
			do[0] <= d[9]^(((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&d[6]&d[5]&d[4])|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[8]&!d[7]&(!(d[5]^d[4]))))|((((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[9]&!d[7]&(!(d[5]^d[4])))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5]))|((d[9]&d[8]&d[5]&d[4])|(!d[7]&!d[6]&!d[5]&!d[4])|(((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[4])));
		end
	end
end
   
always @(posedge clk) begin
	if (rst) begin
		p <= 1'b0;
		pe <= 4'hF;
		ce <= 1'b1;
		e = 3'b000;
	end else begin
		if (en == 1'b1) begin
			p <= (((!((d[3]&d[2])|(!d[3]&!d[2])))&d[1]&d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&d[3]&d[2]))|(((d[5]&d[4]&!(((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!p))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&p))&(d[5]|d[4]))|(((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&p))&((d[3]&d[2]&!d[1]&!d[0])|(!d[3]&!d[2]&d[1]&d[0])|(!((d[3]&d[2])|(!d[3]&!d[2]))&!((d[1]&d[0])|(!d[1]&!d[0]))))) ;
			pe[0] <= ((p&((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4])))|(((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))&!p))|((p&!((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))&d[3]&d[2]));
			pe[1] <= ((p&d[9]&d[8]&d[7]))|((p&!((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))&(((!((d[3]&d[2])|(!d[3]&!d[2])))&d[1]&d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&d[3]&d[2]))));
			pe[2] <= ((!p&!((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4]))&!d[3]&!d[2]))|((!p&!d[9]&!d[8]&!d[7]));
			pe[3] <= ((!p&!((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4]))&((!((d[3]&d[2])|(!d[3]&!d[2]))&!d[1]&!d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&!d[3]&!d[2]))))|((((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4]))&(((!((d[3]&d[2])|(!d[3]&!d[2])))&d[1]&d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&d[3]&d[2])))|(((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))&((!((d[3]&d[2])|(!d[3]&!d[2]))&!d[1]&!d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&!d[3]&!d[2]))));
			e[0] <= ((d[9]&d[8]&d[7]&d[6])|(!d[9]&!d[8]&!d[7]&!d[6]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5]&!d[4]))|((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[5]&d[4]))|((d[3]&d[2]&d[1]&d[0])|(!d[3]&!d[2]&!d[1]&!d[0]))|((d[5]&d[4]&d[3]&d[2]&d[1])|(!d[5]&!d[4]&!d[3]&!d[2]&!d[1]))|((d[5]&!d[4]&d[2]&d[1]&d[0])|(!d[5]&d[4]&!d[2]&!d[1]&!d[0]))|((((d[5]&d[4]&!d[2]&!d[1]&!d[0])|(!d[5]&!d[4]&d[2]&d[1]&d[0]))&!((d[7]&d[6]&d[5])|(!d[7]&!d[6]&!d[5]))))|((!((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&d[5]&!d[4]&!d[2]&!d[1]&!d[0]))|((!((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!d[5]&d[4]&d[2]&d[1]&d[0]));
			e[1] <= ((((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4]))&(((!((d[3]&d[2])|(!d[3]&!d[2])))&d[1]&d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&d[3]&d[2])))|(((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))&((!((d[3]&d[2])|(!d[3]&!d[2]))&!d[1]&!d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&!d[3]&!d[2]))))|((d[3]&d[2]&!d[1]&!d[0]&((((!((d[9]&d[8])|(!d[9]&!d[8]))&d[7]&d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&d[9]&d[8]))&(d[5]|d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&d[5]&d[4]))))|((!d[3]&!d[2]&d[1]&d[0]&((((!((d[9]&d[8])|(!d[9]&!d[8]))&!d[7]&!d[6])|(!((d[7]&d[6])|(!d[7]&!d[6]))&!d[9]&!d[8]))&!(d[5]&d[4]))|(((d[9]&d[8]&!d[7]&!d[6])|(d[7]&d[6]&!d[9]&!d[8])|(!((d[9]&d[8])|(!d[9]&!d[8]))&!((d[7]&d[6])|(!d[7]&!d[6]))))&!d[5]&!d[4]))));
			e[2] <= ((d[9]&d[8]&d[7]&!d[5]&!d[4]&((!d[3]&!d[2])|((!((d[3]&d[2])|(!d[3]&!d[2]))&!d[1]&!d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&!d[3]&!d[2])))))|((!d[9]&!d[8]&!d[7]&d[5]&d[4]&((d[3]&d[2])|(((!((d[3]&d[2])|(!d[3]&!d[2])))&d[1]&d[0])|(!((d[1]&d[0])|(!d[1]&!d[0]))&d[3]&d[2])))))|((d[7]&d[6]&d[5]&d[4]&!d[3]&!d[2]&!d[1]))|((!d[7]&!d[6]&!d[5]&!d[4]&d[3]&d[2]&d[1]));
			ce <= e ? 1'b1 : 1'b0;
		end
	end
end

endmodule