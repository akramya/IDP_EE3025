# IDP_EE3025
This repository has the codes and instructions for our IDP implementation.

First of all, follow the instructions given in the pdf to make the necessary installations for running verilog code. https://github.com/gadepall/EE5811/blob/master/icoboard_fpga/gvv_hemanth_icoboard.pdf

Download the .v and .pcf files and put them in the same directory where you made the installations.

Open the terminal, go to the directory you have put your files and run the command 'make v_fname=production_line_control'

Give the inputs and outputs to and from the ICO from and to the arduino to the respective ports mentioned in the .pcf

Upload the .ino file to arduino to see the display on LCD display
