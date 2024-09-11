module EX_MEM_tb;

reg EX_regwrite, EX_memtoreg, EX_memread, EX_memwrite,clk;
reg [31:0] EX_out, EX_wdata;
reg [2:0] EX_rd;

wire MEM_regwrite, MEM_memtoreg, MEM_memread, MEM_memwrite;
wire [31:0] MEM_out, MEM_wdata;
wire [2:0] MEM_rd;

EX_MEM EX_MEM_cpu ( .clk(clk),
                    .EX_regwrite(EX_regwrite),
                    .EX_memtoreg(EX_memtoreg),
                    .EX_memread(EX_memread),
                    .EX_memwrite(EX_memwrite),
                    .EX_out(EX_out),
                    .EX_wdata(EX_wdata),
                    .EX_rd(EX_rd),
                    .MEM_regwrite(MEM_regwrite),
                    .MEM_memtoreg(MEM_memtoreg),
                    .MEM_memread(MEM_memread),
                    .MEM_memwrite(MEM_memwrite),
                    .MEM_out(MEM_out),
                    .MEM_wdata(MEM_wdata),
                    .MEM_rd(MEM_rd));

initial begin
    clk = 1;
    forever #1 clk = ~clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,EX_MEM_tb);

    #2  EX_regwrite = 1'b0;
        EX_memtoreg = 1'b0;
        EX_memread = 1'b0;
        EX_memwrite = 1'b0;
        EX_out = 32'd10;
        EX_wdata = 32'd40;
        EX_rd = 3'd1;

    #2  EX_regwrite = 1'b0;
        EX_memtoreg = 1'b1;
        EX_memread = 1'b0;
        EX_memwrite = 1'b1;
        EX_out = 32'd10;
        EX_wdata = 32'd40;
        EX_rd = 3'd1;

    #2  EX_regwrite = 1'b1;
        EX_memtoreg = 1'b0;
        EX_memread = 1'b1;
        EX_memwrite = 1'b0;
        EX_out = 32'd110;
        EX_wdata = 32'd14;
        EX_rd = 3'd6;

    #2 $finish;
end

endmodule





