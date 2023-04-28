import ltspice
import matplotlib.pyplot as plt
import numpy as np
import os
import subprocess
from pathlib import Path
from utils import *
from config import *

#
check_spi_file = False
check_makefile = False

# Set up directories
current_directory = Path(os.getcwd())
project_directory = current_directory.parent.absolute()
project_name = 'temp_sensor_sky130nm'
design_name = project_name.upper()
sim_directory = os.path.join(project_directory, project_name, 'sim')
print()
print("------------------Simulation Set-up-------------------------")
print("{:20s} {:30s}".format("Project: ", project_name))
print("{:20s} {:30s}".format("Design: ", design_name))

# Circuit set up
circuit = 'TEMP_SENSOR'
run_multiple_tran = False
test_all_corners = False
min_temperature = default_min_temperature
max_temperature = default_max_temperature
temperature_step = default_temperature_step
timestep_size = default_timestep_size
end_time = default_end_time
gmin = default_gmin
reltol = default_reltol
abstol = default_abstol
gmin_steps = default_gmin_steps
temperature = default_temperature
load_capacitor = default_load_capacitor

#-------------------------------------------------------------------#
# OTA Simulation
#-------------------------------------------------------------------#
if circuit == 'OTA':
    test_sim = 'OTA'
    analysis_type = 'AC'

#-------------------------------------------------------------------#
# BGR simulation
#-------------------------------------------------------------------#
elif circuit == 'BGR':
    test_sim = 'SENSING_ELEMENT'
    analysis_type='DC-TEMP'
    min_temperature= -40
    max_temperature= 125
    temperature_step = 1e-1
    #gmin_steps = 8
    
#-------------------------------------------------------------------#
# PTAT Simulation
#-------------------------------------------------------------------#
elif circuit == 'PTAT':
    test_sim = 'SENSING_ELEMENT'
    analysis_type='DC-TEMP'
    min_temperature= -40
    max_temperature= 125
    temperature_step = 1e-1

#-------------------------------------------------------------------#
# TEMP SENSOR Simulation
#-------------------------------------------------------------------#
elif circuit == 'TEMP_SENSOR':
    test_sim = 'TEMP_SENSOR'
    analysis_type = 'TRAN'
    timestep_size = 0.5e-9
    end_time = 50e-6
    run_multiple_tran = True

circuit_layout = circuit + '_lpe'
sim_type = 'schematic'
if sim_type == 'schematic':
    view = 'Sch'
sim_path = os.path.join(sim_directory, test_sim)
print("{:20s} {:30s}".format("Testing circuit: ", circuit))
print("{:20s} {:30s}".format("Simulation type: ", sim_type))
print("{:20s} {:30s}".format(" ", analysis_type))
tb = [analysis_type, circuit.replace('_', '-')]
tb = "-".join(tb)
#run_type = 'typical'
sim_ext = ''
#if run_type == 'typical':
#    typ = 
#    sim_ext = '_'+view+typ+'.raw'

if test_all_corners:
    run_type = ['typical', 'etc', 'mc']
    typ = []
    etc_as = ['Ass', 'Aff', 'Asf', 'Afs']
    etc_ts = ['Th', 'Tl']
    etc_vs = ['Vl', 'Vh']

    for a in etc_as:
        for t in etc_ts:
            for v in etc_vs:
                typ.append('Gt'+a+t+v)
    typ.append('GtAmcttTtVt')

else:
    run_type = ['typical']
    typ = ['GtAttTtVt']

print("{:20s} {:30s}".format("Test bench: ", tb))
for r in run_type:
    print("{:20s} {:30s}".format("Run type: ", r))
# 

xdut = get_xdut(circuit)
assert(xdut != None)
xdut += " "+circuit

vdd = 1.8
ib_value = 10e-6
ib = get_string_value(ib_value)


print("{:20s} {:30s}".format("Vdd (V): ", str(vdd)))
print("{:20s} {:30s}".format("Vss (V): ", str(0)))
print("{:20s} {:30s}".format("IBias (A): ", ib))
print("{:20s} {:30s}".format("Temperature (C): ", str(temperature)))
analysis = get_analysis(analysis_type, temperature_step=temperature_step, min_temperature=min_temperature, max_temperature=max_temperature, timestep_size=timestep_size, end_time=end_time)
assert(analysis != None)


if run_multiple_tran == False:
    generate_input_files_for_single_sim(design_name, sim_path, tb, circuit, circuit_layout, xdut, \
    vdd, ib, view, analysis, analysis_type, temperature=temperature, load_capacitor=load_capacitor, \
    gmin=gmin, reltol=reltol, abstol=abstol, gmin_steps=gmin_steps,check_spi_file=check_spi_file, check_makefile=check_makefile)
    run_single_simulation(sim_path, current_directory, run_type=run_type)
    for t in typ:
        sim_ext = '_'+view+t+'.raw'
        data = extract_data(sim_path, tb, sim_ext, analysis_type)
        plot_data(data)

else:
    n = int((max_temperature - min_temperature)/temperature_step)+1
    frequencies = []
    temperatures = []
    tb = tb + '-Temp'
    for i in range(n):
        temperature = min_temperature + i*temperature_step
        temperatures.append(temperature)
        tb_ = tb + str(temperature)
        generate_input_files_for_single_sim(design_name, sim_path, tb_, circuit, circuit_layout, xdut, vdd, ib, view, analysis, analysis_type, temperature=temperature, load_capacitor=load_capacitor, check_spi_file=check_spi_file, check_makefile=check_makefile)
        run_single_simulation(sim_path, current_directory, run_type=run_type)
        for t in typ:
            sim_ext = '_'+view+t+'.raw'
            data = extract_data(sim_path, tb_, sim_ext, analysis_type)
            plot_data(data)
            if t == 'GtAttTtVt':
        #data = extract_data(sim_path, tb_, sim_ext, analysis_type)
        #plot_data(data, xlim=[1e-5, 1.1e-5])
                frequencies.append(get_frequency(data, assumed_dt=timestep_size))
    plt.figure()
    plt.plot(temperatures, frequencies)
    plt.show()
    print()
    print("---------------Temperature sensor accuracy----------------------")
    err = normalize_and_rmse(frequencies, temperatures)
    print("RMSE: ", err)


print()
