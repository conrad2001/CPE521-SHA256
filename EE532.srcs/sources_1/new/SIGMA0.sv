`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 02:40:01 PM
// Design Name: 
// Module Name: SIGMA0
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


module SIGMA0(
input [31:0] x,
output [31:0] y
    );
    
    // ?0(x) = ROTR2(X) XOR ROTR13(X) XOR ROTR22(X)
    logic [31:0] ROTR2, ROTR13, ROTR22;
    rotate #2 rot2(.x(x), .y(ROTR2));
    rotate #13 rot13(.x(x), .y(ROTR13));
    rotate #22 rot22(.x(x), .y(ROTR22));
    
    assign
        y =  ROTR2 ^ ROTR13 ^ ROTR22;
endmodule
