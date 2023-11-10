# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/dev/Projects/Plantonomy/Software/tutorial_system/_ide/scripts/systemdebugger_tutorial_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/dev/Projects/Plantonomy/Software/tutorial_system/_ide/scripts/systemdebugger_tutorial_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A77FB1A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351A77FB1A-13722093-0"}
fpga -file /home/dev/Projects/Plantonomy/Software/tutorial/_ide/bitstream/tutorial_bd_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/dev/Projects/Plantonomy/Software/tutorial_bd_wrapper/export/tutorial_bd_wrapper/hw/tutorial_bd_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/dev/Projects/Plantonomy/Software/tutorial/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/dev/Projects/Plantonomy/Software/tutorial/Debug/tutorial.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
