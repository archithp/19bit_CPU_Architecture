module forwarding_unit_tb;

reg [2:0] EX_rs, EX_rt, MEM_rd, WB_rd;
reg MEM_regwrite, WB_regwrite;
wire [1:0] mux_in1, mux_in2;

forwarding_unit forwarding_unit_cpu(.EX_rs(EX_rs),
                                    .EX_rt(EX_rt),
                                    .MEM_rd(MEM_rd),
                                    .WB_rd(WB_rd),
                                    .MEM_regwrite(MEM_regwrite),
                                    .WB_regwrite(WB_regwrite),
                                    .mux_in1(mux_in1),
                                    .mux_in2(mux_in2));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,forwarding_unit_tb);

    #1 EX_rs = 3'd0; EX_rt = 3'd1; 
       MEM_rd = 3'd02; MEM_regwrite = 1'b0;
       WB_rd = 3'd02; WB_regwrite = 1'b0;

    #1 EX_rs = 3'd0; EX_rt = 3'd1; 
       MEM_rd = 3'd1; MEM_regwrite = 1'b1;
       WB_rd = 3'd2; WB_regwrite = 1'b0;

    #1 EX_rs = 3'd0; EX_rt = 3'd1; 
       MEM_rd = 3'd2; MEM_regwrite = 1'b0;
       WB_rd = 3'd0; WB_regwrite = 1'b1;

    #1 EX_rs = 3'd0; EX_rt = 3'd1; 
       MEM_rd = 3'd0; MEM_regwrite = 1'b1;
       WB_rd = 3'd0; WB_regwrite = 1'b1;

   #2 $finish;

end

endmodule