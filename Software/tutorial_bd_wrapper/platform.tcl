# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/dev/workspace/tutorial_bd_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/dev/workspace/tutorial_bd_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {tutorial_bd_wrapper}\
-hw {/home/dev/edt_tutorial/tutorial_bd_wrapper.xsa}\
-out {/home/dev/workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {tutorial_bd_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform generate
platform active {tutorial_bd_wrapper}
platform active {tutorial_bd_wrapper}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
bsp setlib -name lwip213 -ver 1.1
bsp setlib -name xiltimer -ver 1.3
bsp write
bsp reload
catch {bsp regenerate}
platform clean
platform generate
platform generate
platform clean
platform generate
