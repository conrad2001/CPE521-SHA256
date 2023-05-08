`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:43:46 PM
// Design Name: 
// Module Name: SIGMA1
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


module SIGMA1(   
input [31:0] x,
output [31:0] y
);

// ?1(x) = ROTR6(X) XOR ROTR11(X) XOR ROTR25(X)
    logic [31:0] ROTR6, ROTR11, ROTR25;
    rotate #6 rot6(.x(x), .y(ROTR6));
    rotate #11 rot11(.x(x), .y(ROTR11));
    rotate #25 rot25(.x(x), .y(ROTR25));
    
    assign
        y =  ROTR6 ^ ROTR11 ^ ROTR25;
endmodule

