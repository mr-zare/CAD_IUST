SetActiveLib -work
comp -include "$dsn\src\maain.vhd" 
comp -include "$dsn\src\TestBench\decussate_TB.vhd" 
asim +access +r TESTBENCH_FOR_decussate 
wave 
wave -noreg Input
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\decussate_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_decussate 
