v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -440 -90 -320 -90 {
lab=Vop}
N -280 -60 -280 70 {
lab=Vc}
N -440 -260 -80 -260 {
lab=Vref}
N -80 -260 -80 -120 {
lab=Vref}
N -80 -120 -30 -120 {
lab=Vref}
N -280 10 -90 10 {
lab=Vc}
N -90 -80 -90 10 {
lab=Vc}
N -90 -80 -30 -80 {
lab=Vc}
N 210 -100 310 -100 {
lab=OutComp}
N 480 -100 520 -100 {
lab=#net1}
N 520 -100 520 100 {
lab=#net1}
N -120 100 520 100 {
lab=#net1}
C {sky130_fd_pr/pfet_01v8.sym} -300 -90 0 0 {name=M2
L=1
W=5
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -740 -90 2 1 {name=p3 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -740 -260 2 1 {name=p1 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 80 -170 2 1 {name=p2 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 80 -30 2 1 {name=p4 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -740 -240 2 1 {name=p5 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -740 -70 2 1 {name=p6 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -740 -220 2 1 {name=p7 sig_type=std_logic lab=Ib}
C {devices/lab_pin.sym} -740 -50 2 1 {name=p8 sig_type=std_logic lab=Ib}
C {devices/lab_pin.sym} -30 -60 2 1 {name=p9 sig_type=std_logic lab=Ib}
C {devices/lab_pin.sym} -280 -120 3 1 {name=p10 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -280 -90 0 1 {name=p11 sig_type=std_logic lab=Vdd}
C {devices/capa.sym} -280 100 0 0 {name=C0
m=1
value=200f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -280 130 2 1 {name=p12 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -80 -210 0 1 {name=p13 sig_type=std_logic lab=Vref}
C {devices/lab_pin.sym} -280 10 2 1 {name=p16 sig_type=std_logic lab=Vc}
C {devices/lab_pin.sym} 250 -100 3 1 {name=p17 sig_type=std_logic lab=OutComp}
C {devices/ipin.sym} 290 -290 0 0 {name=p18 lab=Vdd}
C {devices/ipin.sym} 290 -250 0 0 {name=p19 lab=Vss}
C {devices/ipin.sym} 290 -220 0 0 {name=p20 lab=Ib}
C {devices/opin.sym} 270 -190 0 0 {name=p21 lab=f}
C {sky130_fd_pr/nfet_01v8.sym} -140 100 0 1 {name=M1
L=0.3
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -160 70 0 0 {name=p22 sig_type=std_logic lab=Vc}
C {devices/lab_pin.sym} -160 130 2 1 {name=p24 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -160 100 2 1 {name=p25 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -380 -90 3 1 {name=p34 sig_type=std_logic lab=Vop}
C {devices/lab_pin.sym} 380 -150 2 1 {name=p27 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 380 -50 2 1 {name=p28 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} 520 30 0 1 {name=p35 sig_type=std_logic lab=f}
C {TEMP_SENSOR_SKY130NM/BGR.sym} -590 -240 0 0 {name=x1}
C {TEMP_SENSOR_SKY130NM/PTAT.sym} -590 -70 0 0 {name=x2}
C {TEMP_SENSOR_SKY130NM/COMPARATOR.sym} 120 -100 0 0 {name=x3}
C {TEMP_SENSOR_SKY130NM/INV.sym} 460 -100 0 0 {name=x4}
