
## before starting
Set shared arguments and options, edit the argments listed bellow

- config : configuration file, use the provided file in this repository if working at Scripps cluster, or edit yours following the original file as template (input.cfg)
- out : directory where all output subdirectories will be created
- gpu : which gpu will be used (e.g. a100, v100, titanv, etc), only a100, v100, and titanv supported now

```
config=/mnt/stsi/stsi5/raqueld/imputator/autoencoder_tuning_pipeline/input.cfg
out=/mnt/stsi/stsi5/raqueld/imputator/autoencoder_tuning_pipeline/chr22_models
gpu=a100
```

## 0. Generate model configuration first

- input : configuration file, use the provided file in this repository if working at Scripps cluster, or edit yours following the original file as template (input.cfg)
- out_root : directory where all output subdirectories will be created

```
sbatch --export=input=$config,out_root=$out --job-name=0_configure_models 0_configure_models.sbatch
```

## 1. Run parameter tuning

### 1. Option 1: train a random subsample of hyperparameter combinations (grid search)

- indir = VMV subdirectory, usually a subdirectory inside $out

single VMV example, try this first to make sure it works

```
sbatch --export=indir=$out/22_17274081-17382360 --job-name=1_GS_models_22_17274081-17382360 1_train_GS_$gpu.sbatch
```

multiple VMVs example
```
for indir in $(tail -n +2 $out/model_dir_list.txt); do
    sbatch --export=indir=$indir --job-name=1_GS_models_$(basename $indir) 1_train_GS_$gpu.sbatch; sleep 1;
done > 1_JOBIDS.txt
```

### 1. Option 2: RayTune

comming soon!

## 2. Validation and model selection

### 2. Option 1: validate results from step 1. Option 1. (random/grid search)

Single VMV example, try this first to make sure it works

- mdir : path to VMV subdirectory
- input : same config file used by 0_configure_models.sbatch

```
sbatch --export=mdir=$out/22_17274081-17382360,input=$config --job-name=2_validate_and_select_best 2_validate_and_select_best.sbatch
```

Example for all VMVs

- model_dir_list.txt: list generated by 0_configure_models.sbatch

```
for indir in $(tail -n +2 $out/model_dir_list.txt); do
    sbatch --export=mdir=$indir,input=$config --job-name=2_validate_$(basename $indir) 2_validate_and_select_best.sbatch
done
```

### 2. Option 2: validate results from step 1. Option 2. (raytune)

Skip (already done by raytune, whenever raytune is implemented).

## 3. Run Full training for best models

Run this after one grid search iteration is complete for all VMVs .

Note: (only run when steps 1 and 2 complete), not worthy to run a single model per node/GPU, better to wait and use 100% of resources 

- train_list = file generated by 0_configure_models.sbatch, should be in output directory root ($out)

Run across a single multi-GPU node

```
sbatch --export=train_list=$out/full_training_list.txt --job-name=3_train_best_model_$gpu 3_train_best_model_$gpu.sbatch
```

Run across multiple multi-GPU nodes

```
for i in $out/full_training_list.txt???; do
    sbatch --export=train_list=$i --job-name=3_train_best_model_a100 3_train_best_model_$gpu.sbatch
done
```
## 4. Validate full training results

- mdir : path to VMV subdirectory
- input : same config file used by 0_configure_models.sbatch

single VMV example, try this first to make sure it works

```
sbatch --export=mdir=$out/22_17274081-17382360,input=$config --job-name=4_validate_full_training 4_validate_full_training.sbatch
```

example for all VMVs

- model_dir_list.txt: list generated by 0_configure_models.sbatch
```
for indir in $(tail -n +2 $out/model_dir_list.txt); do
    sbatch --export=mdir=$indir,input=$config --job-name=4_validate_full_training 4_validate_full_training.sbatch
done
```
For next iteration of parameter tuning, skip step 0, start at step 1
