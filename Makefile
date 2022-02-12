#------ VIDEO ELEMENTS -----#

#MODULE=m_CLOCK
#MODULE=m_IODEC
#MODULE=m_STAT
##MODULE=m_MEM
##MODULE=m_INT
##MODULE=m_VCNT
##MODULE=m_HCNT
##MODULE=m_BM
##MODULE=m_VTIM
##MODULE=m_PIX

#------ VIDEO MAIN -----#
#MODULE=m_VID

#----- BLITTER DATA ELEMENTS -----#

#MODULE=m_SRCDATA
#MODULE=m_DSTDATA
#MODULE=m_PATDATA
#MODULE=m_COMP
#MODULE=m_LFU

#----- BLITTER STATE ELEMENTS -----#

##MODULE=m_STOUTER
##MODULE=m_STCMD
##MODULE=m_STPARAM
##MODULE=m_STINNER
##MODULE=m_STMEM
##MODULE=m_CMDREGS
##MODULE=m_INNERCNT
##MODULE=m_OUTERCNT

#----- BLITTER ADDR ELEMENTS -----#

##MODULE=m_DSTAREG
##MODULE=m_SRCAREG
##MODULE=m_PCAREG
##MODULE=m_ADDAMUX
##MODULE=m_STEPREG
##MODULE=m_ADDBSEL
##MODULE=m_ADDRADD
##MODULE=m_ADDROUT



#----- BLITTER ELEMENTS -----#

#MODULE=m_DATA
#MODULE=m_STATE
#MODULE=m_ADDR
#MODULE=m_BUSCON

#------ BLITTER MAIN -----#
#MODULE=m_BLIT

#------ DSP ELEMENTS -----#
#MODULE=m_PC
#MODULE=m_PWM
##MODULE=m_DMA
#MODULE=m_PRAM
#MODULE=m_DRAM
#MODULE=m_ADDRESS
#MODULE=m_INSTRUCT
##MODULE=m_ALU
##MODULE=m_INTRUDE

#----- DSP MAIN ----#
#MODULE=m_DSP

#----- SS MAIN ----#
#MODULE=m_SS

#----- top (includes cpu) ----#
#MODULE=m_top

#----- Mister ------#
MODULE=m_konix


#VL_DEBUG=--prof-cfuncs -CFLAGS -DVL_DEBUG
VL_DEBUG=

.PHONY:sim
sim: $(MODULE).vcd

.PHONY:verilate
verilate: .$(MODULE).stamp.verilate

.PHONY:build
build: $(MODULE).obj_dir/Valu

.PHONY:waves
waves: $(MODULE).vcd
	@echo
	@echo "### WAVES ###"
	gtkwave $(MODULE).vcd

$(MODULE).vcd: ./$(MODULE).obj_dir/V$(MODULE)
	@echo
	@echo "### SIMULATING ###"
	@./$(MODULE).obj_dir/V$(MODULE)

./$(MODULE).obj_dir/V$(MODULE): ./$(MODULE).obj_dir/.$(MODULE).stamp.verilate
	@echo
	@echo "### BUILDING SIM ###"
	make CXXFLAGS='-g -DTRACE_FILE=\"$(MODULE).vcd\"' -C $(MODULE).obj_dir -f V$(MODULE).mk V$(MODULE)

./$(MODULE).obj_dir/.$(MODULE).stamp.verilate: $(MODULE).sv tb_$(MODULE).cpp
	@echo
	@echo "### VERILATING ###"
	verilator -y my8088 --Mdir ./$(MODULE).obj_dir -Wall -Wno-UNUSED -Wno-WIDTH -Wno-UNOPTFLAT -Wno-BLKSEQ --trace $(VL_DEBUG) -cc $(MODULE).sv --exe tb_$(MODULE).cpp
	#verilator -y my8088 --Mdir ./$(MODULE).obj_dir -Wall -Wno-UNUSED -Wno-WIDTH -Wno-BLKSEQ --trace $(VL_DEBUG) -cc $(MODULE).sv --exe tb_$(MODULE).cpp
	@touch ./$(MODULE).obj_dir/.$(MODULE).stamp.verilate

.PHONY:lint
lint: $(MODULE).sv
	verilator --lint-only $(MODULE).sv

.PHONY: clean
clean:
	rm -rf ./$(MODULE).obj_dir
	rm -rf $(MODULE).vcd
