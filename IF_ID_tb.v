module IF_ID_tb;
    reg clk,IF_IDwrite;
    reg [7:0] pc_plus_one_IF;
    wire [7:0] pc_plus_one_ID;
    reg [18:0] next_instruction;
    wire [18:0] instruction;


IF_ID IF_ID_cpu (   .clk(clk),
                    .next_instruction(next_instruction),
                    .IF_IDwrite(IF_IDwrite),
                    .pc_plus_one_IF(pc_plus_one_IF),
                    .pc_plus_one_ID(pc_plus_one_ID),
                    .instruction(instruction));
initial begin
    clk = 0;
    forever #1 clk = ~clk;
end


initial begin

    $dumpfile("waveform.vcd");
    $dumpvars(0,IF_ID_tb);
    #1 next_instruction = 19'd0; IF_IDwrite = 1'b1; pc_plus_one_IF = 8'd0;
    #1 next_instruction = 19'd1; IF_IDwrite = 1'b1; pc_plus_one_IF = 8'd1;
    #1 next_instruction = 19'd2; IF_IDwrite = 1'b1; pc_plus_one_IF = 8'd2;
    #1 next_instruction = 19'd3; IF_IDwrite = 1'b0; pc_plus_one_IF = 8'd3;
    #1 next_instruction = 19'd4; IF_IDwrite = 1'b0; pc_plus_one_IF = 8'd4;
    #1 next_instruction = 19'd5; IF_IDwrite = 1'b1; pc_plus_one_IF = 8'd5;

    #1 $finish;

end

endmodule