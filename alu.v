`include "parameter.v"

module alu (
    input [31:0] in1,
    input [31:0] in2,
    input [4:0] alu_ctrl,
    output reg [31:0] out
);
    
    always @(*) begin
        case (alu_ctrl)
            `ADD: out = in1 + in2;
            `SUB: out = in1 - in2;
            `MUL: out = in1 * in2;
            `DIV: out = in1 / in2;
            `INC: out = in1 + 1;
            `DEC: out = in1 - 1;
            `AND: out = in1 & in2;
            `OR: out = in1 | in2;
            `XOR: out = in1 ^ in2;
            `ENC: out = in1 ^ 32'b00110010101110101100100000011001; //XOR Encryption 
            `DECRY: out = in1 ^ 32'b00110010101110101100100000011001;
            default: out = 32'd0;
        endcase
    end

endmodule