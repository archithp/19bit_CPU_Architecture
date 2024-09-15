module cpu_tb;

    reg clk ,reset;

    cpu vicharak_cpu(.clk(clk),.reset(reset));

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
        vicharak_cpu.print_reg_file();
        vicharak_cpu.print_mem_file();

        $finish;

    end

endmodule