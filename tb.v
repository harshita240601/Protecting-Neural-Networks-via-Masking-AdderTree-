`timescale 1ns / 1ps

module tb;
    parameter INPUT_SIZE = 10;
    parameter HIDDEN_SIZE = 10;
    parameter OUTPUT_SIZE = 5;
    parameter WIDTH = 16;
    
    reg [WIDTH-1:0] inputs [INPUT_SIZE-1:0];
    
    reg [WIDTH-1:0] w11 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w12 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w13 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w14 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w15 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w16 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w17 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w18 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w19 [INPUT_SIZE-1:0];
    reg [WIDTH-1:0] w110 [INPUT_SIZE-1:0];
    
    reg [WIDTH-1:0] w21 [HIDDEN_SIZE-1:0];
    reg [WIDTH-1:0] w22 [HIDDEN_SIZE-1:0];
    reg [WIDTH-1:0] w23 [HIDDEN_SIZE-1:0];
    reg [WIDTH-1:0] w24 [HIDDEN_SIZE-1:0];
    reg [WIDTH-1:0] w25 [HIDDEN_SIZE-1:0];
    
    reg [WIDTH-1:0] b1 [HIDDEN_SIZE-1:0];
    reg [WIDTH-1:0] b2 [OUTPUT_SIZE-1:0];
    
    wire [WIDTH-1:0] outputs [OUTPUT_SIZE-1:0];
    
    neural_network #(
        INPUT_SIZE, 
        HIDDEN_SIZE, 
        OUTPUT_SIZE, 
        WIDTH)
            uut (
            .inputs(inputs),
            .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15), .w16(w16), .w17(w17), .w18(w18), .w19(w19), .w110(w110),
            .w21(w21), .w22(w22), .w23(w23), .w24(w24), .w25(w25),
            .b1(b1), .b2(b2),
            .outputs(outputs)
            );
    
    initial begin
        integer i;
        
       
        for (i = 0; i < INPUT_SIZE; i = i + 1) begin
            inputs[i] = 16'b0000000000001010; 
        end
        
        for (i = 0; i < INPUT_SIZE; i = i + 1) begin
            w11[i] = 16'b0000000000000011;
            w12[i] = 16'b0000000000000100;
            w13[i] = 16'b0000000000000101;
            w14[i] = 16'b0000000000000110;
            w15[i] = 16'b0000000000000111;
            w16[i] = 16'b0000000000001000;
            w17[i] = 16'b0000000000001001;
            w18[i] = 16'b0000000000001010;
            w19[i] = 16'b0000000000001011;
            w110[i] = 16'b0000000000001100;
        end
        
        
        for (i = 0; i < HIDDEN_SIZE; i = i + 1) begin
            w21[i] = 16'b0000000000001101;
            w22[i] = 16'b0000000000001110;
            w23[i] = 16'b0000000000001111;
            w24[i] = 16'b0000000000010000;
            w25[i] = 16'b0000000000010001;
        end
        
      
        for (i = 0; i < HIDDEN_SIZE; i = i + 1) begin
            b1[i] = 16'b0000000000000001;
        end
        for (i = 0; i < OUTPUT_SIZE; i = i + 1) begin
            b2[i] = 16'b0000000000000010;
        end
        
        
        #10;
        
        
        $display("Outputs:");
        for (i = 0; i < OUTPUT_SIZE; i = i + 1) begin
            $display("Output[%0d] = %b", i, outputs[i]);
        end
        
        $stop;
    end
    
endmodule
