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
##MODULE=m_COMP
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
MODULE=m_BLIT

.PHONY:sim
sim: trace.vcd

.PHONY:verilate
verilate: .stamp.verilate

.PHONY:build
build: obj_dir/Valu

.PHONY:waves
waves: trace.vcd
	@echo
	@echo "### WAVES ###"
	gtkwave trace.vcd

trace.vcd: ./obj_dir/V$(MODULE)
	@echo
	@echo "### SIMULATING ###"
	@./obj_dir/V$(MODULE)

./obj_dir/V$(MODULE): .stamp.verilate
	@echo
	@echo "### BUILDING SIM ###"
	make -C obj_dir -f V$(MODULE).mk V$(MODULE)

.stamp.verilate: $(MODULE).sv tb_$(MODULE).cpp
	@echo
	@echo "### VERILATING ###"
	verilator -Wall -Wno-unused --trace -cc $(MODULE).sv --exe tb_$(MODULE).cpp
	@touch .stamp.verilate

.PHONY:lint
lint: $(MODULE).sv
	verilator --lint-only $(MODULE).sv

.PHONY: clean
clean:
	rm -rf .stamp.*;
	rm -rf ./obj_dir
	rm -rf trace.vcd
