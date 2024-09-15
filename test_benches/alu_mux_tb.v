module alu_mux_tb;

reg [31:0] EX_data, MEM_data, WB_data;
reg [1:0] sel;
wire [31:0] in;

alu_mux alu_mux_cpu(.sel(sel),
                    .EX_data(EX_data),
                    .MEM_data(MEM_data),
                    .WB_data(WB_data),
                    .in(in));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,alu_mux_tb);

    #1 EX_data = 32'd10; MEM_data = 32'd20; WB_data = 32'd30; sel = 2'd0;
    #1 EX_data = 32'd10; MEM_data = 32'd20; WB_data = 32'd30; sel = 2'd1;
    #1 EX_data = 32'd10; MEM_data = 32'd20; WB_data = 32'd30; sel = 2'd2;
    #1 EX_data = 32'd10; MEM_data = 32'd20; WB_data = 32'd30; sel = 2'd3;
    #1 EX_data = 32'd10; MEM_data = 32'd20; WB_data = 32'd30; sel = 2'd0;
    #1 $finish;

    
end

endmodule
