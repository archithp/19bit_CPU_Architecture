module alu_tb;

reg [31:0] in1, in2;
reg [4:0] alu_ctrl;
wire [31:0] out;

alu alu_cpu(.in1(in1),.in2(in2),.alu_ctrl(alu_ctrl),.out(out));

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,alu_tb);

    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd0;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd1;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd2;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd3;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd4;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd5;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd6;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd7;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd8;
    #1 in1 = 32'd10; in2 = 32'd5; alu_ctrl = 5'd9;
    #1 in1 = 32'd851101715; in2 = 32'd5; alu_ctrl = 5'd10;
    #2 $finish;
end

endmodule