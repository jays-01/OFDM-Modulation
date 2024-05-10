module modulator_tb;

    // Parameters
    parameter INPUT_WIDTH = 4;
    parameter OUTPUT_WIDTH = 16;
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk = 0;
    reg reset = 1;
    reg [8*INPUT_WIDTH-1:0] data_in = 0;
    wire signed [OUTPUT_WIDTH-1:0] Y_0_re, Y_0_im, Y_1_re, Y_1_im;
    wire signed [OUTPUT_WIDTH-1:0] Y_2_re, Y_2_im, Y_3_re, Y_3_im;
    wire signed [OUTPUT_WIDTH-1:0] Y_4_re, Y_4_im, Y_5_re, Y_5_im;
    wire signed [OUTPUT_WIDTH-1:0] Y_6_re, Y_6_im, Y_7_re, Y_7_im;

    // Instantiate the modulator module
    modulator #(
        .INPUT_WIDTH(INPUT_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) modulator_inst (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .Y_0_re(Y_0_re), .Y_0_im(Y_0_im),
        .Y_1_re(Y_1_re), .Y_1_im(Y_1_im),
        .Y_2_re(Y_2_re), .Y_2_im(Y_2_im),
        .Y_3_re(Y_3_re), .Y_3_im(Y_3_im),
        .Y_4_re(Y_4_re), .Y_4_im(Y_4_im),
        .Y_5_re(Y_5_re), .Y_5_im(Y_5_im),
        .Y_6_re(Y_6_re), .Y_6_im(Y_6_im),
        .Y_7_re(Y_7_re), .Y_7_im(Y_7_im)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Stimulus
    initial begin
        // Reset
        reset = 1;
        #100;
        reset = 0;
        
        // Wait for reset to complete
        #100;

        // Apply data
        data_in = 16'hABCD; // Example data
        #100; // Wait for a while
        
        // Display results
        $display("Y_0_re = %d, Y_0_im = %d", Y_0_re, Y_0_im);
        $display("Y_1_re = %d, Y_1_im = %d", Y_1_re, Y_1_im);
        $display("Y_2_re = %d, Y_2_im = %d", Y_2_re, Y_2_im);
        $display("Y_3_re = %d, Y_3_im = %d", Y_3_re, Y_3_im);
        $display("Y_4_re = %d, Y_4_im = %d", Y_4_re, Y_4_im);
        $display("Y_5_re = %d, Y_5_im = %d", Y_5_re, Y_5_im);
        $display("Y_6_re = %d, Y_6_im = %d", Y_6_re, Y_6_im);
        $display("Y_7_re = %d, Y_7_im = %d", Y_7_re, Y_7_im);
        
        // End simulation
        $finish;
    end

endmodule
