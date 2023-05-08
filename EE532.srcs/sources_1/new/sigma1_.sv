`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:51:01 PM
// Design Name: 
// Module Name: sigma1_
// Project Name: 
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


module sigma1_(
input [31:0] x,
output logic flg = 0,
output [31:0] y
    );
    // ?1(x) = ROTR17(X) XOR ROTR19(X) XOR SHR10(X)
    logic [31:0] ROTR17, ROTR19, SHR10;
    rotate #17 rot17(.x(x), .y(ROTR17));
    rotate #19 rot19(.x(x), .y(ROTR19));
    shift_reg shr_10(.x(x), .y(SHR10), .i(10));
   
    assign y = ROTR17 ^ ROTR19 ^ SHR10;    
 
endmodule

