# BinDRAM: Binary Neural Network on Unmodified Commodity DRAM

## Prerequisite
Our real DRAM chip characterization is based on the open-source FPGA-based DRAM characterization infrastructure [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender). Please check out and follow the installation instructions of [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender).

The software dependencies for the characterization are:
- GNU Make, CMake 3.10+
- `c++-17` build toolchain (tested with `gcc-9`)
- Python 3.9+
- `pip` packages `pandas`, `scipy`, `matplotlib`, and `seaborn`

## Hardware Setup
Our real DRAM chip characterization infrastructure consists of the following components:
- A host x86 machine with a PCIe 3.0 x16 slot
- An FPGA board with a DIMM/SODIMM slot supported by [DRAM Bender](https://github.com/CMU-SAFARI/DRAM-Bender) (e.g., Xilinx Alveo U200)

## Directory Structure
```
DRAM-Bender           # A fork of DRAM Bender that contains the characterization program
  └ sources           
    └ apps           
      └ BNN    # Source code of the BNN program    

```

### Step 1 

Clone the repo in your home directory

```
  $ git clone https://github.com/WolFtSoN/BinDRAM
```

Go to the program folder
```
  $ cd /home/<your_user_name>/DRAM-Bender/sources/apps/BNN/
```
### Step 2 

Run `bnn.py` to run the BNN model. When the script successfully finishes, a message "DONE!!" in terminal should appear.
```
  $ python3 bnn.py
```



