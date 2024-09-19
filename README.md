
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



# SEC-SED Hamming Code Implementation on Artix-7 FPGA using verilo programming

### Description:
This project implements a **Hamming Code with Single Error Correction (SEC) and Single Error Detection (SED)** using Verilog. The goal is to ensure reliable data transmission by detecting and correcting single-bit errors in a 4-bit data word, encoded into a 7-bit code word. The implementation follows the principles of Hamming(7,4) code and allows for real-time detection and correction of errors.

### Project Files:
1. **Hamming Encoder Module**: Encodes 4-bit input data into a 7-bit Hamming code with parity bits.
2. **Hamming Decoder Module**: Decodes the 7-bit code, detects and corrects single-bit errors, and outputs the corrected 4-bit data.

### Hamming Code Calculation:
Hamming codes use a combination of data bits and parity bits to form a code word. In this implementation, 4 data bits (`d3`, `d2`, `d1`, `d0`) are used, and 3 parity bits (`p1`, `p2`, `p4`) are calculated based on specific positions. 

For the given 4-bit input data `d[3:0]`, the encoded 7-bit output `data_out[6:0]` consists of:
- `p1`, `p2`, `d0`, `p4`, `d1`, `d2`, `d3`

The parity bits are calculated as follows:
- `p1` is the XOR of bits at positions 1, 3, 5, and 7.
- `p2` is the XOR of bits at positions 2, 3, 6, and 7.
- `p4` is the XOR of bits at positions 4, 5, 6, and 7.

### Example:

- **Input (4-bit data):** `1010`
- **Encoded (7-bit Hamming code):** `1001101`

Here’s how the parity bits are calculated:
- `p1 = d0 ⊕ d1 ⊕ d3 = 1 ⊕ 0 ⊕ 0 = 1`
- `p2 = d0 ⊕ d2 ⊕ d3 = 1 ⊕ 1 ⊕ 0 = 0`
- `p4 = d1 ⊕ d2 ⊕ d3 = 0 ⊕ 1 ⊕ 0 = 1`

So, the encoded 7-bit output becomes: `1001101`.

### Error Detection and Correction:
The decoder module computes the syndrome using the parity check logic:
- If the syndrome is non-zero, it identifies the position of the error and corrects it.
- If the syndrome is `000`, no errors are detected.

For example, if the received code word is `1011101` (with an error in bit 3), the syndrome will be `011` (indicating an error at bit position 3). The decoder will correct the error and output the corrected data.

## Applications:
- Communication systems for error-resilient data transmission.
- Memory systems requiring error detection and correction to ensure data integrity.

