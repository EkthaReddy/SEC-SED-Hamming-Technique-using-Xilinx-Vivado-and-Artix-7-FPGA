`timescale 1ns / 1ps

module Hamming_error_code_detection_correction_tb;

    // Inputs
    reg [3:0] data_in;
    reg [6:0] encoded_data;
    
    // Outputs for encoder
    wire [6:0] data_out;

    // Outputs for decoder
    wire [3:0] decoded_data;
    wire [2:0] syndrome;
    wire error_detected;
    wire error_corrected;
    
    // Instantiate Hamming Encoder
    Hamming_Encoder encoder(
        .data_in(data_in),
        .data_out(data_out)
    );

    // Instantiate Hamming Decoder
    Hamming_Decoder decoder(
        .code(encoded_data),
        .data_out(decoded_data),
        .syndrome(syndrome),
        .error_detected(error_detected),
        .error_corrected(error_corrected)
    );

    // Stimulus block
    initial begin
        // Initialize inputs
        data_in = 4'b0000;
        encoded_data = 7'b0000000;
        #10;  // Small delay before actual test cases

        // Test Case 1: No error
        data_in = 4'b1010;  // Input data to encode
        #10;
        encoded_data = data_out;  // Pass encoded data to the decoder
        #10;
        
       
        // Test Case 2: Introduce single-bit error in encoded data
        encoded_data = data_out;
        encoded_data[2] = ~encoded_data[2]; // Introduce error at bit 2
        #10;
        
        
        // Test Case 3: Introduce single-bit error in another position
        encoded_data = data_out;
        encoded_data[6] = ~encoded_data[6]; // Introduce error at bit 6
        #10;
        
        
        // End simulation
        $finish;
    end
    
endmodule
