module reg_file(input clk,
                input reset,
                input WB_regwrite,
                input ID_push,
                input ID_pop,
                input [7:0]stack_pc,
                input [2:0]rs1,
                input [2:0]rs2,
                input [2:0]ws,
                input [31:0]wd,
                output reg [31:0]ID_rd1,
                output reg [31:0]ID_rd2);
    integer i;
    integer SP = 7;
    reg [31:0] register_file[0:7];

    initial begin
        register_file[0] = 32'd0;
        register_file[1] = 32'd0;
        register_file[2] = 32'd0;
        register_file[3] = 32'd0;
        register_file[4] = 32'd0;
        register_file[5] = 32'd0;
        register_file[6] = 32'd0;
        register_file[7] = 32'd0;
    end

    always @(posedge clk or posedge reset or rs1 or rs2 or ws or wd) begin
        ID_rd1 = register_file[rs1];
        ID_rd2 = register_file[rs2];

        if (reset) begin
            for (i = 0; i < 32; i ++ ) begin
                register_file[i] = 32'd0;
                end
        end

        else begin
            if (WB_regwrite) begin
                register_file[ws] = wd;
            end

            if (ID_push) begin
                register_file[SP] <= stack_pc;
                SP <= SP - 1;
            end

            if (ID_pop) begin
                SP = SP + 1;
                ID_rd1 <= register_file[SP];
                register_file[SP] <= 32'd0;
            end  
        end

        
    // $display("ID_rd1: %d, ID_rd2 %d",ID_rd1,ID_rd2);

    end

    // Useful for debuggging ,remove later
    task print_register_values;
        integer i;
        begin
            $display("Register Values:");
            for ( i = 0; i < 8 ; i ++ ) begin
                $display("Register %d = %d",i,register_file[i]);
            end
        end
    endtask

endmodule