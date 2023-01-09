`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 07:49:25 PM
// Design Name: 
// Module Name: timer_tb
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


module timer_tb;

    reg [3:0] tp_val;
    reg enable;
    reg start_t;
    reg reset_sync;
    reg clk;
    wire expired;
    
    timer uut (
        .tp_val(tp_val),
        .enable(enable),
        .start_t(start_t),
        .reset_sync(reset_sync),
        .clk(clk),
        .expired(expired)
    );
    
    initial begin
        enable = 1;
        tp_val = 2'b0011;
        start_t = 0;
        reset_sync = 0;
        #30
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        start_t = 1;
        enable = 1;
        #10
        start_t = 0;
        #20
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        enable = 1;
        #30
        enable = 0;
        #30
        enable = 1;
    end
    
    initial begin
        clk=0;
        forever begin
            #5
            clk = ~clk;
        end 
    end

endmodule
