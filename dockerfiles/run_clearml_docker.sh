#!/bin/bash

[ $# -lt 3 ] && { echo "Usage: $0 project_name run_ID shared_nfs_dir/ [docker_image_tag]"; exit 1; }

# project name (for example: "deltalm")
project_name=$1

# random ID to uniquely identify this run
run_id=$2

# shared NFS directory that's accessible from all clearml agent machines
shared_dir=$(readlink -ve $3) || exit 1

docker_image=${7:-"zs12/qaware_decode:v0.1.2"}

set -x 

clearml-task --project $project_name --name qaware-rerank_$run_id \
  --docker ${docker_image} \
  --branch main \
  --docker_args "-v ${shared_dir}/:/data/ -e CLEARML_AGENT_SKIP_PIP_VENV_INSTALL=/opt/conda/envs/qaware-decode/bin/python" \
  --packages pip --queue default \
  --repo https://github.com/deep-spin/qaware-decode \
  --script qaware_decode/rerank.py \
  --args hyps=/data/hyp.txt src=/data/test.en num_samples=1 qe_metrics=comet_qe
