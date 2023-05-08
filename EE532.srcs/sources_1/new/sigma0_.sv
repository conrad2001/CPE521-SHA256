`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:46:06 PM
// Design Name: 
// Module Name: sigma0_
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


module sigma0_(
input [31:0] x,
output [31:0] y
    );
    // ?0(x) = ROTR7(X) XOR ROTR18(X) XOR SHR3(X)
    logic [31:0] ROTR7, ROTR18, SHR3;
    rotate #7 rot7(.x(x), .y(ROTR7));
    rotate #18 rot18(.x(x), .y(ROTR18));
    shift_reg shr_3(.x(x), .y(SHR3), .i(3));

    assign y = ROTR7 ^ ROTR18 ^ SHR3;

endmodule
