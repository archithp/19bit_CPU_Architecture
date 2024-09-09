module pc (
    input clk,
    input pcwrite,
    input [7:0] next_pc,
    output reg [7:0] pc
);
    
    always @(posedge clk) begin
        if (pcwrite) begin
            pc = next_pc;
        end
    end

endmodule