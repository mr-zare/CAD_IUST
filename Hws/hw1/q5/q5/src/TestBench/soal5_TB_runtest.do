SetActiveLib -work
comp -include "$dsn\src\q5.vhd" 
comp -include "$dsn\src\TestBench\soal5_TB.vhd" 
asim +access +r TESTBENCH_FOR_soal5 
wave 
wave -noreg a
wave -noreg b
wave -noreg mmul
wave -noreg msum
wave -noreg msub
wave -noreg out1
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\soal5_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_soal5 
