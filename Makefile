CMP = iverilog
EX = vvp
GTK = gtkwave

OUT = executable_file
VIEW = waveform.vcd

SRC = pc.v
TB = pc_tb.v

$(OUT): $(SRC) $(TB)
		$(CMP) -o $(OUT) $(SRC) $(TB)

run : $(OUT)
		$(EX) $(OUT)

view: $(VIEW)
		$(GTK) $(VIEW)

clean: 
		rm -f $(OUT) $(VIEW)