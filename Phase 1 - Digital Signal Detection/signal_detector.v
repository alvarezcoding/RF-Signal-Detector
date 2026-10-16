module signal_detector(

    input wire [7:0] signal_strength,
    output wire detected
);

    assign detected = (signal_strength >= 8'd100);

endmodule