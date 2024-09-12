module pc (
    input clk,
    input reset,
    input pcwrite,
    input [7:0] next_pc,
    output reg [7:0] pc
);
    
    always @(next_pc or posedge reset) begin
        if (reset) begin
            pc = 8'b0;
        end
        else if (pcwrite) begin
            pc = next_pc;
        end
    end

endmodule