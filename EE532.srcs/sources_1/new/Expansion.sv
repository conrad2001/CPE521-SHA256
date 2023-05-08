`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 03:00:11 PM
// Design Name: 
// Module Name: Expansion
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


module Expansion(
input [511:0] x,
input clk,
output logic flg = 0,        // indicates completion
output [31:0] y [0:63]  
    );
    
    
    
    // padding 
    //logic [511:0] x = 512'b01101000011001010110110001101100011011110010000001110111011011110111001001101100011001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001011000;
    int i = 0;
    
    
   // assign    x = {msg,1'b1} << (510-msg_len) | msg_len;
    
    // meessage schedule
    logic [31:0] reg_in = 0;      // define input variables
    logic [31:0] s0 = 0, s1 = 0;    // define output variables
    
    
    
    logic [31:0] sig0_out = 0, sig1_out = 0, prev16, prev7;
    logic [5:0] prev16_in = 0, prev7_in = 0,  sig0_in = 0, sig1_in = 0, addr_W = 0;
    logic [31:0] adder_out = 0;
    logic EN = 1;
    
    always_ff @ (posedge clk)
    begin
        if(i < 64)
        begin  
            addr_W = i;            
            i++;
            EN = 1;     
        end
        else 
        begin
            EN = 0;     // stop writing garbage to ram after complete
            flg = 1;    // raise complete flag
        end
    end

    
    register msg_reg(.clk(clk), .x(reg_in),       // write data in
    .y1(sig0_out), .y2(sig1_out), .y3(prev16), .y4(prev7), .ram_data(y),     // read output
    .addr_W(addr_W), .EN(EN),     // write addr, write enable
    .addr1(sig0_in), .addr2(sig1_in), .addr3(prev16_in), .addr4(prev7_in));     // read addr
    // Modify the zero-ed indexes at the end of the array using the following algorithm:
    sigma0_ sigma0(.x(sig0_out), .y(s0));    
    sigma1_ sigma1(.x(sig1_out), .y(s1));
    adder Create_msg_sch(.x1(prev16), .x2(s0), .x3(prev7), .x4(s1), .y(adder_out));
    
    always_comb
    begin
        if(i < 16)     reg_in = x[511-i*32 -:32];     // slice 16 chunks of 32 bits from MSB      
        else
        begin
            // w[i] = w[i-16] + s0 + w[i-7] + s1;
            prev16_in = i - 16;     // w[i-16]
            prev7_in = i - 7;       // w[i-7]
            sig0_in =  i - 15;     //s0(i-15)
            sig1_in = i - 2;        //s1(i-2)    
            reg_in =  adder_out;          
        end  
    end
    
    
endmodule