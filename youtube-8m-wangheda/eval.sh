
GPU_ID=0
EVERY=500
MODEL=LstmModel
MODEL_DIR="../model/attentionlstm_moe4"

start=$1
DIR="$(pwd)"

for checkpoint in $(cd $MODEL_DIR && python ${DIR}/training_utils/select.py $EVERY); do
	echo $checkpoint;
	if [ $checkpoint -gt $start ]; then
		echo $checkpoint;
		CUDA_VISIBLE_DEVICES=$GPU_ID python eval.py \
			--train_dir="$MODEL_DIR" \
			--model_checkpoint_path="${MODEL_DIR}/model.ckpt-${checkpoint}" \
			--eval_data_pattern="/Youtube-8M-validate/validatea*" \
			--frame_features=True \
			--feature_names="rgb,audio" \
			--feature_sizes="1024,128" \
			--batch_size=128 \
			--model=$MODEL \
			--lstm_cells=1024 \
			--moe_num_mixtures=4 \
			--num_readers=1 \
			--run_once=True
	fi
done

