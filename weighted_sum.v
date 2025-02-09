module weighted_sum #(
    parameter INPUT_SIZE = 10,
    parameter WIDTH = 16
)(
    input reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] weights [INPUT_SIZE-1:0],
    output reg [WIDTH-1:0] sum
);
    integer i;
    always @(*) begin
        sum = 0;
        for (i = 0; i < INPUT_SIZE; i = i + 1) begin
            sum <= sum + inputs[i] * weights[i];
        end
    end
endmodule
