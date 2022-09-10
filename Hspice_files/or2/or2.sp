$OR2

.include "/proj/cad/library/mosis/GF65_LPe/cmos10lpe_CDS_oa_dl064_11_20160415/models/YI-SM00030/Hspice/models/design.inc"
.include "or2.pex.netlist"

.option post runlvl=5

xi GND! OUT VDD! A B or2

vdd VDD! GND! 1.2v
va A GND! pwl(0ns 0v 10ns 0v 10.050ns 1.2v 20ns 1.2v 20.050ns 0v 30ns 0v 30.050ns 0v 40ns 0v)
vb B GND! pwl(0ns 0v 10ns 0v 10.050ns 1.2v 20ns 1.2v 20.050ns 1.2v 30ns 1.2v 30.050ns 0v 40ns 0v)
cout OUT GND! 100f

$.param Wn = 0.591e-6
$.param k = 7.87

$transient analysis
.tr 100ps 40ns
$.tr 100ps 40ns sweep K 1 15 0.1 
$.tr 100ps 40ns sweep Wn 1.5e-07 10e-06 1e-08 

.param del_Hmin=6.422u $from layout del_Hmin=H_cell-Wn_min-Wp_min 
.param W_inv_layout=1.738u $from layout 

.measure tran t_pdr trig v(B) val=0.6v rise=1 targ v(OUT) val=0.6v rise=1 $measure tlh at 0.6v 
.measure tran t_pdf trig v(B) val=0.6v fall=1 targ v(OUT) val=0.6v fall=1 $measure tpl at 0.6v 

.measure tdiff param='abs(t_pdr-t_pdf)' $calculate delay difference

.measure Delay param='max(t_pdr,t_pdf)*1e+12'
.measure Area param= 'del_Hmin*W_inv_layout*1e+18' 


$ method 1

.measure tran iavg avg i(vdd) from=0 to=40n $average current in one clock cycle
.measure energy param='1.2*iavg*40n*1e+15' $calculate energy in one clock cycle

.measure edp param='abs(Delay*energy)'


.measure ADP param= 'Area*Delay' 

.measure AEDP param= 'Area*edp'

**** choose the Wn, Wp that gives the min ADP  then do then layout accordingly******** 
.end
