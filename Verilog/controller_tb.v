`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 10:01:34 PM
// Design Name: 
// Module Name: controller_tb
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


module controller_tb;

    reg reset;
    reg sensor;
    reg walk;
    reg reprogram;
    reg clk;
    reg [1:0] tp_sel;
    reg [3:0] t_val;
    wire [6:0] leds;

    controller uut (
        .reset(reset),
        .sensor(sensor),
        .walk(walk),
        .reprogram(reprogram),
        .clk(clk),
        .tp_sel(tp_sel),
        .t_val(t_val),
        .leds(leds)
    );
    
    initial begin
        reset = 1;
        sensor = 0;
        reprogram = 0;
        tp_sel = 2'b00;
        t_val = 4'b0000;
        walk = 0;
        #30
        reset = 0;
        walk = 1;
        #50
        walk = 0;
        #2000
        walk = 1;
        #50
        walk = 0;
        #200
        sensor = 1;
    end
    
    initial begin
        clk=0;
        forever begin
            #5
            clk = ~clk;
        end 
    end

endmodule
