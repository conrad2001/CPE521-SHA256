`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 10:26:41 PM
// Design Name: 
// Module Name: Maj
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


module Maj(
input [31:0] x,y,z,
output [31:0] out
    );
//    Maj(x, y, z) = For each bit in answer ai, choose whatever the majority of bits are in position i
// out = (x and y) xor (x and z) xor (y and z)
assign out = x & y ^ x & z ^ y & z;

endmodule
