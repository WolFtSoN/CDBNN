# Simultaneous Many-Row Activation in Off-the-Shelf DRAM Chips: Experimental Characterization and Analysis


<p align=center>
<img src="https://dsn2024uq.github.io/images/dsn2024_artifact.png" alt="Code and data reproduced" width="600">
</p>

<a href="https://doi.org/10.5281/zenodo.11165221"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.11165221.svg" alt="DOI"></a>
[![Academic Code](https://img.shields.io/badge/Origin-Academic%20Code-C1ACA0.svg?style=flat)]() [![Language Badge](https://img.shields.io/badge/Made%20with-C/C++-blue.svg)](https://isocpp.org/std/the-standard) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![contributions welcome](https://img.shields.io/badge/Contributions-welcome-lightgray.svg?style=flat)]() [![Preprint: arXiv](https://img.shields.io/badge/cs.AR-2405.06081-b31b1b?logo=arxiv&logoColor=red)](https://arxiv.org/pdf/2405.06081.pdf) 


## Prerequisite
Our real DRAM chip work is based on the open-source FPGA-based DRAM characterization infrastructure [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender). Please check out and follow the installation instructions of [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender).

The software dependencies for the characterization are:
- GNU Make, CMake 3.10+
- `c++-17` build toolchain (tested with `gcc-9`)
- Python 3.9+
- `pip` packages `pandas`, `scipy`, `matplotlib`, and `seaborn`

## Hardware Setup
Our real DRAM chip characterization infrastructure consists of the following components:
- A host x86 machine with a PCIe 3.0 x16 slot
- An FPGA board with a DIMM/SODIMM slot supported by [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender) (e.g., Xilinx Alveo U200)
- Heater pads attached to the DRAM module under test
- A temperature controller (e.g., MaxWell FT200) programmable by the host machine connected to the heater pads

## Directory Structure
```
DRAM-Bender           # A fork of DRAM Bender that contains the characterization program
  └ sources           
    └ apps           
      └ BNN    # Source code of the characterization program    
└ analysis              # Scripts to analyze and plot the characterization data
└ experimental_data            # Directory that contains all experimental data (download the files from Zenodo)

```

### Step 0
The real DRAM chip characterization takes a long period of time. To run all our characterization experiments, a completion time of 1-2 weeks is expected. Therefore, it is recommended to run the characterization experiment script in a persistent shell session (e.g., using a terminal multiplexer like screen, tmux).

### Step 1 

Clone the repo in your home directory

```
  $ git clone https://github.com/WolFtSoN/CDBNN
```

Go to the program folder
```
  $ cd /home/<your_user_name>/dsn_artifact/DRAM-Bender/sources/apps/BNN/
```
### Step 2 

Run `bnn.py` to start the experiments. When the script successfully finishes, the output file should appear in the same folder as `bnn.py` when the run is done.
```
  $ python3 bnn.py
```


