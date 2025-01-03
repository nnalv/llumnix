#!/bin/bash
set -ex

export HEAD_NODE_IP=172.31.73.239
export HEAD_NODE=1

num=$1
role=$2
log_filename=$3
nohup python -m llumnix.entrypoints.vllm.api_server \
                --host localhost \
                --port 1234 \
                --initial-instances 1 \
                --model /home/ubuntu/Llama-3-8B/ \
                --engine-use-ray \
                --worker-use-ray \
                --max-model-len 4096 \
                --enable-migration \
                --enable-defrag ENABLE_DEFRAG \
                --migration-backend nccl \
                --launch-ray-cluster \
		--num-dispatch-instances ${num} \
                2>&1 >./llumnix_${role}_${log_filename}.log &
