module sample_storage(
    input wire clk,
    input wire [7:0] signal_strength,
    output reg [7:0] stored_strength
);

always @(posedge clk)
begin
    stored_strength <= signal_strength;
end

endmodule