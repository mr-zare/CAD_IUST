SetActiveLib -work
comp -include "$dsn\src\pkg.vhd" 
comp -include "$dsn\src\main.vhd" 
comp -include "$dsn\src\TestBench\sum_ent_TB.vhd" 
asim +access +r TESTBENCH_FOR_sum_ent 
wave 
wave -noreg a
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sum_ent_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sum_ent 
