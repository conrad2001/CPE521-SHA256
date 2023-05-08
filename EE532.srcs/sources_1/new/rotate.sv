`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 11:54:26 PM
// Design Name: 
// Module Name: rotate
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


module rotate  #(parameter i = 5) (
input [31:0] x,     // input 32 bit 
output [31:0] y
    );
    assign    y = { x[i-1:0], x[31:i] };
endmodule
