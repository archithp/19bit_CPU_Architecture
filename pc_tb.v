module pc_tb;

reg [7:0] next_pc;
wire [7:0] pc;
reg clk,pcwrite;

pc pc_cpu(  
    .clk(clk),
    .reset(reset),
    .pcwrite(pcwrite),
    .next_pc(next_pc),
    .pc(pc));

initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end


initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,pc_tb);
    #1 next_pc = 8'd0; pcwrite = 1'b0; reset = 1'b0;
    #1 next_pc = 8'd1; pcwrite = 1'b0; reset = 1'b0;
    #1 next_pc = 8'd2; pcwrite = 1'b0; reset = 1'b0;
    #1 next_pc = 8'd3; pcwrite = 1'b1; reset = 1'b0;
    #1 next_pc = 8'd4; pcwrite = 1'b1; reset = 1'b0;
    #1 next_pc = 8'd3; pcwrite = 1'b1; reset = 1'b0;
    #1 next_pc = 8'd4; pcwrite = 1'b0; reset = 1'b0;

    #1 $finish;

end

endmodule