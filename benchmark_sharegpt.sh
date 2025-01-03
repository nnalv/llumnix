#!/bin/bash

set -ex

qps=$1
log_filename=$2

mkdir -p ${log_filename}

python benchmark/benchmark_serving.py \
    --ip_ports localhost:1234 \
    --tokenizer /home/ubuntu/Llama-3-8B \
    --random_prompt_count 100 \
    --dataset_type "sharegpt" \
    --dataset_path /home/ubuntu/sharegpt4/sharegpt_V3_format.jsonl \
    --qps ${qps} \
    --distribution "poisson" \
    --log_latencies \
    --fail_on_response_failure \
    --log_filename /home/ubuntu/llumnix/${log_filename} 
