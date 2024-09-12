module IF_ID_tb;
    reg clk,IF_IDwrite;
    reg [7:0] IF_pc_plus_one;
    wire [7:0] ID_pc_plus_one;
    reg [18:0] IF_instruction;
    wire [18:0] ID_instruction;


IF_ID IF_ID_cpu (   .clk(clk),
                    .IF_instruction(IF_instruction),
                    .IF_IDwrite(IF_IDwrite),
                    .IF_pc_plus_one(IF_pc_plus_one),
                    .ID_pc_plus_one(ID_pc_plus_one),
                    .ID_instruction(ID_instruction));
initial begin
    clk = 0;
    forever #1 clk = ~clk;
end


initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0,IF_ID_tb);
    #1 IF_instruction = 19'd0; IF_IDwrite = 1'b1; IF_pc_plus_one = 8'd0;
    #1 IF_instruction = 19'd1; IF_IDwrite = 1'b1; IF_pc_plus_one = 8'd1;
    #1 IF_instruction = 19'd2; IF_IDwrite = 1'b1; IF_pc_plus_one = 8'd2;
    #1 IF_instruction = 19'd3; IF_IDwrite = 1'b0; IF_pc_plus_one = 8'd3;
    #1 IF_instruction = 19'd4; IF_IDwrite = 1'b0; IF_pc_plus_one = 8'd4;
    #1 IF_instruction = 19'd5; IF_IDwrite = 1'b1; IF_pc_plus_one = 8'd5;

    #1 $finish;

end

endmodule