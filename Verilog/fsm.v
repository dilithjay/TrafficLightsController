`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 09:10:20 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input wr,
    input sensor_sync,
    input prog_sync,
    input expired,
    input reset_sync,
    input clk,
    output reg [6:0] leds,
    output reg [1:0] interval,
    output reg start_t,
    output reg wr_reset
    );
    
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6;
    reg [2:0] state = A;
    
    always@(posedge clk) begin
        // Reset variable if either reprogrammed or reset
        if (prog_sync | reset_sync) begin
            state = A;
            leds = 7'b1000010;
            interval = 2'b00;
            start_t = 1;
            wr_reset = 1;
        end
        else begin
            start_t = 0;
            wr_reset = 0;
            if (expired) begin
                case (state)
                    A: begin
                        if (sensor_sync) begin
                            interval = 2'b01;
                        end
                        state = B;
                    end
                    
                    B: begin
                       leds = 7'b0100010;
                       interval = 2'b10;
                       state = C;
                    end
                    
                    C: begin
                        if (wr) begin
                           leds = 7'b0010011;
                           interval = 2'b01;
                           wr_reset = 1;
                           state = D;
                        end
                        else begin
                           leds = 7'b0011000;
                           interval = 2'b00;
                           state = E;
                        end
                    end
                    
                    D: begin
                        leds = 7'b0011000;
                        interval = 2'b00;
                        wr_reset = 0;
                        state = E;
                    end
                    
                    E: begin
                        if (sensor_sync) begin
                            leds = 7'b0011000;
                            interval = 2'b01;
                            state = F;
                        end
                        else begin
                            leds = 7'b0010100;
                            interval = 2'b10;
                            state = G;
                        end
                    end
                    
                    F: begin
                        leds = 7'b0010100;
                        interval = 2'b10;
                        state = G;
                    end
                    
                    G: begin
                        leds = 7'b1000010;
                        interval = 2'b00;
                        state = A;
                    end
                    
                    default: begin
                        leds = 7'b1000010;
                        interval = 2'b00;
                        state = A;
                    end
                endcase
                start_t = 1;
            end
        end
    end
    
endmodule