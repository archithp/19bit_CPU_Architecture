module reg_file_tb;

    reg clk,reset,WB_regwrite,ID_push,ID_pop;
    reg [2:0] rs1,rs2,ws;
    reg [31:0] wd;
    wire [31:0] ID_rd1,ID_rd2;
    reg [7:0] stack_pc;

    reg_file reg_file_cpu(  .clk(clk),
                            .reset(reset),
                            .WB_regwrite(WB_regwrite),
                            .ID_push(ID_push),
                            .ID_pop(ID_pop),
                            .stack_pc(stack_pc),
                            .rs1(rs1),
                            .rs2(rs2),
                            .ws(ws),
                            .wd(wd),
                            .ID_rd1(ID_rd1),
                            .ID_rd2(ID_rd2));

initial begin
    clk =0;
    forever #1 clk = ~ clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,reg_file_tb);

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b0 ; stack_pc = 8'd00;
        rs1 = 3'd0 ; rs2 = 3'd1 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b0 ; stack_pc = 8'd00;
        rs1 = 3'd0 ; rs2 = 3'd1 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b1 ; ID_pop = 1'b0 ; stack_pc = 8'd35;
        rs1 = 3'd2 ; rs2 = 3'd3 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b0 ; stack_pc = 8'd00;
        rs1 = 3'd2 ; rs2 = 3'd3 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b1 ; stack_pc = 8'd00;
        rs1 = 3'd0 ; rs2 = 3'd3 ;
        ws = 3'd1 ; wd = 32'd25 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b0 ; stack_pc = 8'd00;
        rs1 = 3'd0 ; rs2 = 3'd1 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1  reset = 1'b0; WB_regwrite = 1'b0 ; ID_push = 1'b0 ; ID_pop = 1'b0 ; stack_pc = 8'd00;
        rs1 = 3'd2 ; rs2 = 3'd1 ;
        ws = 3'd0 ; wd = 32'd0 ;

    #1

    reg_file_cpu.print_register_values();

    #1 $finish;

end

endmodule