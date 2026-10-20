`timescale 1ns/1ps

module moving_average_tb();


reg clk;
reg [7:0] signal_strength;
wire [7:0] average;


moving_average dut(
    .clk(clk),
    .signal_strength(signal_strength),
    .average(average)
);

initial clk = 1'b0;

always #5 clk = ~clk;

initial
    begin
        signal_strength = 8'd40;

        #8;
        signal_strength = 8'd60;
        #10;
        signal_strength = 8'd80;
        #10;
        signal_strength = 8'd100;

        #12;

        if(average === 8'd70)
        begin
            $display("PASS: Average = 70");
        end
        else
            begin
                $display("FAIL: Incorrect average");
            end

        signal_strength = 8'd200;
        #8;

        if(average === 8'd110)
            begin
                $display("PASS: Average = 110");
            end
        else
            begin
                $display("FAIL: Incorrect average");
            end


    $finish;
    end



endmodule