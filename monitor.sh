#!/bin/bash
ethstats -t -i ens5 -n1 >> stats-ens5.txt &
nvidia-smi --query-gpu=timestamp,utilization.gpu,utilization.memory,memory.total,memory.used,memory.free,compute_cap --format=csv,noheader --loop=1 >> stats-nvidia.txt &
