module inst_mem_tb;

reg [7:0] pc;
wire [18:0] instruction;

inst_mem inst_mem_cpu(  .pc(pc),
                        .instruction(instruction));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,inst_mem_tb);
    #1 pc = 8'd0;
    #1 pc = 8'd1;
    #1 pc = 8'd2;
    #1 pc = 8'd3;
    #1 $finish;
end


endmodule