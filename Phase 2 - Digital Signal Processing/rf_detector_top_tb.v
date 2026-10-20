`timescale 1ns/1ps

module rf_detector_top_tb();

    reg clk;

    reg [7:0] signal_strength;

    wire detected;

    rf_detector_top dut(
        .clk(clk),
        .signal_strength(signal_strength),
        .detected(detected)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial
    begin
        signal_strength = 8'd120;
        #40;
        
        if(detected === 1'b1)
        begin
            $display("PASS: Signal Detected");
        end
        else
        begin
            $display("FAIL: Signal not detected");
        end

        signal_strength = 8'd50;
        #40;
        
        if(detected === 1'b0)
        begin
            $display("PASS: No signal detected");
        end
        else
        begin
            $display("FAIL: False detection");
        end


    $finish;
    end

endmodule