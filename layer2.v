module layer2 #(
    parameter INPUT_SIZE, OUTPUT_SIZE, WIDTH
)(
    input reg [WIDTH-1:0] b [OUTPUT_SIZE-1:0],

    input reg [WIDTH-1:0] w1 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w2 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w3 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w4 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w5 [INPUT_SIZE-1:0],

    input reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0],
    output reg [WIDTH-1:0] outputs [OUTPUT_SIZE-1:0]

);

    wire [WIDTH-1:0] weighted_sums [OUTPUT_SIZE-1:0];
    
    weighted_sum #(.INPUT_SIZE(INPUT_SIZE), .WIDTH(WIDTH)) ws1 (.weights(w1), .inputs(inputs), .sum(weighted_sums[0]));
    weighted_sum #(.INPUT_SIZE(INPUT_SIZE), .WIDTH(WIDTH)) ws2 (.weights(w2), .inputs(inputs), .sum(weighted_sums[1]));
    weighted_sum #(.INPUT_SIZE(INPUT_SIZE), .WIDTH(WIDTH)) ws3 (.weights(w3), .inputs(inputs), .sum(weighted_sums[2]));
    weighted_sum #(.INPUT_SIZE(INPUT_SIZE), .WIDTH(WIDTH)) ws4 (.weights(w4), .inputs(inputs), .sum(weighted_sums[3]));
    weighted_sum #(.INPUT_SIZE(INPUT_SIZE), .WIDTH(WIDTH)) ws5 (.weights(w5), .inputs(inputs), .sum(weighted_sums[4]));
    
    integer j;
    always @(*) begin
        for (j = 0; j < OUTPUT_SIZE; j = j + 1) begin
            outputs[j] = weighted_sums[j] + b[j];
        end
    end
endmodule



    

