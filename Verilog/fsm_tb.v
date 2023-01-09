`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 10:12:52 PM
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb;
    reg wr;
    reg sensor_sync;
    reg prog_sync;
    reg expired;
    reg reset_sync;
    reg clk;
    wire [6:0] leds;
    wire [1:0] interval;
    wire start_t;
    wire wr_reset;
    
    // Instantiate the Unit Under Test (UUT)
    fsm uut (
        .wr(wr), 
        .sensor_sync(sensor_sync), 
        .prog_sync(prog_sync), 
        .expired(expired), 
        .reset_sync(reset_sync), 
        .clk(clk),
        .leds(leds), 
        .interval(interval),
        .start_t(start_t),
        .wr_reset(wr_reset)
    );
    
    initial begin
        sensor_sync = 0;
        wr = 0;
        expired = 0;
        prog_sync = 0;
        reset_sync = 0;
        #10;
        reset_sync = 1;
        expired = 1;
        #10;
        reset_sync = 0;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        wr = 1;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        wr = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        sensor_sync = 1;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
        #10;
        expired = 1;
        #10;
        expired = 0;
    end
    initial begin 
        clk=0;
        forever begin
            #5 clk = ~clk;
        end 
    end
endmodule
