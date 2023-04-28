v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 10 -90 10 -60 {
lab=Out}
N -50 -120 -30 -120 {
lab=In}
N -50 -120 -50 -30 {
lab=In}
N -50 -30 -30 -30 {
lab=In}
N 10 -120 40 -120 {
lab=Vdd}
N 10 -170 10 -150 {
lab=Vdd}
N 10 0 10 20 {
lab=Vss}
N -70 -70 -50 -70 {
lab=In}
N 10 -70 40 -70 {
lab=Out}
N 10 -30 40 -30 {
lab=Vss}
C {sky130_fd_pr/pfet_01v8.sym} -10 -120 0 0 {name=M7
L=0.5
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
C {sky130_fd_pr/nfet_01v8.sym} -10 -30 0 0 {name=M8
L=0.5
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
C {devices/lab_pin.sym} 10 -170 0 0 {name=p34 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 40 -120 0 1 {name=p35 sig_type=std_logic lab=Vdd}
C {devices/lab_pin.sym} 10 20 0 0 {name=p36 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} 40 -30 0 1 {name=p37 sig_type=std_logic lab=Vss}
C {devices/lab_pin.sym} -70 -70 0 0 {name=p1 sig_type=std_logic lab=In}
C {devices/lab_pin.sym} 40 -70 0 1 {name=p2 sig_type=std_logic lab=Out}
C {devices/ipin.sym} 280 -150 0 0 {name=p3 lab=Vdd}
C {devices/ipin.sym} 280 -120 0 0 {name=p4 lab=Vss}
C {devices/ipin.sym} 280 -90 0 0 {name=p5 lab=In}
C {devices/opin.sym} 260 -60 0 0 {name=p6 lab=Out}
