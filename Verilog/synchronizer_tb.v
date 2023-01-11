`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 08:47:22 PM
// Design Name: 
// Module Name: synchronizer_tb
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


module synchronizer_tb;

    reg reset;
    reg sensor;
    reg walk;
    reg reprogram;
    reg clk;
    wire reset_sync;
    wire sensor_sync;
    wire wr_sync;
    wire prog_sync;
    
    synchronizer uut (
        .reset(reset),
        .sensor(sensor),
        .walk(walk),
        .reprogram(reprogram),
        .clk(clk),
        .reset_sync(reset_sync),
        .sensor_sync(sensor_sync),
        .wr_sync(wr_sync),
        .prog_sync(prog_sync)
    );
    
    initial begin
        reset = 0;
        sensor = 0;
        walk = 0;
        reprogram = 0;
        #17
        reset = 1;
        #2
        sensor = 1;
        #2
        walk = 1;
        #2
        reprogram = 1;
    end
    
    initial begin
        clk=0;
        forever begin
            #5
            clk = ~clk;
        end 
    end

endmodule
