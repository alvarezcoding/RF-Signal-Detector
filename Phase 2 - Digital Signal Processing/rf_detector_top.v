module rf_detector_top(
    input wire clk,
    input wire [7:0] signal_strength,
    output wire detected
);

wire [7:0] smoothed_signal;

moving_average filter_instance(
    .clk(clk),
    .signal_strength(signal_strength),
    .average(smoothed_signal)
);

signal_detector detector_instance(
    .signal_strength(smoothed_signal),
    .detected(detected)
);



endmodule