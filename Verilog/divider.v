`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: divider
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


module divider(
    input clk,
    input reset_sync,
    output reg enable
    );
    
    reg[0:25] count = 0;
    reg temp = 0;
    
    always@(posedge clk, posedge reset_sync) begin
        if (reset_sync) begin
            count = 1;
            temp = 0;
            enable = 1;
        end
        else begin
            if (count == 50_000_000) begin
                if (temp) begin
                    enable = 1;
                end else begin
                    enable = 0;
                end
                temp = ~temp;
                enable = temp;
                count = 1;
            end
            else begin
                if (temp) begin
                    enable = 1;
                end else begin
                    enable = 0;
                end
                count = count + 1;
            end
        end
    end
    
endmodule
