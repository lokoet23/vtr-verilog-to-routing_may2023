#!/bin/bash

VTR_ROOT=/home/endri-admin/Desktop/VTR_forks/vtr-verilog-to-routing_may2023

# Visualize circuit VPR


$VTR_ROOT/vpr/vpr $VTR_ROOT/vtr_work/my_arch_files_xml/k6FracN10LB_mem20K_complexDSP_nonDedLinks_customSB_22nm.xml \
$VTR_ROOT/vtr_work/vtr_out_dir/my_multiplier_dir/my_multiplier --circuit_file \
$VTR_ROOT/vtr_work/vtr_out_dir/my_multiplier_dir/my_multiplier.pre-vpr.blif --route_chan_width \
300 --device fixed_layout_custom --analysis --disp on --sdc_file $VTR_ROOT/vtr_work/my_verilog_designs/cut_IO_maximize_freq.sdc