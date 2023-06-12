---
# README for computer
theme: jekyll-theme-cayman
allowed_elements : 
---
README for computer
===================

To synthesise the VHDL code, add the following files to the project:

* `computer.vhd`
* `alu.vhd`
* `control.vhd`
* `register.vhd`
* `AC.vhd`
* `IR.vhd`
* `AR.vhd`
* `PC.vhd`
* `DR.vhd`
* `RAM.vhd`
* `ROM.vhd`
* `E.vhd`
* `arraymulty.vhd`
* `SC.vhd`
* `FA.vhd`
* `ripple_adder16bit.vhd`
DO <span style="color:red">NOT</span> add `ripple_adder.vhd` to the project.
* `sqrt.vhd` (you also need to add all of the files in the `sqrtsub` folder to the project witch includes:

1. `case.vhd`
2. `fulladder.vhd`
3. `halfadder.vhd`
4. `x_mod.vhd`
5. `y_mod.vhd`

To simulate the VHDL code, do the following:

1. Reset the simulation.
2. After starting the simulation, force a clock signal to
clk (it's better to have it start with a 0).
3. change the colour of the signal: <span style="color:cyan">AC_out</span> since it is the signal we need to monitor to see the functionality of the computer.  
4. Run the simulation for  4 * "Number of instructions"
5. $AC_{out}$ will show everyting as it's the main regester for every instruction.
