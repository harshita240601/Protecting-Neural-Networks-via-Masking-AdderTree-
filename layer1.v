module layer #(
    parameter INPUT_SIZE = 10,
    parameter OUTPUT_SIZE = 10,
    parameter WIDTH = 16
)(
    input reg [WIDTH-1:0] b [OUTPUT_SIZE-1:0],

    input reg [WIDTH-1:0] w1 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w2 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w3 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w4 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w5 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w6 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w7 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w8 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w9 [INPUT_SIZE-1:0],
    input reg [WIDTH-1:0] w10 [INPUT_SIZE-1:0],

    input reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0],
    output reg [WIDTH-1:0] outputs [OUTPUT_SIZE-1:0]

);

