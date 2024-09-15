module hazard_detection (
    input reset,
    input EX_memread,
    input [2:0] EX_rt,
    input [2:0] ID_rt,
    input [2:0] ID_rs,
    output reg hazard,
    output reg IF_IDwrite,
    output reg PCwrite
);

    always @(*) begin

        if (reset) begin
            hazard = 1'b0;
            IF_IDwrite = 1'b1;
            PCwrite = 1'b1;  
        end

        else if (EX_memread && ((EX_rt == ID_rt) || (EX_rt == ID_rs))) begin
            hazard = 1'b1;
            IF_IDwrite = 1'b0;
            PCwrite = 1'b0;
            // $display("hazard");
            // $display("EX_memread: %b", EX_memread);
            // $display("ID_rs: %b", ID_rs);
            // $display("ID_rt: %b", ID_rt);
            // $display("EX_rt: %b", EX_rt);
        end

        else begin
            hazard = 1'b0;
            IF_IDwrite = 1'b1;
            PCwrite = 1'b1;        
        end

    end
    
endmodule