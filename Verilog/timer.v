`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: timer
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


module timer(
    input [3:0] tp_val,
    input enable,
    input start_t,
    input reset_sync,
    input clk,
    output reg expired
    );
    
    reg [3:0] count = 0;
    reg change = 0;
    reg is_reset = 0;
    reg restart_timer = 1;
    reg enable_checked = 0;
    
    always@(posedge clk) begin
    
        if (reset_sync | start_t) begin
            if (restart_timer) begin
                change = 0;
                restart_timer = 0;
                count = 1;
                expired = 0;
                enable_checked = 0;
            end
            if (reset_sync) is_reset = 1;
        end
        else begin
            restart_timer = 1;
                    
            if (!change) begin
                count = tp_val - is_reset;
                change = 1;
                is_reset = 0;
            end
            
            expired = 0;
            if (enable) begin
                if (!enable_checked) begin
                    if (count == 0 & change) begin
                        expired = 1;
                    end
                    if (count > 0) begin
                        count = count - 1;
                    end
                    enable_checked = 1;
                end
            end
            else begin
                enable_checked = 0;
            end
        end
    end
    
endmodule
