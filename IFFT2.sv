module IFFT2 #(
    parameter DATA_WIDTH = 16,
    parameter DATA_WIDTH_I = 3,
    parameter DATA_WIDTH_F = 12,
    parameter OUTPUT_WIDTH = DATA_WIDTH
)(
    input clk,
    input reset,
    input reg signed  [DATA_WIDTH-1:0] X_0_re,
    input reg signed  [DATA_WIDTH-1:0] X_0_im,
    input reg signed  [DATA_WIDTH-1:0] X_1_re,
    input reg signed  [DATA_WIDTH-1:0] X_1_im,
    input reg signed  [DATA_WIDTH-1:0] twiddle_re,
    input reg signed  [DATA_WIDTH-1:0] twiddle_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_0_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_1_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_0_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_1_im
);

    reg signed [DATA_WIDTH-1:0] Y_0_re_temp;
    reg signed [DATA_WIDTH-1:0] Y_0_im_temp;
    reg signed [DATA_WIDTH-1:0] Y_1_re_temp;
    reg signed [DATA_WIDTH-1:0] Y_1_im_temp;

    assign Y_0_re_temp = X_0_re + X_1_re;
    assign Y_0_im_temp = X_0_im + X_1_im;

    complex_multiplier instance_1 (
        .real_a(X_0_re - X_1_re),
        .real_b(twiddle_re),
        .imag_a(X_0_im - X_1_im),
        .imag_b(twiddle_im),
        .real_result(Y_1_re_temp),
        .imag_result(Y_1_im_temp)
    );

    

    always @(posedge clk) begin

        if(reset) begin
            Y_0_re = 0;
            Y_0_im = 0;
            Y_1_re = 0;
            Y_1_im = 0;
        end

        else begin
            Y_0_re = Y_0_re_temp;
            Y_0_im = Y_0_im_temp;
            Y_1_re = Y_1_re_temp;
            Y_1_im = Y_1_im_temp;
        end
    end 
   
endmodule