
## before starting
Set shared arguments and options, edit the argments listed bellow

- config : configuration file, use the provided file in this repository if working at Scripps cluster, or edit yours following the original file as template (input.cfg)
- out : directory where all output subdirectories will be created
- gpu : which gpu will be used (e.g. a100, v100, titanv, etc), only a100, v100, and titanv supported now

```
config=/mnt/stsi/stsi5/raqueld/imputator/autoencoder_train_test_best_only/input.cfg
out=/mnt/stsi/stsi5/raqueld/imputator/autoencoder_train_test_best_only/cad_190822_models
gpu=a100
```

## 0. Generate model configuration first

- input : configuration file, use the provided file in this repository if working at Scripps cluster, or edit yours following the original file as template (input.cfg)
- out_root : directory where all output subdirectories will be created

```
sbatch --export=input=$config,out_root=$out --job-name=0_configure_models 0_configure_models_$gpu.sbatch
```

## 1. Run Full training for best models

Run this after previous step is complete.

- train_list : file generated by 0_configure_models.sbatch, should be in output directory root ($out)
- out : directory where all output subdirectories will be created

Run across a single multi-GPU node

```
sbatch --export=train_list=$out/full_training_list.txt,out=$out --job-name=3_train_custom_best_model_$gpu 3_train_custom_best_model_$gpu.sbatch
```

Run across multiple multi-GPU nodes (recommended)

```
for i in $out/full_training_list.txt???; do
    sbatch --export=train_list=$i,out=$out --job-name=3_train_custom_best_model_$gpu 3_train_custom_best_model_$gpu.sbatch
done
```

## 2. Validate full training results

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
