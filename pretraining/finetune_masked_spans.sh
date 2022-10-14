#!/bin/bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

GPUID=$2
MODEL=$1

export OUTPUT_DIR_NAME=outputs/t5_large_masked_spans_event_triple
export CURRENT_DIR=${ROOT_DIR}
export OUTPUT_DIR=${CURRENT_DIR}/${OUTPUT_DIR_NAME}

rm -rf $OUTPUT_DIR

mkdir -p $OUTPUT_DIR

export OMP_NUM_THREADS=10


export CUDA_VISIBLE_DEVICES=${GPUID}

python ${ROOT_DIR}/finetune.py \
--data_dir=${ROOT_DIR}/data/event_triple \
--learning_rate=3e-5 \
--num_train_epochs 15 \
--task graph2text \
--model_name_or_path=${MODEL} \
--train_batch_size=3 \
--eval_batch_size=3 \
--early_stopping_patience 3 \
--gpus 1 \
--output_dir=$OUTPUT_DIR \
--max_source_length=128 \
--max_target_length=128 \
--val_max_target_length=128 \
--test_max_target_length=128 \
--eval_max_gen_length=128 \
--do_train --do_predict \
--eval_beams 5
