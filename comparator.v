module comparator (
    input [31:0] rd1,
    input [31:0] rd2,
    output reg zero
);
    always @(*) begin
        if (rd1 == rd2) begin
            zero = 1'b1;
        end
        else begin
            zero = 1'b0;
        end
    end

endmodule