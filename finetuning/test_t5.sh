python finetune_t5.py \
--data_dir=event_narrative \
--gpus 1 \
--learning_rate=3e-5 \
--output_dir=t5_large_result_event_pt_on_spans_only_X_conti2_test_results2 \
--train_batch_size 4 --eval_batch_size 4 \
--max_source_length=256 \
--max_target_length=256 \
--val_max_target_length=256 \
--checkpoint=t5_large_result_event_pt_on_spans_only_X_conti2/val_avg_bleu=30.7100-step_count=3.ckpt   \
--test_max_target_length=256 \
--eval_max_gen_length=256 \
--model_name_or_path t5_large_result_event_pt_on_spans_only_X_conti2/best_tfmr  \
--task rdf2text \
--early_stopping_patience 15 \
--warmup_steps 2 \
--do_predict \
--lr_scheduler cosine_w_restarts \
--eval_beams 5
 "$@"
