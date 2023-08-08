onerror {exit -code 1}
vlib work
vlog -work work Task0930.vo
vlog -work work Waveform.vwf.vt
vsim -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.Task0930_vlg_vec_tst
vcd file -direction Task0930.msim.vcd
vcd add -internal Task0930_vlg_vec_tst/*
vcd add -internal Task0930_vlg_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
