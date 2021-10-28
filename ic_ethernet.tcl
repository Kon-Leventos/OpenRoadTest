set target_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set symbol_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set link_library /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/synopsys/models/saed90nm_typ.db
set search_path /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/rtl/

# create_mw_lib -technology /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Technology_Kit/milkyway/saed90nm_icc_1p9m.tf -mw_reference_library {/usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/gds-as/saed90nm_dv /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Digital_Standard_cell_Library/process/astro/fram/saed90nm} /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/IC_lib -open
open_mw_lib /home/usr/theodoso/Desktop/IC_LIB/

set_tlu_plus_files -max_tluplus /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Technology_Kit/starrcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus -min_tluplus /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Technology_Kit/starrcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus -tech2itf_map /usr/edalib/SAED/v_07292013/SAED90_EDK/SAED_EDK90nm/Technology_Kit/starrcxt/tech2itf.map



import_designs -format verilog -cel eth_top -top eth_top /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/scan_ethernet.v
read_def /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/myscan_ethernet.def

create_clock -period 100 [get_ports {wb_clk_i}]

set_pin_physical_constraints [get_ports {wb_dat_i wb_adr_i wb_sel_i m_wb_dat_i mrxd_pad_i wb_clk_i wb_rst_i wb_we_i wb_cyc_i wb_stb_i m_wb_ack_i m_wb_err_i mtx_clk_pad_i mrx_clk_pad_i mrxdv_pad_i mrxerr_pad_i mcoll_pad_i mcrs_pad_i md_pad_i data_source test_mode data_sourcea test_si1 test_si2 test_si3 test_si4 test_si5 est_si6, test_si7, test_si8, test_se}] -layers {M3} -width 0.05 -depth 0.05 -side 1
set_pin_physical_constraints [get_ports {wb_dat_o m_wb_adr_o m_wb_sel_o m_wb_dat_o mtxd_pad_o wb_ack_o wb_err_o m_wb_we_o m_wb_cyc_o m_wb_stb_o mtxen_pad_o mtxerr_pad_o mdc_pad_o md_pad_o md_padoe_o int_o test_so2 test_so3 test_so4 test_so5 test_so6 test_so7}] -layers {M3} -width 0.05 -depth 0.05 -side 3
set_ignored_layers -min_routing_layer M1 -max_routing_layer M6

create_floorplan -core_utilization 0.85 -left_io2core 10 -bottom_io2core 10 -right_io2core 10 -top_io2core 10

derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -create_ports top
derive_pg_connection -all
create_rectangular_rings -nets VDD -offsets absolute -bottom_offset 2 -top_offset 2 -left_offset 2 -right_offset 2 -bottom_segment_width 1 -top_segment_width 1 -left_segment_width 1 -right_segment_width 1
create_rectangular_rings -nets VSS -offsets absolute -bottom_offset 4 -top_offset 4 -left_offset 4 -right_offset 4 -bottom_segment_width 1 -top_segment_width 1 -left_segment_width 1 -right_segment_width 1
create_power_straps -direction vertical -start_at 20 -num_placement_strap 198 -increment_x_or_y 20 -nets {VDD} -layer M5 -width 0.5
create_power_straps -direction vertical -start_at 30 -num_placement_strap 197 -increment_x_or_y 20 -nets {VSS} -layer M4 -width 0.5


redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_create.txt {create_fp_placement -effort low -congestion_driven}
redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_legalize.txt {legalize_placement -effort low -incremental}

redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_standard.txt {preroute_standard_cells}

redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_preroute.txt {preroute_instances}



redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_place.txt {place_opt}

redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_clock.txt {clock_opt}


redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_auto.txt {route_auto -effort low}
redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_route.txt {route_opt -effort low}


redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_clock_tree.txt {report_clock_tree}
redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_timing.txt {report_timing}


redirect -tee /home/usr/theodoso/Desktop/BenchmarkCores_XYNOS/OpenCores/ethernet/report_physical.txt {report_design -physical}

