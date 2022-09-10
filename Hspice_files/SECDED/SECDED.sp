$SECDED
 
.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "SECDED.pex.netlist"

.option post runlvl=5 

xi GND! VDD! C0 A2 C2 A1 A3 A0 P C1 ERR A02 A01 A00 A03 SECDED

vdd VDD! GND! 1.2v 

vp p gnd! pwl(0ns 0v 1ns 0v 1.05ns 1.2v)
vc0 c0 gnd! pwl(0ns 0v 1ns 0v 1.05ns 0v)
vc1 c1 gnd! pwl(0ns 0v 1ns 0v 1.05ns 0v)
va0 a0 gnd! pwl(0ns 0v 1ns 0v 1.05ns 1.2v)
vc2 c2 gnd! pwl(0ns 0v 1ns 0v 1.05ns 0v)
va1 a1 gnd! pwl(0ns 0v 1ns 0v 1.05ns 1.2v)
va2 a2 gnd! pwl(0ns 0v 1ns 0v 1.05ns 1.2v)
va3 a3 gnd! pwl(0ns 0v 1ns 0v 1.05ns 1.2v)

.tr 10ps 4ns

.END
