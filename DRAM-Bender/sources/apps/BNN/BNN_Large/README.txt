How to use?
-----------
Inputs are <bank_id> <skip_comp> <trace_power> <dll> <runs>
Implicit - wieghts_matrix.txt, input.txt (W, X, respectively), data_to_operand.txt (mapping of subarray - paths from each datarow to each operand), padding.txt (in case there's a need for padding for RMAJ3)
<dll> - choose whether to use dll method
    If 1, expects strictly 16 X values (batch dim. input dim unconstrained if fit in subarray)!
      performs augmentation and classification
    If 0, epects strictly 512 X values (batch dim)
      performs a regular BNN layer
Xs are replicated to fit entire row.
Outputs are generated in the cpp_output directory:
-classification.txt - <dll> == 1. classification for the entire input matrix. For 16 input Xs and (hardcoded) 32 augmentations, 
we have 2048 calssifications (after input replication to fill the row)
-trace_pre_act_copy/maj.txt - trace files for DRAM cmds imvolved in row copy, maj respectively
-benchmark.txt - averaged run times for the different components (DRAM and CPU processes)
-output.txt - layer output values

In order to create a trace for power analysis, pass trace_power = 1, skip_comp = 0, runs = 1
In order to classify (accuracy test), pass trace_power = 0, skip_comp = 0, runs = 1 (use python wrapper to manage the test)
In order to benchmark performance, pass trace_power = 0, runs = as large as you want, skip_comp = :
 - To determine runtime not including DRAM compute (row copy, maj), skip_comp = 1
 - To determine end2end DRAM runtime, skip_comp = 0
 - To determine actual DRAM computation time, subtract the latter from the first.
 - Augmentation, calssification time is calculated regardless.
 -- Agumentation - w.r.t. 16 inputs only. Only when dll = 1
 -- classification w.r.t. entire row (32 augmentations), but per output neuron. Only when dll = 1
 -- DRAM - per output neuron