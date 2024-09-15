`include "modules/parameter.v"

module alu (
    input [31:0] in1,
    input [31:0] in2,
    input [4:0] alu_ctrl,
    output reg [31:0] EX_out
);
    always @(*) begin
        case (alu_ctrl)
            `ADD: EX_out = in1 + in2;
            `SUB: EX_out = in1 - in2;
            `MUL: EX_out = in1 * in2;
            `DIV: EX_out = in1 / in2;
            `INC: EX_out = in1 + 1;
            `DEC: EX_out = in1 - 1;
            `AND: EX_out = in1 & in2;
            `OR: EX_out = in1 | in2;
            `XOR: EX_out = in1 ^ in2;
            `NOT: EX_out = ~in1;
            `ENCRY: EX_out = in1 ^ 32'b00110010101110101100100000011001; //XOR Encryption 
            `DECRY: EX_out = in1 ^ 32'b00110010101110101100100000011001;
            `IMMED: EX_out = in2;
            default: EX_out = 32'd0;
        endcase
        // $display("in1:%d, in2:%d,EX_out:%d,",in1,in2,EX_out) ; 
    end

endmodule