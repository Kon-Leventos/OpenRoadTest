set target_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set symbol_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set link_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set search_path /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/

define_design_lib DC_LIB -path /home/usr/theodoso/Desktop/DC_LIB/

analyze -format verilog -library DC_LIB {/home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_clockgen.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_cop.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_crc.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_defines.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_fifo.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_maccontrol.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_macstatus.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_miim.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_outputcontrol.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_random.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_receivecontrol.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_registers.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_register.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_rxaddrcheck.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_rxcounters.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_rxethmac.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_rxstatem.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_shiftreg.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_spram_256x32.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_top.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_transmitcontrol.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_txcounters.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_txethmac.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_txstatem.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/eth_wishbone.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/timescale.v /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/xilinx_dist_ram_16x32.v }
elaborate eth_top -architecture verilog -library DC_LIB -update

create_clock -period 10 [get_ports {clk}]
set_scan_configuration -style multiplexed_flip_flop -chain_count 8
set_dft_configuration -fix_set enable -fix_reset enable -fix_clock enable

set_dft_signal -view spec -type ScanClock -port [get_ports {S_CLK}]
set_dft_signal -view spec -type Reset -port [get_ports {S_RST}] -active_state 1
set_dft_signal -view spec -type ScanEnable -port [get_ports {S_ENB}] -active_state 1
set_dft_signal -view spec -type TestMode -port [get_ports {S_TMD}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[0]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[1]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[2]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[3]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[4]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[5]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[6]}]
set_dft_signal -view spec -type ScanDataIn -port [get_ports {S_DTI[7]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[0]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[1]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[2]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[3]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[4]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[5]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[6]}]
set_dft_signal -view spec -type ScanDataOut -port [get_ports {S_DTO[7]}]

set_dft_signal -view spec -type TestData -port [get_ports {S_CLK}]
set_autofix_configuration -type clock -control S_TMD -test_data S_CLK
set_dft_signal -view spec -type TestData -port [get_ports {S_RST}]
set_autofix_configuration -type reset -control S_TMD -test_data S_RST
set_autofix_configuration -type set -control S_TMD -test_data S_RST

report_dft_signal
create_test_protocol
compile -scan -map_effort low -exact_map
report_scan_state
dft_drc
preview_dft
insert_dft
compile -scan -map_effort high -exact_map
redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/scan_ethernet.txt {report_scan_path}
dft_drc -coverage_estimate


write_scan_def -output /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/myscan_ethernet.def

write -hierarchy -format ddc -output /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/ethernet_with_scandef.ddc

write -hierarchy -format verilog -output /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/scan_ethernet.v
