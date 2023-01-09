`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input reset,
    input sensor,
    input walk,
    input reprogram,
    input clk,
    input [1:0] tp_sel,
    input [3:0] t_val,
    output [6:0] leds
    );
    
    wire reset_sync, sensor_sync, wr_sync, prog_sync, wr, wr_reset, start_t,
        expired, enable;
    wire [1:0] interval;
    wire [3:0] tp_val;
        
    synchronizer synchronizer_1 (
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
            
    walk_register walk_register_1 (
        .wr_sync(wr_sync),
        .wr_reset(wr_reset),
        .wr(wr)
    );
    
    divider divider_1 (
        .clk(clk),
        .reset_sync(reset_sync), 
        .enable(enable)
    );
            
    time_parameters time_parameters_1 (
        .tp_sel(tp_sel),
        .t_val(t_val),
        .prog_sync(prog_sync),
        .reset_sync(reset_sync),
        .clk(clk),
        .interval(interval),
        .tp_val(tp_val)
    );
    
    timer timer_1 (
        .tp_val(tp_val),
        .enable(enable),
        .start_t(start_t),
        .reset_sync(reset_sync),
        .clk(clk),
        .expired(expired)
    );
            
    fsm fsm_1 (
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
    
endmodule
