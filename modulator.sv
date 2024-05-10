module modulator #(
    parameter INPUT_WIDTH = 4,
    parameter OUTPUT_WIDTH = 16
)(
    input clk,
    input reset,

    input [8*INPUT_WIDTH-1:0] data_in,

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

    wire signed [15:0] constellation_re [0:7];
    wire signed [15:0] constellation_im [0:7];


    qam16_mapper instance_0(
        
        .bits_in(data_in[31:28]),
        .bits_out_re(constellation_re[0]),
        .bits_out_im(constellation_im[0])
    );

    qam16_mapper instance_1(
        .bits_in(data_in[27:24]),
        .bits_out_re(constellation_re[1]),
        .bits_out_im(constellation_im[1])
    );

    qam16_mapper instance_2(
        
        .bits_in(data_in[22:19]),
        .bits_out_re(constellation_re[2]),
        .bits_out_im(constellation_im[2])
    );

    qam16_mapper instance_3(
        
        .bits_in(data_in[18:15]),
        .bits_out_re(constellation_re[3]),
        .bits_out_im(constellation_im[3])
    );

    qam16_mapper instance_4(
        
        .bits_in(data_in[14:11]),
        .bits_out_re(constellation_re[4]),
        .bits_out_im(constellation_im[4])
    );

    qam16_mapper instance_5(
        
        .bits_in(data_in[10:7]),
        .bits_out_re(constellation_re[5]),
        .bits_out_im(constellation_im[5])
    );

    qam16_mapper instance_6(
        
        .bits_in(data_in[6:3]),
        .bits_out_re(constellation_re[6]),
        .bits_out_im(constellation_im[6])
    );

    qam16_mapper instance_7(
        
        .bits_in(data_in[3:0]),
        .bits_out_re(constellation_re[7]),
        .bits_out_im(constellation_im[7])
    );


    IFFT8 ifft8(

    
    .reset(reset),
    .clk(clk),
    .X_0_re(constellation_re[0]),
    .X_0_im(constellation_im[0]),
    .X_1_re(constellation_re[1]),
    .X_1_im(constellation_im[1]),
    .X_2_re(constellation_re[2]),
    .X_2_im(constellation_im[2]),
    .X_3_re(constellation_re[3]),
    .X_3_im(constellation_im[3]),
    .X_4_re(constellation_re[4]),
    .X_4_im(constellation_im[4]),
    .X_5_re(constellation_re[5]),
    .X_5_im(constellation_im[5]),
    .X_6_re(constellation_re[6]),
    .X_6_im(constellation_im[6]),
    .X_7_re(constellation_re[7]),
    .X_7_im(constellation_im[7]),

    .Y_0_re(Y_0_re),
    .Y_0_im(Y_0_im),
    .Y_1_re(Y_1_re),
    .Y_1_im(Y_1_im),
    .Y_2_re(Y_2_re),
    .Y_2_im(Y_2_im),
    .Y_3_re(Y_3_re),
    .Y_3_im(Y_3_im),
    .Y_4_re(Y_4_re),
    .Y_4_im(Y_4_im),
    .Y_5_re(Y_5_re),
    .Y_5_im(Y_5_im),
    .Y_6_re(Y_6_re),
    .Y_6_im(Y_6_im),
    .Y_7_re(Y_7_re),
    .Y_7_im(Y_7_im)
    );

endmodule