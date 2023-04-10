#!/bin/bash

[ $# -lt 2 ] && { echo "Usage: $0 project_name run_ID [docker_image_tag]"; exit 1; }

# project name (for example: "deltalm")
project_name=$1

# random ID to uniquely identify this run
run_id=$2

docker_image=${3:-"zs12/qaware_decode:v0.1.2"}

set -x 

  #--branch main 
  #--repo https://github.com/zaidsheikh/qaware-decode 
clearml-task --project $project_name --name qaware-rerank_$run_id \
  --docker ${docker_image} \
  --docker_args "-e CLEARML_AGENT_SKIP_PIP_VENV_INSTALL=/opt/conda/envs/qaware-decode/bin/python -e CLEARML_LOG_LEVEL=DEBUG $EXTRA_DOCKER_ARGS" \
  --packages pip --queue default \
  --script clearml_scripts/rerank.py \
  --args hyps=clearml_artifact_input/63ff4bde91af4940a74b02267fef7360/test.slash.hyps.txt \
          src=clearml_artifact_input/63ff4bde91af4940a74b02267fef7360/test.slash.test.en \
          num_samples=1 qe_metrics=comet_qe \
          comet_dir=clearml_dataset/dca37a702e6f44ffb940c45ff546b57c/qaware_decode/comet/
