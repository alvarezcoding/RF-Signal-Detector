`timescale 1ns/1ps

module signal_detector_tb;

    reg [7:0] signal_strength;

    wire detected;


    signal_detector dut(
        .signal_strength(signal_strength),
        .detected(detected)
    );

    
    initial begin
        $monitor("Signal = %d, Detected = %b", signal_strength, detected);

        signal_strength = 8'd25;
        #10;
        if(detected === 1'b0)
            $display("PASS: Input 25");
        else
            $display("FAIL: Input 25");

        signal_strength = 8'd100;
        #10;
        if(detected === 1'b1)
            $display("PASS: Input 100");
        else
            $display("FAIL: Input 100");

        signal_strength = 8'd175;
        #10;
        if(detected === 1'b1)
            $display("PASS: Input 175");
        else
            $display("FAIL: Input 175");

        signal_strength = 8'd99;
        #10;
        if(detected === 1'b0)
            $display("PASS: Input 99");
        else
            $display("FAIL: Input 99");

        signal_strength = 8'd101;
        #10;
        if(detected === 1'b1)
            $display("PASS: Input 101");
        else
            $display("FAIL: Input 101");

        signal_strength = 8'd255;
        #10;
        if(detected === 1'b1)
            $display("PASS: Input 255");
        else
            $display("FAIL: Input 255");
        
        signal_strength = 8'd0;
        #10;
        if(detected === 1'b0)
            $display("PASS: Input 0");
        else
            $display("FAIL: Input 0");

        $finish;
    end



endmodule