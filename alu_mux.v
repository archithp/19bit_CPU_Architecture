module alu_mux(
    input [1:0] sel,
    input [31:0] EX_data,
    input [31:0] MEM_data,
    input [31:0] WB_data,
    output reg [31:0] in
);
    
    always @(*) begin
        case (sel)
            2'b00 : in = EX_data;
            2'b01 : in = MEM_data;
            2'b10 : in = WB_data;
            default: in = 32'd0;
        endcase
    end
endmodule