module Hamming_Encoder(
input [3:0]data_in,
output [6:0]data_out
    );
    
    
    assign data_out[0]=data_in[0]^data_in[1]^data_in[3];//parity 1
    assign data_out[1]=data_in[0]^data_in[2]^data_in[3];//parity 2
    assign data_out[2]=data_in[0];                      //data 3
    assign data_out[3]=data_in[1]^data_in[2]^data_in[3];//parity 4
    assign data_out[4]=data_in[1];                      //data 5
    assign data_out[5]=data_in[2];                      //data 6
    assign data_out[6]=data_in[3];                      //data 7
    
    
endmodule

//Hamming decoder
module Hamming_Decoder(
    input [6:0] code,
    output reg [3:0] data_out,
    output reg [2:0] syndrome,
    output reg error_detected,
    output reg error_corrected
);

    wire p1, p2, p4;

    // Calculate parity bits
    assign p1 = code[0] ^ code[2] ^ code[4] ^ code[6];
    assign p2 = code[1] ^ code[2] ^ code[5] ^ code[6];
    assign p4 = code[3] ^ code[4] ^ code[5] ^ code[6];

    always @(*) begin
        // Form the syndrome
        syndrome = {p4, p2, p1};

        // Error detection
        error_detected = (syndrome != 3'b000);

        if (error_detected) begin
            error_corrected = 1'b1;
            case (syndrome)
                3'b001: data_out = {code[6], code[5], code[4], ~code[0]};
                3'b010: data_out = {code[6], code[5], ~code[1], code[0]};
                3'b011: data_out = {code[6], ~code[2], code[4], code[0]};
                3'b100: data_out = {~code[3], code[5], code[4], code[0]};
                3'b101: data_out = {code[6], code[5], ~code[4], code[0]};
                3'b110: data_out = {code[6], ~code[5], code[4], code[0]};
                3'b111: data_out = {~code[6], code[5], code[4], code[0]};
                default: data_out = {code[6], code[5], code[4], code[0]};
            endcase
        end else begin
            error_corrected = 1'b0;
            data_out = {code[6], code[5], code[4], code[0]};
        end
    end
endmodule
