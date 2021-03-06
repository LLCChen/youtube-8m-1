CUDA_VISIBLE_DEVICES=1 python train.py \
		--train_data_pattern='/Youtube-8M/distillation_v2/frame/train/*.tfrecord' \
		--train_dir='../model/frame_level_lstm_gate_distillchain_v2_model' \
		--frame_features=True \
		--feature_names="rgb, audio" \
		--feature_sizes="1024, 128" \
		--model='LstmGateModel' \
		--video_level_classifier_model=MoeDistillChainModel \
		--moe_num_mixtures=8 \
		--batch_size=128 \
		--base_learning_rate=0.001 \
		--distillation_features=True \
		--distillation_type=0
		
