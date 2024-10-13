SetActiveLib -work
comp -include "$dsn\src\main.vhdl" 
comp -include "$dsn\src\merge.vhdl" 
comp -include "$dsn\src\TestBench\main_TB.vhd" 
asim +access +r TESTBENCH_FOR_main 
wave 
wave -noreg reset
wave -noreg input
wave -noreg clk
wave -noreg result
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\main_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_main 
