`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2021 02:24:29 PM
// Design Name: 
// Module Name: sigma_sim
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


module sigma_sim(

    );
    
    logic [31:0] x;
    logic [8:0] i;
    logic clk, EN;
    logic flg = 0;
    logic [31:0] y;
    sigma0_ SIGMA0_SIM(.*);
    
    initial 
    begin
        x = 32'h671D0E2F;
    end
endmodule
