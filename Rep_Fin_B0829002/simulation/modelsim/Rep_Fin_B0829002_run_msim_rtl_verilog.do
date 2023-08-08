transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/Top.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/Rep_Lab_07.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/registerfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/funtion_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/CPU.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/IMEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002 {C:/Users/lms02/OneDrive/Desktop/Computer_Organization_Experiment/Rep_Fin_B0829002/DMEM.v}

