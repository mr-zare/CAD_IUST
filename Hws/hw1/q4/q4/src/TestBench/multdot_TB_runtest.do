SetActiveLib -work
comp -include "$dsn\src\main.vhd" 
comp -include "$dsn\src\TestBench\multdot_TB.vhd" 
asim +access +r TESTBENCH_FOR_multdot 
wave 
wave -noreg A
wave -noreg B
wave -noreg outp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\multdot_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_multdot 
