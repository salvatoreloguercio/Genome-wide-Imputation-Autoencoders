CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_43048 --l1 0.1 --l2 0.0 --beta 1.0 --rho 0.5 --gamma 1.0 --disable_alpha 1 --learn_rate 0.0001 --activation sigmoid --optimizer adam --loss_type CE --n_layers 2 --size_ratio 0.9 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_202535 --l1 0.0 --l2 1e-08 --beta 0.01 --rho 0.5 --gamma 5.0 --disable_alpha 1 --learn_rate 0.0001 --activation sigmoid --optimizer adam --loss_type CE --n_layers 6 --size_ratio 1.0 --decay_rate 0.0 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_234945 --l1 0.0 --l2 1e-08 --beta 0.001 --rho 0.05 --gamma 4.0 --disable_alpha 1 --learn_rate 1e-05 --activation relu --optimizer adam --loss_type CE --n_layers 8 --size_ratio 0.6 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_288921 --l1 1e-08 --l2 0.0 --beta 0.0001 --rho 0.05 --gamma 0.0 --disable_alpha 0 --learn_rate 1e-05 --activation leakyrelu --optimizer adam --loss_type CE --n_layers 8 --size_ratio 1.0 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_346665 --l1 0.0 --l2 0.0 --beta 0.001 --rho 0.1 --gamma 0.0 --disable_alpha 0 --learn_rate 0.0001 --activation leakyrelu --optimizer adam --loss_type CE --n_layers 8 --size_ratio 0.7 --decay_rate 0.5 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_358105 --l1 0.1 --l2 0.0 --beta 0.1 --rho 0.005 --gamma 4.0 --disable_alpha 0 --learn_rate 0.0001 --activation relu --optimizer adam --loss_type CE --n_layers 2 --size_ratio 1.0 --decay_rate 0.0 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_367798 --l1 0.0 --l2 1e-08 --beta 0.1 --rho 0.25 --gamma 5.0 --disable_alpha 1 --learn_rate 1e-05 --activation tanh --optimizer adam --loss_type CE --n_layers 8 --size_ratio 1.0 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_412291 --l1 0.01 --l2 0.0 --beta 0.01 --rho 0.25 --gamma 0.0 --disable_alpha 1 --learn_rate 0.0001 --activation leakyrelu --optimizer adam --loss_type CE --n_layers 4 --size_ratio 1.0 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_450491 --l1 0.1 --l2 0.0 --beta 1.0 --rho 0.01 --gamma 0.0 --disable_alpha 1 --learn_rate 0.0001 --activation tanh --optimizer adam --loss_type CE --n_layers 6 --size_ratio 1.0 --decay_rate 0.95 --resume 1 --max_epochs 50000
CUDA_VISIBLE_DEVICES=<my_GPU_id> python3 DSAE_TORCH_ARG.py --input <my_input_file> --min_mask <my_min_mask> --max_mask <my_max_mask> --model_id model_84 --l1 0.1 --l2 0.0 --beta 0.01 --rho 0.01 --gamma 0.0 --disable_alpha 1 --learn_rate 0.0001 --activation tanh --optimizer adam --loss_type CE --n_layers 4 --size_ratio 1.0 --decay_rate 0.95 --resume 1 --max_epochs 50000
