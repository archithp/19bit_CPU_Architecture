module inst_mem (
    input [7:0] pc,
    output reg [18:0] instruction
);

    reg [18:0] memory [0:255];

    initial begin

        // memory[0] = 19'd10;
        // memory[1] = 19'd11;
        // memory[2] = 19'd12;
        // memory[3] = 19'd13;
        // memory[0] = 19'b1111100000000000000;
        memory[0] = 19'b0101000000000001000;
        memory[1] = 19'b1111100000000000000;
        memory[2] = 19'b1111100000000000000;
        memory[3] = 19'b1111100000000000000;
        memory[4] = 19'b1111100000000000000;
        memory[5] = 19'b1111100000000000000;
        memory[6] = 19'b1111100000000000000;
        memory[7] = 19'b1111100000000000000;
        memory[8] = 19'b1111100000000000000;
        memory[9] = 19'b1111100000000000000;

    end

    always @(*) begin
        instruction = memory[pc];
    end
    
endmodule