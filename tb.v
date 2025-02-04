module tb_neural_network;

    // Parameters
    parameter INPUT_SIZE = 10;
    parameter HIDDEN_SIZE = 10;
    parameter OUTPUT_SIZE = 5;
    parameter WIDTH = 16;

    // Inputs
    reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] weights1 [HIDDEN_SIZE-1:0][INPUT_SIZE-1:0];
    reg [WIDTH-1:0] weights2 [OUTPUT_SIZE-1:0][HIDDEN_SIZE-1:0];

    // Outputs
    wire [WIDTH-1:0] outputs [OUTPUT_SIZE-1:0];

    // Instantiate the Neural Network
    neural_network #(
        .INPUT_SIZE(INPUT_SIZE),
        .HIDDEN_SIZE(HIDDEN_SIZE),
        .OUTPUT_SIZE(OUTPUT_SIZE),
        .WIDTH(WIDTH)
    ) uut (
        .inputs(inputs),
        .weights1(weights1),
        .weights2(weights2),
        .outputs(outputs)
    );

    integer i, j, k;

    initial begin
        // Initialize inputs and weights
        for (i = 0; i < INPUT_SIZE; i = i + 1) begin
            inputs[i] = i + 1; // Assign some example values
        end

        for (j = 0; j < HIDDEN_SIZE; j = j + 1) begin
            for (k = 0; k < INPUT_SIZE; k = k + 1) begin
                weights1[j][k] = k + 1; // Assign example weights
            end
        end

        for (j = 0; j < OUTPUT_SIZE; j = j + 1) begin
            for (k = 0; k < HIDDEN_SIZE; k = k + 1) begin
                weights2[j][k] = k + 1; // Assign example weights
            end
        end

        // Wait for computation to complete
        #10;

        // Display outputs
        $display("Outputs:");
        for (i = 0; i < OUTPUT_SIZE; i = i + 1) begin
            $display("Output[%0d] = %0d", i, outputs[i]);
        end

        $stop;
    end
endmodule