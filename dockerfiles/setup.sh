#!/bin/bash

conda create -n qaware-decode python=3.9.13
pip install clearml
conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge
cd /
git clone https://github.com/deep-spin/qaware-decode.git
cd qaware-decode/
pip install -e .
pip install ".[mbart-qe]"
pip install ".[transquest]"
