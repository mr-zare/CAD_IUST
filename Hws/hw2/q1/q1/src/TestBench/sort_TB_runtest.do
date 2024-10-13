SetActiveLib -work
comp -include "$dsn\src\main.vhd" 
comp -include "$dsn\src\TestBench\sort_TB.vhd" 
asim +access +r TESTBENCH_FOR_sort 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sort_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sort 
