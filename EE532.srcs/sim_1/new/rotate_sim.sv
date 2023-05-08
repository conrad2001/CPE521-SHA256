`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 09:47:44 PM
// Design Name: 
// Module Name: rotate_sim
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


module rotate_sim(

    );
    logic [31:0] x;     // input 32 bit 
    logic [31:0] y;
    
    rotate #6 rotate_sim(.*);
    
    initial
    begin
    x = 32'b1001011001;

        
    end
    
endmodule
