How to use?
-----------
Inputs are <bank_id> <skip_comp> <trace_power> <runs>
Implicit - wieghts_matrix.txt, input.txt (W, X, respectively)
we currently support dtrictly 16 X values (batch dim. input dim unconstrained if fit in subarray)!
Xs are replicated to fit entire row though.
Outputs are generated in the cpp_output directory:
-calssification.txt - classification for the entire input matrix. For 16 input Xs and (hardcoded) 32 augmentations, 
we have 2048 calssifications (after input replication to fill the row)
-trace_pre_act_copy/maj.txt - trace files for DRAM cmds imvolved in row copy, maj respectively
-benchmark.txt - averaged run times for the different components (DRAM and CPU processes)


In order to create a trace for power analysis, pass trace_power = 1, skip_comp = 0, runs = 1
In order to classify (accuracy test), pass trace_power = 0, skip_comp = 0, runs = 1 (use python wrapper to manage the test)
In order to benchmark performance, pass trace_power = 0, runs = as large s you want, skip_comp = :
 - To determine runtime not including DRAM compute (row copy, maj), skip_comp = 1
 - To determine end2end DRAM runtime, skip_comp = 0
 - To determine actual DRAM computation time, subtract the latter from the first.
 - Augmentation, calssification time is calculated regardless.
 -- Agumentation - w.r.t. 16 inputs only.
 -- classification w.r.t. entire row (32 augmentations), but per output neuron
 -- DRAM - per output neuron