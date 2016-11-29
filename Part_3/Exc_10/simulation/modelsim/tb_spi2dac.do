add wave -position end  CLOCK_50
add wave -position end -hexadecimal SW
add wave -position end clk_div
add wave -position end  DAC_SDI
add wave -position end  DAC_CS
add wave -position end  DAC_SCK
add wave -position end  DAC_LD
force sysclk 1 0, 0 10ns -r 20ns
force data_in 10'h23b
force load 0
run 200ns
force load 1
run 400ns
force load 0
run 20us


