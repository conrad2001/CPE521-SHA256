`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2021 01:11:53 PM
// Design Name: 
// Module Name: Compression
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



module Compression(
input [31:0] w [0:63],
input clk, rst, EN,
output logic flg = 0,
output logic [31:0] y [0:63] 
    );
    
    int i = 0;
    
////////////////////////////////////////// hash constants //////////////////////////////////////////
    enum {a,b,c,d,e,f,g,h} hash_char;
    logic [31:0] hash_var [0:7] = {32'h6a09e667 ,32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};  
    const logic [31:0] hash_const [0:7] = {32'h6a09e667 ,32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
    
/*  for i from 0 to 63
    S1 = (e rightrotate 6) xor (e rightrotate 11) xor (e rightrotate 25)
    ch = (e and f) xor ((not e) and g)
    temp1 = h + S1 + ch + k[i] + w[i]
    S0 = (a rightrotate 2) xor (a rightrotate 13) xor (a rightrotate 22)
    maj = (a and b) xor (a and c) xor (b and c)
    temp2 := S0 + maj
    h = g
    g = f
    f = e
    e = d + temp1
    d = c
    c = b
    b = a
    a = temp1 + temp2*/
    logic [31:0] S0, S1;   
    SIGMA0 SIMGA0_(.x(hash_var[a]), .y(S0));
    SIGMA1 SIGMA1_(.x(hash_var[e]), .y(S1));
    logic [31:0] ch;
    CHOOSE choose_(.x(hash_var[e]), .y(hash_var[f]), .z(hash_var[g]), .out(ch));
    logic [31:0] maj_;
    Maj majority(.x(hash_var[a]), .y(hash_var[b]), .z(hash_var[c]), .out(maj_));
    logic [31:0] k, temp1, temp2;
    rom rom_(.addr(i), .y(k)); 
    
    
    always_comb begin // reset the module
        if(flg & !rst) begin 
            flg = 0;           
            i = 0;
            for(int j = 0; j < 8; j++) begin
                hash_var[j] = hash_const[j];
            end
        end
    end
    
    always_ff @ (posedge clk) begin
        if (i < 64 && EN) begin
            temp1 = hash_var[h] + S1 + ch + k + w[i];   
            temp2 = S0 + maj_;    
            hash_var[h] <= hash_var[g];
            hash_var[g] <= hash_var[f];
            hash_var[f] <= hash_var[e];
            hash_var[e] <= hash_var[d] + temp1;
            hash_var[d] <= hash_var[c];
            hash_var[c] <= hash_var[b];
            hash_var[b] <= hash_var[a];
            hash_var[a] <= temp1 + temp2;
            i++;
        end
        else if( i == 64) begin
            for(int j = 0; j < 8; j++) begin
                hash_var[j] += hash_const[j];
            end
            if(!flg) y [0:7] = {hash_var[a], hash_var[b], hash_var[c], hash_var[d], hash_var[e], hash_var[f], hash_var[g], hash_var[h]};
            flg = 1;        // complete flag
        end
    end
       

        
endmodule
