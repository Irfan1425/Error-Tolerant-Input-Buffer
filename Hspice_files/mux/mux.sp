$example HSPICE setup file to choose Wn Wp for min Area*Delay for Cout=100fF

 
.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "mux.pex.netlist"

.option post runlvl=5 

xi GND! VDD! A C OUT mux

vdd VDD! GND! 1.2v 

vb A GND! pwl(0ns 0v 10ns 0v 10.050ns 1.2v 20ns 1.2v 20.050ns 0v 30ns 0v 30.050ns 0v 40ns 0v)
vc C GND! pwl(0ns 0v 10ns 0v 10.050ns 1.2v 20ns 1.2v 20.050ns 1.2v 30ns 1.2v 30.050ns 0v 40ns 0v)
cout out GND! 50f

$transient analysis
.tr 100ps 80ns
$.tr 100ps 40ns sweep K 1 4 0.1 
$.tr 100ps 40ns sweep Wn 1.5e-07 10e-06 1e-07 

.param del_Hmin=6.555u $from layout del_Hmin=H_cell-Wn_min-Wp_min 
.param W_inv_layout=1.88u $from layout 

.measure Area param= 'del_Hmin*W_inv_layout*1e+18' 

.measure tran t_pdr trig v(c) val=0.6v fall=1 targ v(out) val=0.6v rise=1 $measure tlh at 0.6v 
.measure tran t_pdf trig v(a) val=0.6v fall=1 targ v(out) val=0.6v fall=1 $measure tpl at 0.6v 

.measure Delay param='max(t_pdr,t_pdf)*1e+12'
.measure tdiff param='abs(t_pdr-t_pdf)'
 

$ method 1

.measure tran iavg avg i(vdd) from=0 to=40n $average current in one clock cycle
.measure energy param='1.2*iavg*40n*1e+15' $calculate energy in one clock cycle

.measure edp param='abs(Delay*energy)'

.measure ADP param= 'Area*Delay' 

.measure AEDP param= 'Area*edp'

**** choose the Wn, Wp that gives the min ADP  then do then layout accordingly******** 
.end
