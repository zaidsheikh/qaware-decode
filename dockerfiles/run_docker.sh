#!/bin/bash

docker run --rm -it --gpus all --workdir /qaware-decode -v /tmp/:/data/ zs12/qaware_decode:v0.1  /opt/conda/envs/qaware-decode/bin/qaware-rerank /data/hyp.txt --src /data/test.en -n 1 --qe-metrics comet_qe

