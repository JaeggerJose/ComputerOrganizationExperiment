transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002/Rep_Lab_06_B0829002.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Lab_06_B0829002/sib.v}

