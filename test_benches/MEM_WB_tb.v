module MEM_WB_tb;

    reg clk, MEM_regwrite, MEM_memtoreg;
    reg [31:0] MEM_rdata, MEM_out;
    reg [2:0] MEM_rd;

    wire WB_memwrite, WB_memtoreg;
    wire [31:0] WB_rdata, WB_out;
    wire [2:0] WB_rd;

    MEM_WB MEM_WB_cpu(  .clk(clk),
                        .MEM_regwrite(MEM_regwrite),
                        .MEM_memtoreg(MEM_memtoreg),
                        .MEM_rdata(MEM_rdata),
                        .MEM_out(MEM_out),
                        .MEM_rd(MEM_rd),
                        .WB_regwrite(WB_regwrite),
                        .WB_memtoreg(WB_memtoreg),
                        .WB_rdata(WB_rdata),
                        .WB_out(WB_out),
                        .WB_rd(WB_rd));

initial begin
    clk = 1;
    forever #1 clk = ~ clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,MEM_WB_tb);

    #2 MEM_regwrite = 1'b0; MEM_memtoreg = 1'b0;
        MEM_rdata = 32'd12; MEM_out = 32'd23; MEM_rd = 3'd1;

    #2 MEM_regwrite = 1'b1; MEM_memtoreg = 1'b1;
        MEM_rdata = 32'd22; MEM_out = 32'd31; MEM_rd = 3'd0;

    #2 $finish;

end

endmodule