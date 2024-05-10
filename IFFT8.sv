module IFFT8 #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = INPUT_WIDTH
) (
    input clk,
    input reset,

    input  signed [INPUT_WIDTH-1:0] X_0_re,
    input  signed [INPUT_WIDTH-1:0] X_0_im,
    input  signed [INPUT_WIDTH-1:0] X_1_re,
    input  signed [INPUT_WIDTH-1:0] X_1_im,
    input  signed [INPUT_WIDTH-1:0] X_2_re,
    input  signed [INPUT_WIDTH-1:0] X_2_im,
    input  signed [INPUT_WIDTH-1:0] X_3_re,
    input  signed [INPUT_WIDTH-1:0] X_3_im,
    input  signed [INPUT_WIDTH-1:0] X_4_re,
    input  signed [INPUT_WIDTH-1:0] X_4_im,
    input  signed [INPUT_WIDTH-1:0] X_5_re,
    input  signed [INPUT_WIDTH-1:0] X_5_im,
    input  signed [INPUT_WIDTH-1:0] X_6_re,
    input  signed [INPUT_WIDTH-1:0] X_6_im,
    input  signed [INPUT_WIDTH-1:0] X_7_re,
    input  signed [INPUT_WIDTH-1:0] X_7_im,

    output reg signed [OUTPUT_WIDTH-1:0] Y_0_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_0_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_1_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_1_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_2_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_2_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_3_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_3_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_4_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_4_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_5_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_5_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_6_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_6_im,
    output reg signed [OUTPUT_WIDTH-1:0] Y_7_re,
    output reg signed [OUTPUT_WIDTH-1:0] Y_7_im
);

    wire signed [INPUT_WIDTH-1:0] stage_1_re [0:7];
    wire signed [INPUT_WIDTH-1:0] stage_1_im [0:7];
    wire signed [INPUT_WIDTH-1:0] stage_2_re [0:7];
    wire signed [INPUT_WIDTH-1:0] stage_2_im [0:7];
    reg signed [INPUT_WIDTH-1:0] stage_3_re [0:7];
    reg signed [INPUT_WIDTH-1:0] stage_3_im [0:7];
    reg signed [INPUT_WIDTH-1:0] twiddle_re [0:7];
    reg signed [INPUT_WIDTH-1:0] twiddle_im [0:7];

    initial begin
        $readmemb("/home/jaysoni/Desktop/OFDM/MATLAB/twiddle_img.txt", twiddle_im);
        $readmemb("/home/jaysoni/Desktop/OFDM/MATLAB/twiddle_real.txt",twiddle_re);
    end


    // STAGE 1 COMPUTATIONS

    IFFT2 stage_1_instance_1 (

        .clk(clk),
        .reset(reset),
        
        .X_0_re(X_0_re),
        .X_0_im(X_0_im),
        .X_1_re(X_4_re),
        .X_1_im(X_4_im),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_1_re[0]),
        .Y_0_im(stage_1_im[0]),
        .Y_1_re(stage_1_re[4]),
        .Y_1_im(stage_1_im[4])

    );

    IFFT2 stage_1_instance_2(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(X_1_re),
        .X_0_im(X_1_im),
        .X_1_re(X_5_re),
        .X_1_im(X_5_im),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_1_re[1]),
        .Y_0_im(stage_1_im[1]),
        .Y_1_re(stage_1_re[5]),
        .Y_1_im(stage_1_im[5])
    );

    IFFT2 stage_1_instance_3(

        .clk(clk),
        .reset(reset),
        
        .X_0_re(X_2_re),
        .X_0_im(X_2_im),
        .X_1_re(X_6_re),
        .X_1_im(X_6_im),
        .twiddle_re(twiddle_re[2]),
        .twiddle_im(twiddle_im[2]),
        .Y_0_re(stage_1_re[2]),
        .Y_0_im(stage_1_im[2]),
        .Y_1_re(stage_1_re[6]),
        .Y_1_im(stage_1_im[6])
    );

    IFFT2 stage_1_instance_4(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(X_3_re),
        .X_0_im(X_3_im),
        .X_1_re(X_7_re),
        .X_1_im(X_7_im),
        .twiddle_re(twiddle_re[2]),
        .twiddle_im(twiddle_im[2]),
        .Y_0_re(stage_1_re[3]),
        .Y_0_im(stage_1_im[3]),
        .Y_1_re(stage_1_re[7]),
        .Y_1_im(stage_1_im[7])
    );


    //STAGE 2 COMPUTATIONS

    IFFT2 stage_2_instance_1 (
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_1_re[0]),
        .X_0_im(stage_1_im[0]),
        .X_1_re(stage_1_re[2]),
        .X_1_im(stage_1_im[2]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_2_re[0]),
        .Y_0_im(stage_2_im[0]),
        .Y_1_re(stage_2_re[2]),
        .Y_1_im(stage_2_im[2])
    );

    IFFT2 stage_2_instance_2(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_1_re[1]),
        .X_0_im(stage_1_im[1]),
        .X_1_re(stage_1_re[3]),
        .X_1_im(stage_1_im[3]),
        .twiddle_re(twiddle_re[2]),
        .twiddle_im(twiddle_im[2]),
        .Y_0_re(stage_2_re[1]),
        .Y_0_im(stage_2_im[1]),
        .Y_1_re(stage_2_re[3]),
        .Y_1_im(stage_2_im[3])
    );

    IFFT2 stage_2_instance_3(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_1_re[4]),
        .X_0_im(stage_1_im[4]),
        .X_1_re(stage_1_re[6]),
        .X_1_im(stage_1_im[6]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_2_re[4]),
        .Y_0_im(stage_2_im[4]),
        .Y_1_re(stage_2_re[6]),
        .Y_1_im(stage_2_im[6])
    );

    IFFT2 stage_2_instance_4(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_1_re[5]),
        .X_0_im(stage_1_im[5]),
        .X_1_re(stage_1_re[7]),
        .X_1_im(stage_1_im[7]),
        .twiddle_re(twiddle_re[2]),
        .twiddle_im(twiddle_im[2]),
        .Y_0_re(stage_2_re[5]),
        .Y_0_im(stage_2_im[5]),
        .Y_1_re(stage_2_re[7]),
        .Y_1_im(stage_2_im[7])
    );

    //STGE 3 COMPUTATIONS

    IFFT2 stage_3_instance_1 (
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_2_re[0]),
        .X_0_im(stage_2_im[0]),
        .X_1_re(stage_2_re[1]),
        .X_1_im(stage_2_im[1]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_3_re[0]),
        .Y_0_im(stage_3_im[0]),
        .Y_1_re(stage_3_re[1]),
        .Y_1_im(stage_3_im[1])
    );

    IFFT2 stage_3_instance_2(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_2_re[2]),
        .X_0_im(stage_2_im[2]),
        .X_1_re(stage_2_re[3]),
        .X_1_im(stage_2_im[3]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_3_re[2]),
        .Y_0_im(stage_3_im[2]),
        .Y_1_re(stage_3_re[3]),
        .Y_1_im(stage_3_im[3])
    );

    IFFT2 stage_3_instance_3(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_2_re[4]),
        .X_0_im(stage_2_im[4]),
        .X_1_re(stage_2_re[5]),
        .X_1_im(stage_2_im[5]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_3_re[4]),
        .Y_0_im(stage_3_im[4]),
        .Y_1_re(stage_3_re[5]),
        .Y_1_im(stage_3_im[5])
    );

    IFFT2 stage_3_instance_4(
        .clk(clk),
        .reset(reset),
        
        .X_0_re(stage_2_re[6]),
        .X_0_im(stage_2_im[6]),
        .X_1_re(stage_2_re[7]),
        .X_1_im(stage_2_im[7]),
        .twiddle_re(twiddle_re[0]),
        .twiddle_im(twiddle_im[0]),
        .Y_0_re(stage_3_re[6]),
        .Y_0_im(stage_3_im[6]),
        .Y_1_re(stage_3_re[7]),
        .Y_1_im(stage_3_im[7])
    );


    assign Y_0_re = stage_3_re[0]>>3;
    assign Y_0_im = stage_3_re[0]>>3;
    assign Y_1_re = stage_3_re[4]>>3;
    assign Y_1_im = stage_3_re[4]>>3;
    assign Y_2_re = stage_3_re[2]>>3;
    assign Y_2_im = stage_3_re[2]>>3;
    assign Y_3_re = stage_3_re[6]>>3;
    assign Y_3_im = stage_3_re[6]>>3;
    assign Y_4_re = stage_3_re[1]>>3;
    assign Y_4_im = stage_3_re[1]>>3;
    assign Y_5_re = stage_3_re[5]>>3;
    assign Y_5_im = stage_3_re[5]>>3;
    assign Y_6_re = stage_3_re[3]>>3;
    assign Y_6_im = stage_3_re[3]>>3;
    assign Y_7_re = stage_3_re[7]>>3;
    assign Y_7_im = stage_3_re[7]>>3;

endmodule






