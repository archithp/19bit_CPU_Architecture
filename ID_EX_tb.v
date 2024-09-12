module ID_EX_tb ();

reg ID_regwrite, ID_memtoreg, ID_memread, ID_memwrite, ID_alusrc, ID_aluop, ID_regdist,clk;
reg [7:0] ID_immediate;
reg [2:0] ID_rs, ID_rt, ID_rd;
reg [31:0] ID_rd1, ID_rd2;
reg [5:0] ID_opcode;

wire EX_regwrite, EX_memtoreg, EX_memread, EX_memwrite, EX_alusrc, EX_aluop, EX_regdist;
wire [7:0] EX_immediate;
wire [2:0] EX_rs, EX_rt, EX_rd;
wire [31:0] EX_rd1, EX_rd2;
wire [5:0] EX_opcode;

ID_EX ID_EX_cpu(.clk(clk),
                .ID_opcode(ID_opcode),
                .ID_regwrite(ID_regwrite),
                .ID_memtoreg(ID_memtoreg),
                .ID_memread(ID_memread),
                .ID_memwrite(ID_memwrite),
                .ID_alusrc(ID_alusrc),
                .ID_aluop(ID_aluop),
                .ID_regdist(ID_regdist),
                .ID_immediate(ID_immediate),
                .ID_rs(ID_rs),
                .ID_rt(ID_rt),
                .ID_rd(ID_rd),
                .ID_rd1(ID_rd1),
                .ID_rd2(ID_rd2),
                .EX_opcode(EX_opcode),
                .EX_regwrite(EX_regwrite),
                .EX_memtoreg(EX_memtoreg),
                .EX_memread(EX_memread),
                .EX_memwrite(EX_memwrite),
                .EX_alusrc(EX_alusrc),
                .EX_aluop(EX_aluop),
                .EX_regdist(EX_regdist),
                .EX_immediate(EX_immediate),
                .EX_rs(EX_rs),
                .EX_rt(EX_rt),
                .EX_rd(EX_rd),
                .EX_rd1(EX_rd1),
                .EX_rd2(EX_rd2));

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,ID_EX_tb);
    #1 
    ID_opcode = 5'd2;
    ID_regwrite = 1'b0; 
    ID_memtoreg = 1'b0;
    ID_memread = 1'b0;
    ID_memwrite = 1'b0;
    ID_alusrc = 1'b0;
    ID_aluop = 1'b0;
    ID_regdist = 1'b0;
    ID_immediate = 8'd6;
    ID_rs = 3'd4;
    ID_rt = 3'd5;
    ID_rd = 3'd6;
    ID_rd1 = 32'd42;
    ID_rd2 = 32'd43;

    #2 
    ID_opcode = 5'd8;
    ID_regwrite = 1'b1; 
    ID_memtoreg = 1'b1;
    ID_memread = 1'b1;
    ID_memwrite = 1'b1;
    ID_alusrc = 1'b1;
    ID_aluop = 1'b1;
    ID_regdist = 1'b1;
    ID_immediate = 8'd4;
    ID_rs = 3'd7;
    ID_rt = 3'd3;
    ID_rd = 3'd1;
    ID_rd1 = 32'd22;
    ID_rd2 = 32'd63;
    #2 $finish;

end

endmodule
