`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 03:35:52 PM
// Design Name: 
// Module Name: register
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


module register (
input [31:0] x,
input clk, EN,
input [5:0] addr_W, addr1, addr2, addr3, addr4,
output [31:0] y1, y2,y3,y4,
output [31:0] ram_data [0:63]
    );
logic [31:0] ram [0:63];
int i;
initial
begin
    for (i = 0; i < 64; i++)
        ram[i] = 0;       
end 
always_ff @ (posedge clk)
begin   
    if(EN) ram[addr_W] = x;         // syn write    
end

assign    y1 = ram[addr1]; // asyn read
assign    y2 = ram[addr2];
assign    y3 = ram[addr3];
assign    y4 = ram[addr4];
assign    ram_data = ram;

endmodule
