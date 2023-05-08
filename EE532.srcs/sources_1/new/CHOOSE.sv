`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 10:20:30 PM
// Design Name: 
// Module Name: CHOOSE
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


module CHOOSE(
input [31:0] x,y,z,
output [31:0] out
    );

/* Ch(x, y, z) = For each bit in answer ai, 
   choose yi if xi is 1, choose zi if xi is 0*/    
// ch = (x and y) xor ((not x) and z)
assign  out =  x & y ^ ~x & z;

    
endmodule
