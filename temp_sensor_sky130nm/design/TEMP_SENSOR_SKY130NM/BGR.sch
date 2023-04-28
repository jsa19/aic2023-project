v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -1690 -1110 -1690 -1070 {
lab=Vdd}
N -1460 -1110 -1460 -1070 {
lab=Vdd}
N -1690 -720 -1690 -590 {
lab=B}
N -1180 -1110 -1180 -1070 {
lab=Vdd}
N -1720 -1040 -1690 -1040 {
lab=Vdd}
N -1720 -1090 -1720 -1040 {
lab=Vdd}
N -1720 -1090 -1690 -1090 {
lab=Vdd}
N -1460 -1040 -1420 -1040 {
lab=Vdd}
N -1420 -1090 -1420 -1040 {
lab=Vdd}
N -1460 -1090 -1420 -1090 {
lab=Vdd}
N -1180 -1040 -1140 -1040 {
lab=Vdd}
N -1140 -1090 -1140 -1040 {
lab=Vdd}
N -1180 -1090 -1140 -1090 {
lab=Vdd}
N -1690 -530 -1690 -470 {
lab=Vss}
N -1690 -470 -1180 -470 {
lab=Vss}
N -1180 -530 -1180 -470 {
lab=Vss}
N -1460 -530 -1460 -470 {
lab=Vss}
N -1760 -560 -1730 -560 {
lab=Vss}
N -1760 -560 -1760 -490 {
lab=Vss}
N -1760 -490 -1690 -490 {
lab=Vss}
N -1530 -560 -1500 -560 {
lab=Vss}
N -1530 -560 -1530 -500 {
lab=Vss}
N -1530 -500 -1460 -500 {
lab=Vss}
N -1250 -560 -1220 -560 {
lab=Vss}
N -1250 -560 -1250 -500 {
lab=Vss}
N -1250 -500 -1180 -500 {
lab=Vss}
N -1270 -1040 -1220 -1040 {
lab=A}
N -1460 -600 -1460 -590 {
lab=#net1}
N -1180 -610 -1180 -590 {
lab=#net2}
N -1690 -1010 -1690 -720 {
lab=B}
N -1650 -1040 -1500 -1040 {
lab=A}
N -1460 -1010 -1460 -660 {
lab=C}
N -1690 -710 -1600 -710 {
lab=B}
N -1600 -740 -1600 -710 {
lab=B}
N -1560 -710 -1460 -710 {
lab=C}
N -1560 -740 -1560 -710 {
lab=C}
N -1690 -1110 -1180 -1110 {
lab=Vdd}
N -1180 -1010 -1180 -670 {
lab=Vout}
C {sky130_fd_pr/pfet_01v8.sym} -1670 -1040 0 1 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} -1480 -1040 0 0 {name=M2
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
C {sky130_fd_pr/pnp_05v5.sym} -1710 -560 0 0 {name=Q1
model=pnp_05v5_W3p40L3p40
m=1
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} -1480 -560 0 0 {name=Q2
model=pnp_05v5_W3p40L3p40
m=8
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} -1200 -560 0 0 {name=Q3
model=pnp_05v5_W3p40L3p40
m=1
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -1200 -1040 0 0 {name=M3
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
C {devices/res.sym} -1460 -630 0 0 {name=R1
value=5.3k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} -1180 -640 0 0 {name=R2
value=48k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -1580 -1040 1 0 {name=p1 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -1690 -710 2 1 {name=p2 sig_type=std_logic lab=B}
C {devices/lab_pin.sym} -1460 -710 2 0 {name=p3 sig_type=std_logic lab=C}
C {devices/lab_pin.sym} -1270 -1040 1 0 {name=p4 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} -1180 -880 2 0 {name=p7 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} -1440 -1110 1 0 {name=p9 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -1390 -470 1 0 {name=p5 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -1510 -890 0 1 {name=p6 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} -1650 -890 0 0 {name=p8 sig_type=std_logic lab=Vss}
C {devices/ipin.sym} -910 -820 0 0 {name=p13 lab=Vdd}
C {devices/ipin.sym} -910 -780 0 0 {name=p14 lab=Vss}
C {devices/lab_pin.sym} -1620 -740 0 0 {name=p15 sig_type=std_logic lab=Ib}
C {devices/ipin.sym} -910 -750 0 0 {name=p16 lab=Ib}
C {devices/opin.sym} -930 -720 0 0 {name=p17 lab=Vout}
C {TEMP_SENSOR_SKY130NM/OTA.sym} -1580 -890 1 1 {name=x1}
