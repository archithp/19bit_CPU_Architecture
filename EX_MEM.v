module EX_MEM (
    input clk,
    input EX_regwrite,
    input EX_memtoreg,
    input EX_memread,
    input EX_memwrite,
    input [31:0] EX_out,
    input [31:0] EX_wdata,
    input [2:0] EX_rd,
    output reg MEM_regwrite,
    output reg MEM_memtoreg,
    output reg MEM_memread,
    output reg MEM_memwrite,
    output reg [31:0] MEM_out,
    output reg [31:0] MEM_wdata,
    output reg [2:0] MEM_rd
);

    always @(posedge clk ) begin
        MEM_regwrite <= EX_regwrite;
        MEM_memtoreg <= EX_memtoreg;
        MEM_memread <= EX_memread;
        MEM_memwrite <= EX_memwrite;
        MEM_out <= EX_out;
        MEM_wdata <= EX_wdata;
        MEM_rd <= EX_rd;
        $display("input EX_regwrite:%b",EX_regwrite);
        $display("output MEM_regwrite:%b",MEM_regwrite);
    end


    
endmodule