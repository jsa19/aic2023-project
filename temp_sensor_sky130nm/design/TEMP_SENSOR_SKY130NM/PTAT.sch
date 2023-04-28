v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -350 -730 -350 -690 {
lab=Vdd}
N -120 -730 -120 -690 {
lab=Vdd}
N -380 -660 -350 -660 {
lab=Vdd}
N -380 -710 -380 -660 {
lab=Vdd}
N -380 -710 -350 -710 {
lab=Vdd}
N -120 -660 -80 -660 {
lab=Vdd}
N -80 -710 -80 -660 {
lab=Vdd}
N -120 -710 -80 -710 {
lab=Vdd}
N -350 -180 -350 -120 {
lab=Vss}
N -120 -180 -120 -120 {
lab=Vss}
N -420 -210 -390 -210 {
lab=Vss}
N -420 -210 -420 -140 {
lab=Vss}
N -420 -140 -350 -140 {
lab=Vss}
N -190 -210 -160 -210 {
lab=Vss}
N -190 -210 -190 -150 {
lab=Vss}
N -190 -150 -120 -150 {
lab=Vss}
N -120 -250 -120 -240 {
lab=#net1}
N -350 -120 -120 -120 {
lab=Vss}
N -350 -730 -120 -730 {
lab=Vdd}
N -310 -660 -160 -660 {
lab=OutPtat}
N -350 -630 -350 -240 {
lab=B}
N -120 -630 -120 -310 {
lab=C}
N -350 -330 -260 -330 {}
N -260 -360 -260 -330 {}
N -220 -330 -120 -330 {}
N -220 -360 -220 -330 {}
C {sky130_fd_pr/pfet_01v8.sym} -330 -660 0 1 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} -140 -660 0 0 {name=M2
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
C {sky130_fd_pr/pnp_05v5.sym} -370 -210 0 0 {name=Q1
model=pnp_05v5_W3p40L3p40
m=1
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} -140 -210 0 0 {name=Q2
model=pnp_05v5_W3p40L3p40
m=8
spiceprefix=X
}
C {devices/res.sym} -120 -280 0 0 {name=R1
value=5.3k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -240 -660 1 0 {name=p1 sig_type=std_logic lab=OutPtat}
C {devices/lab_pin.sym} -350 -330 2 1 {name=p2 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} -120 -330 2 0 {name=p3 sig_type=std_logic lab=C}
C {devices/lab_pin.sym} -190 -730 1 0 {name=p9 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -250 -120 1 0 {name=p5 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -170 -510 0 1 {name=p6 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -310 -510 0 0 {name=p8 sig_type=std_logic lab=Vss}
C {devices/ipin.sym} 430 -470 0 0 {name=p13 lab=Vdd}
C {devices/ipin.sym} 430 -430 0 0 {name=p14 lab=Vss}
C {devices/lab_pin.sym} -280 -360 0 0 {name=p15 sig_type=std_logic lab=Ib}
C {devices/ipin.sym} 430 -400 0 0 {name=p16 lab=Ib}
C {devices/opin.sym} 410 -370 0 0 {name=p17 lab=OutPtat}
C {TEMP_SENSOR_SKY130NM/OTA.sym} -240 -510 1 1 {name=x1}
