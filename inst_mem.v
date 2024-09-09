module inst_mem (
    input [7:0] pc,
    output reg [18:0] instruction
);

    reg [18:0] memory [0:255];

    initial begin

        memory[0] = 19'd1;
        memory[1] = 19'd2;
        memory[2] = 19'd3;
        memory[3] = 19'd4;
        // memory[0] = 19'b0000000000000000000;
        // memory[1] = 19'b0000000000000000000;
        // memory[2] = 19'b0000000000000000000;
        // memory[3] = 19'b0000000000000000000;
    end

    always @(*) begin
        instruction = memory[pc];
    end
    
endmodule