set_property SRC_FILE_INFO {cfile:/home/dev/edt_tutorial/edt_tutorial.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_rst_ps7_0_50M_0/tutorial_bd_rst_ps7_0_50M_0.xdc rfile:../../../edt_tutorial.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_rst_ps7_0_50M_0/tutorial_bd_rst_ps7_0_50M_0.xdc id:1 order:EARLY scoped_inst:U0} [current_design]
current_instance U0
set_property src_info {type:SCOPED_XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-11} -user "proc_sys_reset" -desc "Timing uncritical paths" -tags "1171415" -scope -internal -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */ACTIVE_LOW_AUX.ACT_LO_AUX/GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to}]]
