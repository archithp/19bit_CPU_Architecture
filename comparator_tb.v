module comparator_tb;
    reg [31:0] ID_rd1,ID_rd2;
    wire zero;

    comparator comparator_cpu(  .ID_rd1(ID_rd1),
                                .ID_rd2(ID_rd2),
                                .zero(zero));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,comparator_tb);

        #1 ID_rd1 = 32'd0; ID_rd2 = 32'd0;
        #1 ID_rd1 = 32'd1; ID_rd2 = 32'd0;
        #1 ID_rd1 = 32'd0; ID_rd2 = 32'd2; 
        #1 ID_rd1 = 32'd4; ID_rd2 = 32'd4;
        #1 $finish;

    end
endmodule