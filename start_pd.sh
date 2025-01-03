#!/bin/bash

set -ex

export HEAD_NODE_IP=172.31.73.239
export HEAD_NODE=1

p_num=$1
role=$2
log_filename=$3
nohup python -m llumnix.entrypoints.vllm.api_server \
                --host localhost \
                --port 1234 \
                --initial-instances 1 \
                --model /home/ubuntu/Llama-3-8B/ \
                --engine-use-ray \
                --worker-use-ray \
		--max-num-batched-tokens 8192 \
                --max-model-len 8192 \
                --enable-migration \
                --enable-defrag ENABLE_DEFRAG \
                --migration-backend rpc \
                --launch-ray-cluster \
                --enable-pd-disagg \
                --num-dispatch-instances ${p_num} \
		--log-request-timestamps \
		--log-instance-info \
                2>&1 >./llumnix_${role}_${log_filename}.log &
 
