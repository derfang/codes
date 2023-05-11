
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name MUX4x2 -dir "E:/MUX4x2/planAhead_run_1" -part xc3s400pq208-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/MUX4x2/mux4x2.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/MUX4x2} }
set_property target_constrs_file "mux4x2.ucf" [current_fileset -constrset]
add_files [list {mux4x2.ucf}] -fileset [get_property constrset [current_run]]
link_design
