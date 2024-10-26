
## GENEYS2 1-Lane CHS-ARA by mp/chs-ara
Bit-1:	<cheshire_top_xilinx_v1_genesys2.bit>
BOARD:	GENESYS2
PROJECT: CHESHIRE-ARA
FORK: MP-17
BRANCH: mp/chs-ara
CONFIG: unsupportd 1-Lane (128 VLEN)
MODS: bug fixes, vga BW, dispatcheer-illegal-cast-4 lines and 1-Lane fixes
NOTES:  Try with mp-17 or MaistoV fork images. Prints no UART-but CHECK
VIVADO:2019.1

## VCU128 default, all clean bit by mp-17
Bit-2:	<cheshire_ara_2_vcu128_default_mp_chs_ara.dir>
BOARD:	VCU128
PROJECT: cheshire ara 
FORK: all mp-17 forks
BRANCH: mp/chs-ara
CONFIG: all default (bug fixes)
MODS:  no MODS
NOTES: VIO for reset, should work with toolchains provided image, WNS=+0.026
VIVADO:2020.1

## VCU128 default, all clean bit by PR160
Bit-2:	<cheshire-160-vcu128-all-deafult-clean>
BOARD:	vcu128
PROJECT: cheshire
FORK:  none
BRANCH: mp/ara-pulpv1-os-rebase PULL 160
CONFIG: all default and clean
MODS: ara-dispatcher illegast cast fix
NOTES: should work just fine.

## VCU118 default, all clean bit, PR160, m.rb-pull manually patched
Bit-2:	<cheshire_ara_vcu118_default_mrb>
BOARD:	vcu118
PROJECT:mrb pull ARA_cheshire
FORK: mrb patched into chesihre/rebase
BRANCH: mp/pulpv1-os-rebase
CONFIG: default with tweaks 
MODS: fixes only
NOTES: should work 

## VCU118 default, all clean bit, PR160, mrb default
Bit-2:	<cheshire_ara_vcu118_default_mrb_default>
BOARD:	vcu118
PROJECT:mrb pull ARA_cheshire
FORK: mrb
BRANCH: mp/pulpv1-os
CONFIG: default with tweaks 
MODS: fixes only
NOTES: should work 

## GENESYS2 mp-17 1-Lane, with UART-verbose bootrom
Bit-2:	<filename.bit>
BOARD:
PROJECT:
FORK:
BRANCH:
CONFIG:
MODS:
NOTES:
