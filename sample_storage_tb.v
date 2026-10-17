`timescale 1ns/1ps

module sample_storage_tb();

    reg clk;
    reg [7:0] signal_strength;
    wire [7:0] stored_strength;

    intial clk = 1'b0;

    always #5 clk = ~clk;

    sample_storage dut(
        .clk(clk),
        .signal_strength(signal_strength),
        .stored_strength(stored_strength)
    );

    initial
        begin
            
        end

endmodule