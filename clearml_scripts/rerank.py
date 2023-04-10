#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

import logging
logging.basicConfig(
     level=logging.DEBUG,
     format= '[%(asctime)s] %(levelname)s - %(message)s',
     datefmt='%H:%M:%S'
)
logging.getLogger("clearml").setLevel(logging.DEBUG)

from clearml_scripts.utils import download_artifacts, upload_artifacts
from qaware_decode.rerank import main


download_artifacts()
main()
upload_artifacts()
