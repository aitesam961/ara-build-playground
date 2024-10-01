This is a working version of ARA+INVAL_Filter.
It exposes accelerator_dispatcher interface and AXI interface to IOs.
Synthesizes correctly.
All the relevant files are under sources.

If INVAL_Filter has to be used, 

`define INVAL_ENABLE

To add includes in the correct path, use
add-includes.tcl 
