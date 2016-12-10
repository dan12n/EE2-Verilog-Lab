transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/dm2515/Digital\ 2/Part_3/Exc_10 {//icnas2.cc.ic.ac.uk/dm2515/Digital 2/Part_3/Exc_10/spi2dac.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/dm2515/Digital\ 2/Part_3/Exc_10 {//icnas2.cc.ic.ac.uk/dm2515/Digital 2/Part_3/Exc_10/EX10_top.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/dm2515/Digital\ 2/Part_3/Exc_10 {//icnas2.cc.ic.ac.uk/dm2515/Digital 2/Part_3/Exc_10/divider_5000.v}

