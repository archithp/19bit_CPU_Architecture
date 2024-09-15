module data_mem_tb;

reg clk,reset,MEM_memread,MEM_memwrite;
reg [7:0] addr;
reg [31:0] wdata;
wire [31:0] rdata;

data_mem data_mem_cpu(  .clk(clk),
                        .reset(reset),
                        .MEM_memwrite(MEM_memwrite),
                        .MEM_memread(MEM_memread),
                        .addr(addr),
                        .wdata(wdata),
                        .rdata(rdata));

initial begin
    clk = 1;
    forever #1 clk = ~ clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,data_mem_tb);
    
    #2 reset = 1'b1;  MEM_memwrite = 1'b0; MEM_memread = 1'b0; 
        addr = 8'd10; wdata = 32'd20;

    #2 reset = 1'b0;  MEM_memwrite = 1'b1; MEM_memread = 1'b0; 
        addr = 8'd10; wdata = 32'd20;

    #2 reset = 1'b0;  MEM_memwrite = 1'b0; MEM_memread = 1'b1; 
        addr = 8'd10; wdata = 32'd30;

    #2 reset = 1'b0;  MEM_memwrite = 1'b0; MEM_memread = 1'b0; 
        addr = 8'd10; wdata = 32'd40;

    #2 $finish;
end

endmodule