#!/usr/bin/env python
# -*- coding: utf-8 -*-


import sys
import argparse
from clearml import Task
from pathlib import Path


parser = argparse.ArgumentParser()
parser.add_argument("project_name", type=str, help="project name")
parser.add_argument("task_name", type=str, help="task name")
parser.add_argument("--files", nargs='+', type=str, help="list of files/directories to upload", required=True)
parser.add_argument("--names", nargs='+', type=str, help="names corresponding to the provided list of files (uses filename if not provided)", required=False)
args = parser.parse_args()

if args.names:
    assert len(args.names) == len(args.files)
    file_names = args.names
else:
    file_names = [Path(f).parts[-1] for f in args.files]
    if len(file_names) != len(set(file_names)):
        sys.exit("Some of the provided files have the same names, please use --names to provide unique names for all files")

task1 = Task.init(project_name=args.project_name, task_name=args.task_name)

for file_path, file_name in zip(args.files, file_names):
    task1.upload_artifact(name=file_name, artifact_object=file_path)
print(task1.id)
