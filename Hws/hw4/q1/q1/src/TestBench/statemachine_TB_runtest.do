SetActiveLib -work
comp -include "$dsn\src\main.vhdl" 
comp -include "$dsn\src\TestBench\statemachine_TB.vhd" 
asim +access +r TESTBENCH_FOR_statemachine 
wave 
wave -noreg input
wave -noreg clk
wave -noreg firstZeroStart
wave -noreg firstZeroEnd
wave -noreg lastZeroStart
wave -noreg lastZeroEnd
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\statemachine_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_statemachine 
