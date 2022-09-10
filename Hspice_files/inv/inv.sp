$example HSPICE setup file to choose Wn Wp for min Area*Delay for Cout=100fF

 
.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "inv.pex.netlist"

.option post runlvl=5 

xi GND! OUT VDD! IN inv

vdd VDD! GND! 1.2v 
vin IN GND! pwl(0ns 1.2v 1ns 1.2v 1.05ns 0v 15ns 0v 15.05ns 1.2v 30ns 1.2v) 
cout OUT GND! 75f  $ note that min ADP would change with Cout 

$transient analysis
.tr 100ps 40ns
$.tr 100ps 40ns sweep K 1 4 0.1 
$.tr 100ps 40ns sweep Wn 1.5e-07 10e-06 1e-07 

.param del_Hmin=6.555u 
.param W_inv_layout=0.7u $from layout 
.measure tran trise trig v(IN) val=0.6v fall=1 targ v(OUT) val=0.6v rise=1 $measure tlh at 0.6v 
.measure tran tfall trig v(IN) val=0.6v rise=1 targ v(OUT) val=0.6v fall=1 $measure tpl at 0.6v 

.measure tdiff param='abs(trise-tfall)'
.measure Delay param='abs(trise+tfall)/2*1e+12' 
.measure Area param= 'del_Hmin*W_inv_layout*1e+18' 

$ method 1

.measure tran iavg avg i(vdd) from=0 to=30n $average current in one clock cycle
.measure energy param='1.2*iavg*30n*1e+15' $calculate energy in one clock cycle

.measure edp param='abs(delay*energy)'


.measure ADP param= 'Area*Delay' 

.measure AEDP param= 'Area*edp'

**** choose the Wn, Wp that gives the min ADP  then do then layout accordingly******** 
.end
