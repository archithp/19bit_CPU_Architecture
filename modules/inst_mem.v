module inst_mem (
    input [7:0] pc,
    output reg [18:0] instruction
);

    reg [18:0] memory [0:255];

    initial begin

    memory[0] = 19'b0000000000101100000; //ADD r3, r0, r1

    end

    always @(*) begin
        instruction = memory[pc];
    end
    
endmodule