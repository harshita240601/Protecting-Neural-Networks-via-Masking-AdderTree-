module NN #(
    parameter INPUT_SIZE = 10,
    parameter HIDDEN_SIZE = 10,
    parameter OUTPUT_SIZE = 5,
    parameter WIDTH = 16
)(
    input reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0],

    input reg [WIDTH-1:0] w11 [INPUT_SIZE-1:0], 
    input reg [WIDTH-1:0] w12 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w13 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w14 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w15 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w16 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w17 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w18 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w19 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w110 [INPUT_SIZE-1:0],

    input reg [WIDTH-1:0] w21 [HIDDEN_SIZE-1:0], 
    input reg [WIDTH-1:0] w22 [HIDDEN_SIZE-1:0], 
    input reg [WIDTH-1:0] w23 [HIDDEN_SIZE-1:0], 
    input reg [WIDTH-1:0] w24 [HIDDEN_SIZE-1:0], 
    input reg [WIDTH-1:0] w25 [HIDDEN_SIZE-1:0], 

    input reg  [WIDTH-1:0] b1 [HIDDEN_SIZE-1:0],
    input reg  [WIDTH-1:0] b2 [OUTPUT_SIZE-1:0],

    output reg [WIDTH-1:0] outputs [OUTPUT_SIZE-1:0]
);
    reg [WIDTH-1:0] hidden_layer [HIDDEN_SIZE-1:0];
    
    genvar i, j;

    
    layer1 #(
        .INPUT_SIZE(INPUT_SIZE),
        .WIDTH(WIDTH),
        .OUTPUT_SIZE(HIDDEN_SIZE)
    ) l1(
        .b(b1),
        .w1(w11),
        .w2(w12),
        .w3(w13),
        .w4(w14),
        .w5(w15),
        .w6(w16),
        .w7(w17),
        .w8(w18),
        .w9(w19),
        .w10(w110),
        .inputs(inputs),
        .outputs(hidden_layer)
    );

    layer2 #(
        .INPUT_SIZE(HIDDEN_SIZE),
        .WIDTH(WIDTH),
        .OUTPUT_SIZE(OUTPUT_SIZE)
    )l2(
        .b(b2),
        .w1(w21),
        .w2(w22),
        .w3(w23),
        .w4(w24),
        .w5(w25),
        .inputs(hidden_layer),
        .outputs(outputs)
    );
    
endmodule
