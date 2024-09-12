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

    //remove later
    initial begin
        register_file[0] = 32'd10;
        register_file[1] = 32'd20;
        register_file[2] = 32'd30;
        register_file[3] = 32'd40;
    end


    always @(posedge clk or posedge reset) begin
        ID_rd1 = register_file[rs1];
        ID_rd2 = register_file[rs2];

        if (reset) begin
            for (i = 0; i < 32; i ++ ) begin
                register_file[i] = 32'd0;
                end
        end
        else if (WB_regwrite) begin
            register_file[ws] = wd;
            end

        else if (ID_push) begin
            register_file[SP] = stack_pc + 1;
            SP = SP - 1;
        end

        else if (ID_pop) begin
            SP = SP + 1;
            ID_rd1 = register_file[SP];
        end

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