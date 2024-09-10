module hazard_detection_tb;

reg EX_memread;
reg [2:0] EX_rt, IF_rs, IF_rt;
wire hazard, PCwrite, IF_IDwrite;

hazard_detection hazard_detection_cpu(  .EX_memread(EX_memread),
                                        .EX_rt(EX_rt),
                                        .IF_rs(IF_rs),
                                        .IF_rt(IF_rt),
                                        .hazard(hazard),
                                        .IF_IDwrite(IF_IDwrite),
                                        .PCwrite(PCwrite));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,hazard_detection_tb);

    #1 EX_memread = 1'b0; EX_rt = 3'd0; IF_rt = 3'd0; IF_rs = 3'd0;
    #1 EX_memread = 1'b1; EX_rt = 3'd1; IF_rt = 3'd2; IF_rs = 3'd3;
    #1 EX_memread = 1'b1; EX_rt = 3'd4; IF_rt = 3'd4; IF_rs = 3'd2;
    #1 EX_memread = 1'b1; EX_rt = 3'd0; IF_rt = 3'd1; IF_rs = 3'd0;
    #1 EX_memread = 1'b1; EX_rt = 3'd0; IF_rt = 3'd0; IF_rs = 3'd0;
    #1 $finish;
end

endmodule