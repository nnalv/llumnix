#!/bin/bash

set -ex

num=$1
len=$2
log_filename=$3

mkdir -p ${log_filename}
python benchmark/benchmark_serving.py \
    --ip_ports localhost:1234 \
    --tokenizer /home/ubuntu/Llama-3-8B \
    --random_prompt_count ${num} \
    --gen_random_prompts \
    --random_prompt_lens_mean ${len} \
    --variable_response_lens_mean ${len} \
    --variable_response_lens_range 0 \
    --random_prompt_lens_range 0 \
    --allow_variable_generation_length \
    --distribution "burst" \
    --variable_prompt_lens_distribution "uniform" \
    --log_latencies \
    --fail_on_response_failure \
    --log_filename /home/ubuntu/llumnix/${log_filename}
