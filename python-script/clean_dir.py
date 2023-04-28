import ltspice
import matplotlib.pyplot as plt
import numpy as np
import os
import subprocess
from pathlib import Path
from utils import *
from config import *
import shutil


# clean simulation data

# Set up directories
current_directory = Path(os.getcwd())
project_directory = current_directory.parent.absolute()
project_name = 'temp_sensor_sky130nm'
design_name = project_name.upper()
sim_directory = os.path.join(project_directory, project_name, 'sim')
work_directory = os.path.join(project_directory, project_name, 'work')
test_dirs = ['OTA', 'SENSING_ELEMENT', 'TEMP_SENSOR']
for test_dir in test_dirs:
    full_path = os.path.join(sim_directory, test_dir)
    sub_dirs = [x[0] for x in os.walk(full_path) if x[0] != full_path]
    base_names = [os.path.basename(sub_dir).replace('output_', '') for sub_dir in sub_dirs]
    for sub_dir in sub_dirs:
        shutil.rmtree(sub_dir)
    files = os.listdir(full_path)
    for file in files:
        if '.run' in file or ('.spi' in file and 'tran' not in file):
            os.remove(os.path.join(full_path, file))

xsch = os.path.join(work_directory, 'xsch')
files = os.listdir(xsch)
for file in files:
    os.remove(os.path.join(xsch, file))