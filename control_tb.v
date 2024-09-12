module control_tb;

reg [4:0] opcode;
reg hazard;
wire branch, regwrite,memtoreg, memread, memwrite, alusrc, aluop;
wire regdist, branchtype, push, pop, ret, jump;

control control_cpu(.opcode(opcode),
                    .hazard(hazard),
                    .branch(branch),
                    .regwrite(regwrite),
                    .memtoreg(memtoreg),
                    .memread(memread),
                    .memwrite(memwrite),
                    .alusrc(alusrc),
                    .aluop(aluop),
                    .regdist(regdist),
                    .branchtype(branchtype),
                    .push(push),
                    .pop(pop),
                    .ret(ret),
                    .jump(jump));

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