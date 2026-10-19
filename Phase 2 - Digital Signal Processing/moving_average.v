
module moving_average(
    input wire clk,
    input wire [7:0] signal_strength,
    output wire [7:0] average
);

reg [7:0] sample_1;
reg [7:0] sample_2;
reg [7:0] sample_3;
reg [7:0] sample_4;

always @ (posedge clk)
    begin
        sample_1 <= signal_strength;
        sample_2 <= sample_1;
        sample_3 <= sample_2;
        sample_4 <= sample_3;

    end

wire [9:0] sum;

assign sum =
    {2'b00, sample_1} +
    {2'b00, sample_2} +
    {2'b00, sample_3} +
    {2'b00, sample_4};

assign average = sum >> 2;

endmodule