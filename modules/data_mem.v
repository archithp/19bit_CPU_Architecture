module data_mem (
    input clk,
    input reset,
    input MEM_memwrite,
    input MEM_memread,
    input [7:0] addr,
    input [31:0] wdata,
    output reg [31:0] rdata
);

    integer i = 0;
    
    reg [31:0] memory [0:255];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 256 ; i++) begin
                memory[i] = 32'd0;
            end
        end
        else if (MEM_memread) begin
            rdata = memory[addr];
        end

        else if (MEM_memwrite) begin
            memory[addr] = wdata;
        end
        
    end
    
    // Useful for debuggging ,remove later
    task print_data_memory_values;
        integer i;
        begin
            $display("Memory Values:");
            for ( i = 0; i < 256 ; i ++ ) begin
                $display("Memory %d = %d",i,memory[i]);
            end
        end
    endtask

endmodule