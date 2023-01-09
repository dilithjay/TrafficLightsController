`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: time_parameters
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


module time_parameters(
    input [1:0] tp_sel,
    input [3:0] t_val,
    input prog_sync,
    input reset_sync,
    input clk,
    input [1:0] interval,
    output reg [3:0] tp_val
    );
    
    reg [3:0] t_b = 4'b0110, t_e = 4'b0011, t_y = 4'b0010;
    
    always@(posedge clk, posedge reset_sync) begin
        if (reset_sync) begin
            t_b = 4'b0110;
            t_e = 4'b0011;
            t_y = 4'b0010;
            tp_val = 4'b0110;
        end
        else begin
            if (interval == 2'b00) begin
                tp_val = t_b;
            end
            else if (interval == 2'b01) begin
                tp_val = t_e;
            end
            else if (interval == 2'b10) begin
                tp_val = t_y;
            end
            
            if (prog_sync) begin
                if (tp_sel == 2'b00) begin
                    t_b = t_val;
                end
                else if (tp_sel == 2'b01) begin
                    t_e = t_val;
                end
                else if (tp_sel == 2'b10) begin
                    t_y = t_val;
                end
            end
        end
    end
    
endmodule
