transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_07 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_07/Rep_Lab_07.v}

