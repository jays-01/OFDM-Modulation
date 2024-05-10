module complex_multiplier #(
    parameter DATA_WIDTH = 16,          // Width of input data
    parameter DATA_WIDTH_F = 14,        // Fractional width of input data (assuming fixed-point representation)
    parameter DATA_WIDTH_I = 1,         // Integer width of input data (assuming fixed-point representation)
    parameter OUTPUT_WIDTH = DATA_WIDTH  // Width of output data
)(
    input signed [DATA_WIDTH-1:0] real_a,   // Real part of complex number A
    input signed [DATA_WIDTH-1:0] imag_a,   // Imaginary part of complex number A
    input signed [DATA_WIDTH-1:0] real_b,   // Real part of complex number B
    input signed [DATA_WIDTH-1:0] imag_b,   // Imaginary part of complex number B
    output signed [OUTPUT_WIDTH-1:0] real_result,  // Real part of the result
    output signed [OUTPUT_WIDTH-1:0] imag_result  // Imaginary part of the result
);

// Multiply real and imaginary parts to calculate the real part of the result
assign real_result = real_a * real_b - imag_a * imag_b;

// Multiply real and imaginary parts to calculate the imaginary part of the result
assign imag_result = real_a * imag_b + imag_a * real_b;

endmodule
