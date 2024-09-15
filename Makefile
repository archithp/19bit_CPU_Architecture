CMP = iverilog
EX = vvp
GTK = gtkwave

OUT = executable_file
VIEW = waveform.vcd

SRC_DIR = modules
SRC = 	$(SRC_DIR)/cpu.v $(SRC_DIR)/pc.v $(SRC_DIR)/inst_mem.v $(SRC_DIR)/IF_ID.v $(SRC_DIR)/control.v $(SRC_DIR)/reg_file.v \
		$(SRC_DIR)/comparator.v $(SRC_DIR)/ID_EX.v $(SRC_DIR)/alu_mux.v $(SRC_DIR)/alu_control.v $(SRC_DIR)/alu.v \
		$(SRC_DIR)/EX_MEM.v $(SRC_DIR)/data_mem.v $(SRC_DIR)/MEM_WB.v $(SRC_DIR)/forwarding_unit.v \
		$(SRC_DIR)/hazard_detection.v $(SRC_DIR)/parameter.v
		
TB = cpu_tb.v

$(OUT): $(SRC) $(TB)
		$(CMP) -o $(OUT) $(SRC) $(TB)

run : $(OUT)
		$(EX) $(OUT)

view: $(VIEW)
		$(GTK) $(VIEW)

clean: 
		rm -f $(OUT) $(VIEW)