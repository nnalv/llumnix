#!/bin/bash

set -ex

qps=$1
len=$2
log_filename=$3

mkdir -p ${log_filename}
python benchmark/benchmark_serving.py \
    --ip_ports localhost:1234 \
    --tokenizer /home/ubuntu/Llama-3-8B \
    --random_prompt_count 100 \
    --gen_random_prompts \
    --random_prompt_lens_mean ${len} \
    --variable_response_lens_mean ${len} \
    --variable_response_lens_range ${len} \
    --random_prompt_lens_range ${len} \
    --allow_variable_generation_length \
    --qps ${qps} \
    --distribution "poisson" \
    --log_latencies \
    --fail_on_response_failure \
    --log_filename /home/ubuntu/llumnix/${log_filename}
