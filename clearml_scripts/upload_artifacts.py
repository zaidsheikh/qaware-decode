#!/usr/bin/env python
# -*- coding: utf-8 -*-


import argparse
from clearml import Task


parser = argparse.ArgumentParser()
parser.add_argument("project_name", type=str, help="project name")
parser.add_argument("task_name", type=str, help="task name")
parser.add_argument("--files", nargs='+', type=str, help="list of files/directories to upload", required=True)
args = parser.parse_args()

task1 = Task.init(project_name=args.project_name, task_name=args.task_name)
for file_path in args.files:
    artifact_name = file_path.rstrip('/').replace('/', '.slash.')
    task1.upload_artifact(name=artifact_name, artifact_object=file_path)
print(task1.id)
