#!/bin/bash

VTR_ROOT=/home/endri-admin/Desktop/VTR_forks/vtr-verilog-to-routing_may2023

# run VTR flow

$VTR_ROOT/vtr_flow/scripts/run_vtr_flow.py  $VTR_ROOT/vtr_work/my_verilog_designs/my_multiplier.v \
$VTR_ROOT/vtr_work/my_arch_files_xml/k6FracN10LB_mem20K_complexDSP_nonDedLinks_customSB_22nm.xml -temp_dir \
$VTR_ROOT/vtr_work/vtr_out_dir/my_multiplier_dir  --route_chan_width \
300 --device fixed_layout_custom --sdc_file $VTR_ROOT/vtr_work/my_verilog_designs/cut_IO_maximize_freq.sdc 



