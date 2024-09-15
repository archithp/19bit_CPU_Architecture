module alu_control_tb();
    reg [4:0] opcode,funct;
    wire [4:0] operation;

    alu_control alu_control_cpu(.opcode(opcode),
                                .funct(funct),
                                .operation(operation));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,alu_control_tb);

        #1 opcode = 5'd0 ; funct = 5'd0;
        #1 opcode = 5'd1 ; funct = 5'd4;
        #1 opcode = 5'd2 ; funct = 5'd0;
        #1 $finish;
    end
endmodule