
<!--

In this project, the Hamming technique is utilized for the error correction and detection.

It is mainly used in transmitting and recieving of data bits.

Suppose, if the data is sent to receiver by transmitting 0110111 number of bits. But due to some error, the data of 1110111 is received. In such cases, hamming technique is utlized to detect the error and then later to correct it.

In this example, 0th bit was corrupted, the hamming will detect and show the position of the error acquired. Hence, correct it back to 0110111.

The project deals with (7,4) Hamming technique to correct and detect the error.

The data is divided into data bits and parity bits.





## Hamming Encoder
The error detection is acquired by Hamming Encoder technique, 

-->

Here is a description for your GitHub post on the **SEC-SED Hamming Technique using Xilinx Vivado and Artix-7 FPGA**:

---

# SEC-SED Hamming Code Implementation on Artix-7 FPGA

This repository contains the Verilog implementation of a Single Error Correction, Double Error Detection (SEC-SED) Hamming Code. The project is designed to detect and correct single-bit errors, while also identifying double-bit errors in transmitted data. This technique is crucial in digital communication systems and memory error detection/correction for enhancing data reliability.

## Key Features:
- **Error Detection**: Detects both single-bit and double-bit errors in the transmitted data.
- **Error Correction**: Corrects single-bit errors automatically.
- **Double-bit Error Indication**: Alerts the system in case of a double-bit error without attempting correction.
- **FPGA Target**: Implemented on an Artix-7 FPGA using Xilinx Vivado 2024.1.
- **Verilog HDL**: Written entirely in Verilog HDL for synthesis and simulation.

## Tools and Technologies:
- **FPGA Platform**: Artix-7 FPGA
- **Design Suite**: Xilinx Vivado 2024.1
- **Hardware Description Language**: Verilog

## Simulation and Testing:
- The design has been simulated in Xilinx Vivado to ensure correct functionality of error detection and correction.
- Testbenches are included to verify the design under various error scenarios.

## Applications:
- Communication systems for error-resilient data transmission.
- Memory systems requiring error detection and correction to ensure data integrity.

Feel free to explore the code and use it in your projects. Contributions and suggestions are welcome to improve the design further!

--- 

This description is professional and provides a clear understanding of the project while highlighting its purpose and applications.
