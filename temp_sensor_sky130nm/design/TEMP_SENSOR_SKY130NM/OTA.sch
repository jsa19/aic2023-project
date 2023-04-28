v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -90 -90 -90 -70 {
lab=#net1}
N -90 -90 80 -90 {
lab=#net1}
N 80 -90 80 -70 {
lab=#net1}
N -10 -130 -10 -90 {
lab=#net1}
N -90 -10 -90 90 {
lab=#net2}
N 80 -10 80 90 {
lab=#net3}
N -90 150 -90 200 {
lab=Vss}
N -90 200 80 200 {
lab=Vss}
N 80 150 80 200 {
lab=Vss}
N 0 200 0 240 {
lab=Vss}
N -50 120 40 120 {
lab=#net2}
N -90 60 -20 60 {
lab=#net2}
N -20 60 -20 120 {
lab=#net2}
N -250 -220 -250 -190 {
lab=Vdd}
N -250 -220 300 -220 {
lab=Vdd}
N 300 -220 300 -190 {
lab=Vdd}
N -10 -220 -10 -190 {
lab=Vdd}
N 300 -130 300 80 {
lab=Vout}
N 300 140 300 210 {
lab=Vss}
N -250 -130 -250 -90 {
lab=Ib}
N -320 -160 -290 -160 {
lab=Ib}
N -320 -160 -320 -110 {
lab=Ib}
N -320 -110 -250 -110 {
lab=Ib}
N -280 -110 -280 -70 {
lab=Ib}
N -280 -70 -130 -70 {
lab=Ib}
N -130 -160 -130 -70 {
lab=Ib}
N -130 -160 -50 -160 {
lab=Ib}
N -80 -160 -80 -110 {
lab=Ib}
N -80 -110 220 -110 {
lab=Ib}
N 220 -160 220 -110 {
lab=Ib}
N 220 -160 260 -160 {
lab=Ib}
N 120 -40 140 -40 {
lab=Vip}
N -150 -40 -130 -40 {
lab=Vin}
N 270 50 300 50 {
lab=Vout}
N 300 -30 350 -30 {
lab=Vout}
N 10 -270 10 -220 {
lab=Vdd}
N 110 50 110 110 {
lab=#net3}
N 110 110 260 110 {
lab=#net3}
N -90 -70 -90 -40 {
lab=#net1}
N 80 -70 80 -40 {
lab=#net1}
N -90 120 -90 150 {
lab=Vss}
N 80 120 80 150 {
lab=Vss}
N -10 -190 -10 -160 {
lab=Vdd}
N 300 -190 300 -160 {
lab=Vdd}
N 300 110 300 140 {
lab=Vss}
N -250 -190 -250 -160 {
lab=Vdd}
N 80 50 210 50 {
lab=#net3}
C {devices/capa.sym} 240 50 1 0 {name=Cc
m=1
value=800f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -250 -90 0 0 {name=p7 sig_type=std_logic lab=Ib}
C {devices/lab_pin.sym} -150 -40 0 0 {name=p8 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 140 -40 0 1 {name=p9 sig_type=std_logic lab=Vip}
C {devices/lab_pin.sym} 350 -30 0 1 {name=p10 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} 300 210 0 1 {name=p11 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} 0 240 0 1 {name=p12 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} 10 -270 0 1 {name=p13 sig_type=std_logic lab=Vdd}
C {sky130_fd_pr/pfet_01v8.sym} -110 -40 0 0 {name=M1
L=1
W=3
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 100 -40 0 1 {name=M2
L=1
W=3
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -70 120 0 1 {name=M3
L=1
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 60 120 0 0 {name=M4
L=1
W=1
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
C {sky130_fd_pr/pfet_01v8.sym} -30 -160 0 0 {name=M5
L=1
W=6
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 280 -160 0 0 {name=M6
L=1
W=6
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 280 110 0 0 {name=M7
L=1
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} -270 -160 0 0 {name=M8
L=1
W=6
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 620 -90 0 0 {name=p14 lab=Vdd}
C {devices/ipin.sym} 620 -60 0 0 {name=p3 lab=Vss}
C {devices/ipin.sym} 620 -30 0 0 {name=p1 lab=Vip}
C {devices/ipin.sym} 620 0 0 0 {name=p2 lab=Vin}
C {devices/ipin.sym} 620 30 0 0 {name=p4 lab=Ib}
C {devices/opin.sym} 600 60 0 0 {name=p5 lab=Vout}
