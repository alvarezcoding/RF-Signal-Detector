`timescale 1ns/1ps

module moving_average_tb();


reg clk;
reg signal_strength;
wire average;


moving_average dut(
    .clk(clk),
    .signal_strength(signal_strength),
    .average(average)
);


initial
    begin
        signal_strength = 8'd40;

        

    $finish
    end



endmodule