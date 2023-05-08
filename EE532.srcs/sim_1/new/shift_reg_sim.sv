`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 09:42:28 PM
// Design Name: 
// Module Name: shift_reg_sim
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


module shift_reg_sim(

    );
    logic [31:0] x;
    logic [8:0] i;
    logic clk = 0;
    logic [31:0] y;

    
    shift_reg shift_reg_sim(.*);
    always 
    begin 
    #5 
    clk ^= 1;
    end
    
    
    initial
    begin
    x = 32'b11001;
    i = 3;
    
    end
endmodule
