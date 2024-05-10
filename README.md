# OFDM Modulator

This repository contains Verilog code for an OFDM (Orthogonal Frequency Division Multiplexing) modulator designed using FPGA (Field Programmable Gate Array) hardware description language.

## Description

OFDM is a widely used modulation technique in modern communication systems, particularly in wireless networks such as Wi-Fi, LTE, and digital television. This modulator is designed to take input data and perform the following steps:

1. **QAM Mapping**: Maps input data bits to symbols in a QAM (Quadrature Amplitude Modulation) constellation.
2. **IFFT (Inverse Fast Fourier Transform)**: Converts the QAM symbols into time-domain signals using an IFFT operation.

The design is parameterized to allow customization of input and output data widths, QAM constellation sizes, and other parameters, providing flexibility for various applications.


## Usage

To use this modulator in your project:

1. Clone this repository to your local machine.
2. Customize the parameters in the Verilog modules (`module_name.v`) as needed for your application.
3. Instantiate the modulator modules in your design and connect them according to your system requirements.
4. Simulate the design using the provided testbench in the `sim/` directory to verify functionality.
5. Synthesize the design using your FPGA synthesis toolchain and program it onto your target FPGA board.

## Contributing

Contributions to improve this OFDM modulator design are welcome! If you find any issues or have suggestions for enhancements, please open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
