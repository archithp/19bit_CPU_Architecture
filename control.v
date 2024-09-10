`define ART 5'd0
`define LOG 5'd1
`define JMP 5'd2
`define BQE 5'd3
`define BNE 5'd4
`define CALL 5'd5
`define RET 5'd6
`define LD 5'd7
`define ST 5'd8
`define ENC 5'd9
`define DEC 5'd10
`define IMM 5'd11

module control( input [4:0] opcode,
                input hazard,
                output reg branch,
                output reg regwrite,
                output reg memtoreg,
                output reg memread,
                output reg memwrite,
                output reg alusrc,
                output reg aluop,
                output reg regdist,
                output reg branchtype,
                output reg push,
                output reg pop,
                output reg ret,
                output reg jump);

    always @(*)begin
        branch = 1'b0;
        regwrite = 1'b0;
        memtoreg = 1'b0;
        memread = 1'b0;
        memwrite = 1'b0;
        alusrc = 1'b0;
        aluop = 1'b0;
        regdist = 1'b0;
        branchtype = 1'b0;
        push = 1'b0;
        pop = 1'b0;
        ret = 1'b0;
        jump = 1'b0;

        if (hazard) begin
            
        end
        else begin
            case (opcode)
                `ART: begin
                    regdist = 1'b1;
                    regwrite = 1'b1;
                end 

                `LOG: begin
                    regdist = 1'b1;
                    regwrite = 1'b1;
                end 
            
                `JMP: begin
                    jump = 1'b1;
                end
                
                `BQE: begin
                    branch = 1'b1;
                    branchtype = 1'b0;
                end 

                `BNE: begin
                    branch = 1'b1;
                    branchtype = 1'b1;
                end 

                `CALL: begin
                    push = 1'b1;
                    jump = 1'b1;
                end
                
                `RET: begin
                    pop = 1'b1;
                    ret = 1'b1;
                end

                `LD: begin
                    memread = 1'b1;
                    memtoreg = 1'b1;
                    regwrite = 1'b1;
                end

                `ST: begin
                    memwrite = 1'b1;
                   end

                `ENC: begin
                    regwrite = 1'b1;
                end          

                `DEC: begin
                    regwrite = 1'b1;
                end               

                `IMM: begin
                    regdist = 1'b1;
                    regwrite = 1'b1;
                    alusrc = 1'b1;
                end               
                
                default: begin
                    
                end
            endcase
        end

    end

endmodule