`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 09:40:41 PM
// Design Name: 
// Module Name: walk_request_tb
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


module walk_request_tb;

    reg wr_sync;
    reg wr_reset;
    wire wr;

    walk_register uut (
        .wr_sync(wr_sync),
        .wr_reset(wr_reset),
        .wr(wr)
    );
    
    initial begin
        wr_sync = 0;
        wr_reset = 0;
        #10 
        wr_sync = 1;
        #10
        wr_sync = 0;
        #20
        wr_reset = 1;
        #10
        wr_reset = 0;
    end

endmodule
