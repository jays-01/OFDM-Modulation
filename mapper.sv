module qam16_mapper (
    input  [3:0] bits_in,
    output reg [15:0] bits_out_re,
    output reg [15:0] bits_out_im
);


always @(*) begin
    case (bits_in[3:2])
        2'b00 : bits_out_re <= 16'b1111111111111101;
        2'b01 : bits_out_re <= 16'b1111111111111111;
        2'b11 : bits_out_re <= 16'b0000000000000001;
        2'b10 : bits_out_re <= 16'b0000000000000011;
    endcase

    case (bits_in[1:0])
        2'b00 : bits_out_im <= 16'b1111111111111101;
        2'b01 : bits_out_im <= 16'b1111111111111111;
        2'b11 : bits_out_im <= 16'b0000000000000001;
        2'b10 : bits_out_im <= 16'b0000000000000011;
    endcase
end
   
endmodule