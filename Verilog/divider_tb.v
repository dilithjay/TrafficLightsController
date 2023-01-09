`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 12:16:22 PM
// Design Name: 
// Module Name: divider_tb
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


module divider_tb;

    reg clk;
    reg reset_sync;
    wire enable;
    
    divider uut (
        .clk(clk),
        .reset_sync(reset_sync), 
        .enable(enable)
    );
    
    initial begin
        reset_sync = 0;
        #150
        reset_sync = 1;
        #10
        reset_sync = 0;
    end
    
    initial begin
        clk=0;
        forever begin
            #5
            clk = ~clk;
        end 
    end

endmodule
