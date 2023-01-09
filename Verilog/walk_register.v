`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: walk_register
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


module walk_register(
    input wr_sync,
    input wr_reset,
    output reg wr
    );
    
    always@(posedge wr_sync, posedge wr_reset) begin
        
        if (wr_sync) begin
            wr = 1;
        end
        else begin
            if (wr_reset) begin
                wr = 0;
            end
        end
    end
    
endmodule
