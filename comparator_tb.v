module comparator_tb;
    reg [31:0] rd1,rd2;
    wire zero;

    comparator comparator_cpu(.rd1(rd1),.rd2(rd2),.zero(zero));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,comparator_tb);

        #1 rd1 = 32'd0; rd2 = 32'd0;
        #1 rd1 = 32'd1; rd2 = 32'd0;
        #1 rd1 = 32'd0; rd2 = 32'd2; 
        #1 rd1 = 32'd4; rd2 = 32'd4;
        #1 $finish;

    end
endmodule