`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    input reset,
    input sensor,
    input walk,
    input reprogram,
    input clk,
    output reg reset_sync,
    output reg sensor_sync,
    output reg wr_sync,
    output reg prog_sync
    );
    
    always@(posedge clk) begin
        reset_sync = reset;
        sensor_sync = sensor;
        wr_sync = walk;
        prog_sync = reprogram;
    end
    
endmodule
