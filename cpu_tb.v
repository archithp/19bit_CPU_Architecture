module cpu_tb;

    reg clk ,reset;

    cpu cpu_19bit(.clk(clk),.reset(reset));

    initial begin
        clk = 1;
        forever begin
            #1 clk = ~ clk;
        end
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,cpu_tb);

           reset = 1'b1;
        #1 reset = 1'b0;
        
        #200
        cpu_19bit.print_reg_file();
        cpu_19bit.print_mem_file();

        $finish;

    end

endmodule