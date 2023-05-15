#!/bin/bash

# change these values as needed
project_name="reranking"
run_id="run1"
docker_image="zs12/qaware_decode:v0.1.3"

# upload datasets using clearml-data and artifacts using upload_artifacts.py
hypothesis_file="clearml_artifact_input/63ff4bde91af4940a74b02267fef7360/test.slash.hyps.txt"
source_sentences="clearml_artifact_input/63ff4bde91af4940a74b02267fef7360/test.slash.test.en"
comet_dir="clearml_dataset/dca37a702e6f44ffb940c45ff546b57c/qaware_decode/comet/"

set -x 
clearml-task --project $project_name --name qaware-rerank_$run_id \
  --docker ${docker_image} \
  --repo https://github.com/zaidsheikh/qaware-decode \
  --branch docker \
  --docker_args "-e CLEARML_AGENT_SKIP_PIP_VENV_INSTALL=/opt/conda/envs/qaware-decode/bin/python $EXTRA_DOCKER_ARGS" \
  --packages pip --queue default \
  --script clearml_scripts/rerank.py \
  --args hyps=${hypothesis_file} \
          src=${source_sentences} \
          num_samples=1 qe_metrics=comet_qe \
          comet_dir=${comet_dir}
