#!/bin/bash

cat << EOF > $CLEARML_CUSTOM_BUILD_OUTPUT
{
  "binary": "/opt/conda/envs/qaware-decode/bin/python",
  "entry_point": "$CLEARML_TASK_SCRIPT_ENTRY",
  "working_dir": "$CLEARML_TASK_WORKING_DIR"
}
EOF
