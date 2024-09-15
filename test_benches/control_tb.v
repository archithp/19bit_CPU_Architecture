module control_tb;

reg [4:0] opcode;
reg hazard;
wire ID_branch, ID_regwrite, ID_memtoreg, ID_memread, ID_memwrite, ID_alusrc, ID_aluop;
wire ID_regdist, ID_branchtype, ID_push, ID_pop, ID_ret, ID_jump;

control control_cpu(.opcode(opcode),
                    .hazard(hazard),
                    .ID_branch(ID_branch),
                    .ID_regwrite(ID_regwrite),
                    .ID_memtoreg(ID_memtoreg),
                    .ID_memread(ID_memread),
                    .ID_memwrite(ID_memwrite),
                    .ID_alusrc(ID_alusrc),
                    .ID_aluop(ID_aluop),
                    .ID_regdist(ID_regdist),
                    .ID_branchtype(bID_ranchtype),
                    .ID_push(ID_push),
                    .ID_pop(ID_pop),
                    .ID_ret(ID_ret),
                    .ID_jump(ID_jump));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,control_tb);

    #1 opcode = 5'd8; hazard = 1'b0;
    #1 opcode = 5'd9; hazard = 1'b0;
    #1 opcode = 5'd10; hazard = 1'b0;
    #1 opcode = 5'd11; hazard = 1'b0;
    #1 $finish;
end


endmodule