makefile_template = """
TB={modify_tb}
VIEW={modify_view}
#VIEW=Lay

OPT=

netlist:
	cd ../../work && xschem -q -x -b -s -n ../design/{modify_design_name}/{modify_circuit}.sch
	perl -pi -e "s/\*\*\.subckt/\.subckt/ig;s/\*\*\.ends/\.ends/ig;" ../../work/xsch/{modify_circuit}.spice

test:
	${MAKE} typical OPT="Debug"

typical: netlist
	cicsim run --name ${VIEW}_typical ${TB} ${OPT} ${VIEW} Gt Att Tt Vt

slow: netlist
	cicsim run --name ${VIEW}_slow ${TB} ${OPT} ${VIEW} Gt Ass "Th,Tl" Vl

fast: netlist
	cicsim run --name ${VIEW}_fast ${TB} ${OPT} ${VIEW} Gt Aff "Th,Tl" Vh

tfs: netlist
	cicsim run --name ${VIEW}_tfs ${TB} ${OPT} ${VIEW} Gt "Att,Ass,Aff" "Tt,Th,Tl" "Vt,Vl,Vh"

etc: netlist
	cicsim run --name ${VIEW}_etc ${TB} ${OPT} ${VIEW} Gt "Ass,Aff,Asf,Afs" "Th,Tl" "Vl,Vh"

mc: netlist
	cicsim run --name ${VIEW}_mc --count 30 ${TB} ${OPT} ${VIEW} Gt "Amctt" "Tt" "Vt"

ntc: netlist
	cicsim run --name ${VIEW}_ntc ${TB} ${OPT} ${VIEW} Gt "Att,Ass,Aff" "Tt" Vt

temp: netlist
	cicsim run --name ${VIEW}_temp ${TB} ${OPT} ${VIEW} Gt "Att" "Tt,Th,Tl" Vt

summary:
	cicsim summary --output "README.md"

slide:
	pandoc -s  -t slidy README.md -o README.html

all: typical etc mc summary slide

clean:
	-rm -rf output_*
	-rm -rf __pycache__
	-rm *.run
	-rm *.pdf
	-rm *.csv

"""

spi_template = '''
*{modify_tb}
*----------------------------------------------------------------
* Include
*----------------------------------------------------------------
#ifdef Lay
.include ../../../work/lpe/{modify_circuit_layout}.spi
#else
.include ../../../work/xsch/{modify_circuit}.spice
.include /opt/pdk/share/pdk/sky130B/libs.ref/sky130_fd_sc_hd/spice
#endif
{modify_include_additional}

*-----------------------------------------------------------------
* OPTIONS
*-----------------------------------------------------------------
.option {modify_option}

*-----------------------------------------------------------------
* PARAMETERS
*-----------------------------------------------------------------
.param TRF = 10p


*-----------------------------------------------------------------
* FORCE
*-----------------------------------------------------------------
VSS  Vss  0     dc 0
VDD  Vdd  VSS   dc {modify_vdd}
Ib Ib 0 dc {modify_ib}

{modify_additional_components}


*-----------------------------------------------------------------
* DUT
*-----------------------------------------------------------------
XDUT {modify_xdut}

*----------------------------------------------------------------
* MEASURES
*----------------------------------------------------------------


*----------------------------------------------------------------
* PROBE
*----------------------------------------------------------------

#ifdef Debug
.save all
#else
.save all
#endif

*----------------------------------------------------------------
* NGSPICE control
*----------------------------------------------------------------
.control
{modify_degree_unit}
set num_threads=8
set color0=white
set color1=black
unset askquit


{modify_analysis}

{modify_additional_measures}

write
quit

.endc

.end
'''
