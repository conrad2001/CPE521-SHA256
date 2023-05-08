`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2021 03:53:11 PM
// Design Name: 
// Module Name: SHA256
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


module SHA256(
input [511:0] x, 
input clk,
output logic flg = 0,        // indicates completion
output [0:31] y [0:63] 
    );   
    
    logic [31:0] y1 [0:63];
    logic [31:0] y2 [0:63];
    logic [31:0] w [0:63];
    logic flg1 = 0, EN = 0, EN2 = 0, flg2 = 0;
    
    always_comb begin
        if(flg1) begin 
        w = y1;
        EN = 1;
        end    
        if(flg) EN = 0;  
        if(flg2) EN2 = 1;
    end
    //Expansion expansion_(.x(x), .y(y1), .clk(clk), .flg(flg1));
    (* dont_touch = "true" *) Compression compression_1(.w(w), .y(y2), .clk(clk), .rst(1), .flg(flg2), .EN(EN));   
    (* dont_touch = "true" *) Compression compression_2(.w(y2), .y(y), .clk(clk), .rst(1), .flg(flg), .EN(EN2));       
    
endmodule
