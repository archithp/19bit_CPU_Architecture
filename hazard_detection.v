module hazard_detection (
    input EX_memread,
    input [2:0] EX_rt,
    input [2:0] IF_rt,
    input [2:0] IF_rs,
    output reg hazard,
    output reg IF_IDwrite,
    output reg PCwrite
);

    always @(*) begin
        hazard = 1'b0;
        IF_IDwrite = 1'b1;
        PCwrite = 1'b1;

        if (EX_memread && ((EX_rt == IF_rt) || (EX_rt == IF_rs))) begin
            hazard = 1'b1;
            IF_IDwrite = 1'b0;
            PCwrite = 1'b0;
        end

    end
    
endmodule