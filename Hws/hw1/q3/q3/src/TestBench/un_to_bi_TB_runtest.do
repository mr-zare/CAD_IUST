SetActiveLib -work
comp -include "$dsn\src\main.vhd" 
comp -include "$dsn\src\TestBench\un_to_bi_TB.vhd" 
asim +access +r TESTBENCH_FOR_un_to_bi 
wave 
wave -noreg inp
wave -noreg outp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\un_to_bi_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_un_to_bi 
