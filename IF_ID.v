module IF_ID (  input clk,
                input [18:0] next_instruction,
                input IF_IDwrite,
                input [7:0] pc_plus_one_IF,
                output reg [7:0] pc_plus_one_ID,
                output reg [18:0] instruction);

    always @(posedge clk) begin
        if (IF_IDwrite) begin
            instruction <= next_instruction;
            pc_plus_one_ID <= pc_plus_one_IF;
        end
    end

endmodule