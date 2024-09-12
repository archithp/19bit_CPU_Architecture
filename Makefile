CMP = iverilog
EX = vvp
GTK = gtkwave

OUT = executable_file
VIEW = waveform.vcd

SRC = cpu.v pc.v inst_mem.v IF_ID.v control.v reg_file.v comparator.v ID_EX.v alu_mux.v alu_control.v alu.v EX_MEM.v data_mem.v MEM_WB.v forwarding_unit.v hazard_detection.v parameter.v
TB = cpu_tb.v

$(OUT): $(SRC) $(TB)
		$(CMP) -o $(OUT) $(SRC) $(TB)

run : $(OUT)
		$(EX) $(OUT)

view: $(VIEW)
		$(GTK) $(VIEW)

clean: 
		rm -f $(OUT) $(VIEW)