$DECODER

.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "decoder.pex.netlist"

xi VDD! GND! P C0 C1 A0 A2 C2 A1 CLK IN RST P_BAR C0_BAR C1_BAR
+ A0_BAR C2_BAR A3 A3_BAR A1_BAR A2_BAR decoder

.option post runlvl=5

.param Tc=800p $CLK preiod 
.param Di=0p  $Input delay after rising edge of clock

$xi gnd! Q vdd! CLK R D design  $instantiate your design

vdd VDD! GND! 1.2v

vrst rst GND! PWL(0ps 1.2v 300ps 1.2v 350ps 0v 600ps 0v 650ps 1.2v) 
vclk clk GND! PULSE(0v 1.2v 0ps 50ps 50ps 'Tc/2-50ps' Tc)

$Expected Output:               D1:1011-D2:1011

vin_ready in_ready GND! PWL(0ps 0v Di 0v 'Di+0*Tc+50ps' 0v 'Di+1*Tc' 0v 'Di+1*Tc+50ps' 0v 'Di+2*Tc' 0v 'Di+2*Tc+50ps' 0v 'Di+3*Tc' 0v 'Di+3*Tc+50ps' 1.2v 'Di+4*Tc' 1.2v 'Di+4*Tc+50ps' 0v 'Di+5*Tc' 0v 'Di+5*Tc+50ps' 0v 'Di+6*Tc' 0v 'Di+6*Tc+50ps' 0v 'Di+7*Tc' 0v 'Di+7*Tc+50ps' 0v 'Di+8*Tc' 0v 'Di+8*Tc+50ps' 0v 'Di+9*Tc' 0v 'Di+9*Tc+50ps' 0v 'Di+10*Tc' 0v 'Di+10*Tc+50ps' 0v 'Di+11*Tc' 0v 'Di+11*Tc+50ps' 0v 'Di+12*Tc' 0v 'Di+12*Tc+50ps' 0v 'Di+13*Tc' 0v 'Di+13*Tc+50ps' 1.2v 'Di+14*Tc' 1.2v 'Di+14*Tc+50ps' 0v 'Di+15*Tc' 0v 'Di+15*Tc+50ps' 0v 'Di+16*Tc' 0v 'Di+16*Tc+50ps' 0v 'Di+17*Tc' 0v 'Di+17*Tc+50ps' 0v 'Di+18*Tc' 0v 'Di+18*Tc+50ps' 0v 'Di+19*Tc' 0v 'Di+19*Tc+50ps' 0v 'Di+20*Tc' 0v 'Di+20*Tc+50ps' 0v 'Di+21*Tc' 0v)
vin in GND! PWL(0ps 0v Di 0v 'Di+0*Tc+50ps' 0v 'Di+1*Tc' 0v 'Di+1*Tc+50ps' 0v 'Di+2*Tc' 0v 'Di+2*Tc+50ps' 0v 'Di+3*Tc' 0v 'Di+3*Tc+50ps' 0v 'Di+4*Tc' 0v 'Di+4*Tc+50ps' 1.2v 'Di+5*Tc' 1.2v 'Di+5*Tc+50ps' 0v 'Di+6*Tc' 0v 'Di+6*Tc+50ps' 1.2v 'Di+7*Tc' 1.2v 'Di+7*Tc+50ps' 0v 'Di+8*Tc' 0v 'Di+8*Tc+50ps' 1.2v 'Di+9*Tc' 1.2v 'Di+9*Tc+50ps' 0v 'Di+10*Tc' 0v 'Di+10*Tc+50ps' 1.2v 'Di+11*Tc' 1.2v 'Di+11*Tc+50ps' 0v 'Di+12*Tc' 0v 'Di+12*Tc+50ps' 0v 'Di+13*Tc' 0v 'Di+13*Tc+50ps' 0v 'Di+14*Tc' 0v 'Di+14*Tc+50ps' 0v 'Di+15*Tc' 0v 'Di+15*Tc+50ps' 0v 'Di+16*Tc' 0v 'Di+16*Tc+50ps' 1.2v 'Di+17*Tc' 1.2v 'Di+17*Tc+50ps' 0v 'Di+18*Tc' 0v 'Di+18*Tc+50ps' 1.2v 'Di+19*Tc' 1.2v 'Di+19*Tc+50ps' 0v 'Di+20*Tc' 0v 'Di+20*Tc+50ps' 1.2v 'Di+21*Tc' 1.2v)

.tr 10ps '23*Tc'  $Run for number of input clock cycles plus 2

.END
