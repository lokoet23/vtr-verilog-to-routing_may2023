yosys -import



plugin -i parmys

yosys -import



read_verilog -nomem2reg +/parmys/vtr_primitives.v

setattr -mod -set keep_hierarchy 1 single_port_ram

setattr -mod -set keep_hierarchy 1 dual_port_ram



puts "Using parmys as partial mapper"



parmys_arch -a /home/endri-admin/Desktop/VTR_forks/vtr-verilog-to-routing_may2023/vtr_work/vtr_out_dir/my_multiplier_dir/k6FracN10LB_mem20K_complexDSP_nonDedLinks_customSB_22nm.xml



if {$env(PARSER) == "surelog" } {

	puts "Using Yosys read_uhdm command"

	plugin -i systemverilog

	yosys -import

	read_uhdm -debug my_multiplier.v

} elseif {$env(PARSER) == "system-verilog" } {

	puts "Using Yosys read_systemverilog command"

	plugin -i systemverilog

	yosys -import

	read_systemverilog -debug my_multiplier.v

} elseif {$env(PARSER) == "default" } {

	puts "Using Yosys read_verilog command"

	read_verilog -sv -nolatches my_multiplier.v

} else {

	error "Invalid PARSER"

}



# Check that there are no combinational loops

scc -select

select -assert-none %

select -clear



hierarchy -check -auto-top -purge_lib



opt_expr

opt_clean

check

opt -nodffe -nosdff

procs -norom

fsm

opt

wreduce

peepopt

opt_clean

share



opt -full

memory -nomap

flatten



opt -full



techmap -map +/parmys/adff2dff.v

techmap -map +/parmys/adffe2dff.v

techmap -map +/parmys/aldff2dff.v

techmap -map +/parmys/aldffe2dff.v



opt -full



#stat



parmys -a /home/endri-admin/Desktop/VTR_forks/vtr-verilog-to-routing_may2023/vtr_work/vtr_out_dir/my_multiplier_dir/k6FracN10LB_mem20K_complexDSP_nonDedLinks_customSB_22nm.xml -nopass -c odin_config.xml



opt -full



techmap 

opt -fast



dffunmap

opt -fast -noff



#autoname



tee -o /dev/stdout stat



hierarchy -check -auto-top -purge_lib



write_blif -true + vcc -false + gnd -undef + unconn -blackbox my_multiplier.parmys.blif

