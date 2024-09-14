module comparator (
    input [31:0] ID_rd1,
    input [31:0] ID_rd2,
    output reg zero
);
    always @(*) begin
        $display("rd1: %d, rd2: %d, zero: %d",ID_rd1, ID_rd2, zero);
        if (ID_rd1 == ID_rd2) begin
            zero = 1'b1;
        end
        else begin
            zero = 1'b0;
        end
    end

endmodule