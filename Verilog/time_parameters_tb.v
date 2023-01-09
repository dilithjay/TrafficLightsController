`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 08:14:51 PM
// Design Name: 
// Module Name: time_parameters_tb
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


module time_parameters_tb;

	reg [1:0] tp_sel;
	reg [3:0] t_val;
	reg prog_sync;
	reg reset_sync;
	reg clk;
	reg [1:0] interval;
	wire [3:0] tp_val;
	
	time_parameters uut (
        .tp_sel(tp_sel), 
        .t_val(t_val), 
        .prog_sync(prog_sync),
        .reset_sync(reset_sync),
        .clk(clk),
        .interval(interval),
        .tp_val(tp_val)
    );
    
    initial begin
        tp_sel = 2'b00;
        t_val = 4'b0000;
        prog_sync = 0;
        reset_sync = 0;
        interval = 2'b00;
        
        #30
        t_val = 4'b0010;
        #20
        prog_sync = 1;
        #20
        prog_sync = 0;
        #40
        reset_sync = 1;
        #20
        reset_sync = 0;
    end
    
    initial begin
        clk=0;
        forever begin
            #5
            clk = ~clk;
        end 
    end

endmodule
