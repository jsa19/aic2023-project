v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -860 -250 -830 -250 {lab=Vss}
N -690 -250 -660 -250 {lab=Vss}
N -820 -410 -700 -410 {lab=#net1}
N -820 -410 -820 -370 {lab=#net1}
N -860 -370 -860 -280 {lab=#net1}
N -660 -220 -660 -200 {lab=#net2}
N -760 -200 -660 -200 {lab=#net2}
N -860 -220 -860 -200 {lab=#net2}
N -670 -110 -640 -110 {lab=Vss}
N -860 -200 -760 -200 {lab=#net2}
N -860 -380 -860 -370 { lab=#net1}
N -200 -310 -200 -110 { lab=Vo2}
N 30 -270 30 -170 { lab=#net3}
N -50 -300 -10 -300 { lab=Vo2}
N -50 -300 -50 -140 { lab=Vo2}
N -50 -140 -10 -140 { lab=Vo2}
N 30 -490 30 -330 { lab=Vdd}
N -200 -490 -200 -370 { lab=Vdd}
N -200 -50 -200 10 { lab=Vss}
N -200 -340 -150 -340 { lab=Vdd}
N 30 -140 80 -140 { lab=Vss}
N 30 -300 80 -300 { lab=Vdd}
N -200 -80 -150 -80 { lab=Vss}
N -660 -380 -660 -280 { lab=Vo1}
N -670 -80 -670 10 { lab=Vss}
N -280 -80 -240 -80 { lab=Ibias}
N -660 -410 -620 -410 { lab=Vdd}
N -910 -410 -860 -410 { lab=Vdd}
N -200 -210 -130 -210 { lab=Vo2}
N -860 -370 -820 -370 { lab=#net1}
N -660 -490 -660 -440 { lab=Vdd}
N -860 -490 -860 -440 { lab=Vdd}
N -670 -200 -670 -140 { lab=#net2}
N -130 -210 -50 -210 { lab=Vo2}
N 30 -110 30 -90 { lab=Vss}
N 30 -30 30 10 { lab=Vss}
N 30 -210 180 -210 { lab=#net3}
N 30 -90 30 -30 {
lab=Vss}
N -910 -460 -910 -410 {
lab=Vdd}
N -910 -460 -860 -460 {
lab=Vdd}
N -620 -460 -620 -410 {
lab=Vdd}
N -660 -460 -620 -460 {
lab=Vdd}
N -1000 10 -670 10 {
lab=Vss}
N -1000 -70 -1000 10 {
lab=Vss}
N -1000 -100 -940 -100 {
lab=Vss}
N -940 -100 -940 -40 {
lab=Vss}
N -1000 -40 -940 -40 {
lab=Vss}
N -1000 -180 -1000 -130 {
lab=Ibias}
N -1070 -100 -1040 -100 {
lab=Ibias}
N -1070 -150 -1070 -100 {
lab=Ibias}
N -1070 -150 -1000 -150 {
lab=Ibias}
N -860 -490 30 -490 {
lab=Vdd}
N -660 -340 -240 -340 {
lab=Vo1}
N -670 10 30 10 {
lab=Vss}
C {devices/lab_pin.sym} 80 -300 0 1 {name=p1 lab=Vdd}
C {devices/lab_pin.sym} -150 -340 0 1 {name=p2 lab=Vdd}
C {devices/lab_pin.sym} 80 -140 0 1 {name=p4 lab=Vss}
C {devices/lab_pin.sym} -150 -80 0 1 {name=p6 lab=Vss}
C {devices/lab_pin.sym} -600 10 3 0 {name=p9 lab=Vss}
C {devices/lab_pin.sym} -460 -340 1 0 {name=p12 lab=Vo1}
C {devices/lab_pin.sym} -200 -210 0 0 {name=p13 lab=Vo2}
C {sky130_fd_pr/pfet_01v8.sym} -840 -410 0 1 {name=M1
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
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -680 -410 0 0 {name=M2
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
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -880 -250 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} -640 -250 0 1 {name=M4
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
C {sky130_fd_pr/nfet_01v8.sym} -690 -110 0 0 {name=M9
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
C {sky130_fd_pr/pfet_01v8.sym} -220 -340 0 0 {name=M8
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
C {sky130_fd_pr/nfet_01v8.sym} -220 -80 0 0 {name=M10
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
C {sky130_fd_pr/pfet_01v8.sym} 10 -300 0 0 {name=M11
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
C {sky130_fd_pr/nfet_01v8.sym} 10 -140 0 0 {name=M13
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
C {devices/lab_pin.sym} -830 -250 2 0 {name=p10 lab=Vss}
C {devices/lab_pin.sym} -690 -250 2 1 {name=p14 lab=Vss}
C {devices/ipin.sym} 800 -540 0 0 {name=p15 lab=Vdd}
C {devices/ipin.sym} 800 -520 0 0 {name=p16 lab=Vss}
C {devices/ipin.sym} 800 -500 0 0 {name=p17 lab=Vip}
C {devices/ipin.sym} 800 -480 0 0 {name=p18 lab=Vin}
C {sky130_fd_pr/nfet_01v8.sym} -1020 -100 0 0 {name=M12
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
C {devices/ipin.sym} 800 -460 0 0 {name=p19 lab=Ibias}
C {devices/opin.sym} 780 -440 0 0 {name=p20 lab=Vout}
C {devices/lab_pin.sym} -1000 -180 0 0 {name=p21 lab=Ibias}
C {devices/lab_pin.sym} -710 -110 0 0 {name=p22 lab=Ibias}
C {devices/lab_pin.sym} -280 -80 0 0 {name=p23 lab=Ibias}
C {devices/lab_pin.sym} -640 -110 2 0 {name=p3 lab=Vss}
C {devices/lab_pin.sym} -480 -490 3 1 {name=p5 lab=Vdd}
C {devices/lab_pin.sym} -900 -250 2 1 {name=p7 lab=Vip}
C {devices/lab_pin.sym} -620 -250 2 0 {name=p8 lab=Vin}
C {devices/lab_pin.sym} 180 -210 0 1 {name=p11 lab=Vout}
