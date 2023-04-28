from templates import *
from config import *
import os
import subprocess
import ltspice
import matplotlib.pyplot as plt
import numpy as np


def get_string_value(value):
    string_value = '{:.2E}'.format(value)
    sign = string_value[-3]
    expn = int(string_value[-2:])
    valu = float(string_value[:-4])


    if sign != '-':
        print("Sign not recognised ", sign)
        exit()

    if expn == 0:
        return str(valu)
    elif expn == 1:
        return str(valu*100)+'m'
    elif expn == 2:
        return str(valu*10) + 'm'
    elif expn == 3:
        return str(valu*1000)+'u'
    elif expn == 4:
        return str(valu*100)+'u'
    elif expn == 5:
        return str(valu*10)+'u'
    elif expn == 6:
        return str(valu)+'u'
    elif expn == 7:
        return str(valu*100) + 'n'
    elif expn == 8:
        return str(valu*10)+'n'
    elif expn == 9:
        return str(valu)+'n'
    elif expn == 10:
        return str(valu*100)+'p'
    elif expn == 11:
        return str(valu*10)+'p'
    elif expn == 12:
        return str(valu)+'p'
    elif expn == 13:
        return str(valu*100) + 'f'
    elif expn == 14:
        return str(valu*10)+'f'
    elif expn == 15:
        return str(valu)+'f'

    return None

def get_xdut(circuit):
    if circuit.upper() == "OTA":
        # ota
        return "Vdd Vss Vip Vin Ib Vout"
    elif circuit.upper() == "COMPARATOR":
        return "Vdd Vss Vip Vin Ibias Vout"
    elif circuit.upper() == "INV":
        return "Vdd Vss In Out"
    elif circuit.upper() == "BGR":
        return "Vdd Vss Ib Vout"
    elif circuit.upper() == "PTAT":
        return "Vdd Vss Ib OutPtat"
    elif circuit.upper() == "TEMP_SENSOR":
        return "Vdd Vss Ib f"
    else:
        return None

def get_analysis(analysis_type, timestep_size=default_timestep_size, end_time=default_end_time, min_temperature=default_min_temperature, max_temperature=default_max_temperature, temperature_step=default_temperature_step, min_frequency=default_min_frequency, max_frequency=default_max_frequency):
    if analysis_type.upper() == 'AC':
        return "ac dec {} 10 {}".format(min_frequency, max_frequency)
    elif analysis_type.upper() == "DC-TEMP":
        return "dc temp {} {} {}".format(min_temperature, max_temperature, temperature_step)
    elif analysis_type.upper() == "TRAN":
        if isinstance(timestep_size, str) == False:
            timestep_size = get_string_value(timestep_size)
        
        if isinstance(end_time, str) == False:
            end_time = get_string_value(end_time)

        return "tran {} {}".format(timestep_size, end_time)

    return None

def get_option(temperature, gmin=default_gmin, reltol=default_reltol, abstol=default_abstol, gminsteps=default_gmin_steps):
    #.option TNOM=26 TEMP=26 GMIN=1e-15 reltol=1e-6 abstol=1e-6 keepopinfo noopiter gminsteps=5
    return "TNOM={} TEMP={} GMIN={} reltol={} abstol={} keepopinfo noopiter gminsteps={}".format(temperature, temperature, gmin, reltol, abstol, gminsteps)

def get_additional_components(circuit, load_capacitor=0):
    if circuit.upper() == "OTA":
        load_capacitor = get_string_value(load_capacitor)
        return 'VIP Vip 0 dc 0.0 ac 1\nVIN Vin 0 dc 0.0\nCL  Vout 0 {}'.format(load_capacitor)
    
    return ""

def get_additional_measures(analysis_type, circuit):
    if analysis_type.upper() == "AC":
        if circuit.upper() == "OTA":
            return 'let gain = db(vout/vip)\nlet phase_out = ph(vout)-ph(vip)\nmeas ac phase_margin(deg) find phase_out when gain=0'

    return ""

def get_degree_units(analysis_type):
    if analysis_type.upper() == "AC":
        return 'set units=degrees'
    return ""


def generate_spi(sim_path, tb, circuit, circuit_layout, vdd, xdut, analysis, opt, ib='10u', additional_components='', degree_unit='', additional_measures='', additional_include=''):
    replacements = {
        '{modify_tb}':tb,
        '{modify_circuit_layout}':circuit_layout, 
        '{modify_circuit}':circuit,
        '{modify_vdd}':vdd,
        '{modify_ib}':ib,
        '{modify_additional_components}':additional_components,
        '{modify_xdut}':xdut,
        '{modify_degree_unit}':degree_unit,
        '{modify_analysis}':analysis,
        '{modify_additional_measures}':additional_measures,
        '{modify_option}':opt,
        '{modify_include_additional}': additional_include
    }
    new_spi_file = tb+".spi"
    new_spi_path = os.path.join(sim_path, new_spi_file)
    new_spi = spi_template.split("\n")
    with open(new_spi_path, 'w') as outfile:
        for line in new_spi:
            for src, target in replacements.items():
                line = line.replace(src, str(target))
            outfile.write(line+"\n")
    return new_spi_file

def generate_makefile(sim_path, tb, view, design_name, circuit):
    replacements = {
        '{modify_tb}':tb,
        '{modify_view}':view,
        '{modify_circuit}':circuit,
        '{modify_design_name}':design_name
    }
    new_makefile_file = 'Makefile'
    new_makefile_path = os.path.join(sim_path, new_makefile_file)
    new_makefile = makefile_template.split("\n")

    with open(new_makefile_path, 'w') as outfile:
        for line in new_makefile:
            for src, target in replacements.items():
                line = line.replace(src, str(target))
            outfile.write(line+"\n")
    return new_makefile_file


def generate_input_files_for_single_sim(design_name, sim_path,  tb, circuit, circuit_layout, \
    xdut, vdd, ib, view, analysis, analysis_type, temperature=default_temperature, load_capacitor=0, \
    gmin=default_gmin, reltol=default_reltol, abstol = default_abstol, gmin_steps=default_gmin_steps,\
    check_spi_file=False, check_makefile = False):
    opt = get_option(temperature, gmin=gmin, reltol=reltol, abstol=abstol, gminsteps=gmin_steps)
    additional_components = get_additional_components(circuit, load_capacitor=load_capacitor)
    additional_measures = get_additional_measures(analysis_type, circuit)
    degree_unit = get_degree_units(analysis_type)
    print()
    print("------------------Generate SPI file-----------------------")
    spi_file = generate_spi(sim_path, tb, circuit, circuit_layout, vdd, xdut, analysis, opt, ib=ib, additional_components=additional_components, degree_unit=degree_unit, additional_measures=additional_measures)
    print("{:20s} {:30s}".format("New SPI file stored in: ", sim_path))
    print("{:20s} {:30s}".format("New SPI file stored as: ", spi_file))
    if check_spi_file:
        print("{:20s} {:30s}".format("Checking generated SPI.. ", ""))
        spi_correct = input("Enter the followng:\n1: if generated spi file is correct\n0: if generated spi file is incorrect\n")
        if int(spi_correct) == 0:
            print("Exiting the program....")
            print("Incorrect spi file generated for simulation")
            print("Check again...")
            exit()

    print()
    print("------------------Generate Makefile-----------------------")
    makefile =generate_makefile(sim_path, tb, view, design_name, circuit)
    print("{:20s} {:30s}".format("New Makefile stored in: ", sim_path))
    print("{:20s} {:30s}".format("New Makefile stored as: ", makefile))
    if check_makefile:
        print("{:20s} {:30s}".format("Checking generated Makefile.. ", ""))
        makefile_correct = input("Enter the followng:\n1: if generated Makefile is correct\n0: if generated Makefile is incorrect\n")
        if int(makefile_correct) == 0:
            print("Exiting the program....")
            print("Incorrect Makefile generated for simulation")
            print("Check again...")
            exit()



def run_single_simulation(sim_directory, current_directory, run_type=['typical']):
    print()
    print("------------------Start simulation-----------------------")
    os.chdir(sim_directory)
    subprocess.run(["make"]+run_type) 
    os.chdir(current_directory)
    print()

def extract_data(sim_path, tb, sim_ext, analysis_type):
    file_path = os.path.join(sim_path, 'output_'+tb, tb+sim_ext)
    l = ltspice.Ltspice(file_path)
    l.parse() 
    data = {}
    if analysis_type.upper() == 'AC':
        data['x'] = l.get_frequency()
        data['gain'] = l.get_data('gain')
        data['phase_out'] = l.get_data('phase_out')

    elif analysis_type.upper() == 'DC-TEMP':
        data['x'] = l.get_x()
        data['vout'] = l.get_data('v(vout)')
        try:
            a = data['vout'].all()
        except:
            a = None

        if a == None:
            data['vout'] = l.get_data('v(outptat)')

        data['vb'] = l.get_data('v(xdut.b)')
        data['vc'] = l.get_data('v(xdut.c)')

    elif analysis_type.upper() == 'TRAN':
        data['x'] = l.get_x()
        data['f'] = l.get_data('v(f)')

    return data

def plot_data(data, xlim=None):
    l = len(data)-1
    if l > 2:
        nrows = 2
    else:
        nrows = 1

    ncols = int(l/nrows)+1
    fig, ax = plt.subplots(nrows=nrows, ncols=ncols)
    count = 0
    keys = list(data.keys())
    keys.remove('x')

    if nrows == 1 and ncols == 1:
        ax.plot(data['x'], data[keys[count]])
        ax.set_title(keys[count])
        if keys[count] == 'gain' or keys[count] == 'phase_out':
            ax.set_xscale('log')
        if xlim != None:
            ax.set_xlim(xlim)
        
    elif nrows == 1:
        for col in range(ncols):
            if count < l:
                ax[col].plot(data['x'], data[keys[count]])
                ax[col].set_title(keys[count])
                if keys[count] == 'gain' or keys[count] == 'phase_out':
                    ax[col].set_xscale('log')
                if xlim != None:
                    ax[col].set_xlim(xlim)
                count += 1

    elif ncols == 1:
        for col in range(nrows):
            if count < l:
                ax[col].plot(data['x'], data[keys[count]])
                ax[col].set_title(keys[count])
                if keys[count] == 'gain' or keys[count] == 'phase_out':
                    ax[col].set_xscale('log')
                if xlim != None:
                    ax[col].set_xlim(xlim)
                count += 1

    else:
        for row in range(nrows):
            for col in range(ncols):
                if count < l:
                    ax[row, col].plot(data['x'], data[keys[count]])
                    ax[row, col].set_title(keys[count])
                    if keys[count] == 'gain' or keys[count] == 'phase_out':
                        ax[row, col].set_xscale('log')
                    if xlim != None:
                        ax[row, col].set_xlim(xlim)
                    count += 1
    plt.show()


def get_frequency(data, assumed_dt=1e-9):
    x = data['x']
    y = data['f']

    inds_y = [iy for iy in range(len(y)) if y[iy] > 1.7]
    on_period_start = [x[inds_y[0]]]
    
    for ii, ind in enumerate(inds_y):
        if ii>0:
            dx = x[ind] - x[inds_y[ii-1]]
            if abs(dx-assumed_dt) > 1e-9:
                on_period_start.append(x[ind])
    period = np.diff(on_period_start)
    return 1/np.mean(period[4:])

def normalize_and_rmse(frequencies, temperatures):
    normalized = [(freq-frequencies[0])/(frequencies[-1]-frequencies[0]) for freq in frequencies]
    m = (normalized[-1]-normalized[0])/(temperatures[-1]-temperatures[0])
    err = 0
    for i in range(1, len(temperatures)):
        estimated = normalized[i-1] + m * (temperatures[i] - temperatures[i-1])
        d = (estimated - normalized[i])
        err += d * d
    return np.sqrt(err/len(temperatures))