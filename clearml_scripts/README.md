# Docker and ClearML scripts

You can use these scripts to finetune DeltaLM and generate translations.

Pre-built docker images can be found [here](https://hub.docker.com/r/zs12/qaware_decode/tags).

If you haven't setup ClearML yet, please do so by following the instructions for the [clearml-task client](https://clear.ml/docs/latest/docs/getting_started/ds/ds_first_steps) and the [clearml agent](https://clear.ml/docs/latest/docs/getting_started/mlops/mlops_first_steps#set-up-an-agent).

Note: `clearml-agent` should be started in docker mode. You can also set `agent.package_manager.system_site_packages: true` and `docker_install_opencv_libs: false` for faster docker spinup time (see example_agent_clearml.conf)

## Usage

Before running `run_clearml_docker_mbr.sh` or `run_clearml_docker_rerank.sh`, please first change the variable values at the top of the scripts. Any datasets/models/data files needed by the code will first need to be uploaded to the ClearML fileserver using `clearml-data` or `upload_artifacts.py`. After that, these files/directories can be passed in as commandline arguments in the following format:
~~~
# datasets
"clearml_dataset/${clearml_dataset_ID}/filename"
# artifacts
"clearml_artifact_input/${clearml_artifact_ID}/${artifact_name}/filename" 
~~~
The code will automatically download these dataset/artifacts to the local machine before using them.

In addition, if you provide a path of the form `clearml_artifact_output/${output_filename}` to the scripts, that output file will be automatically uploaded to the ClearML server as an artifact.

Once the script finishes executing, you will be able to see the status of all the steps in the ClearML web UI. You can easily re-run any of these steps by cloning the task, editing hyperparameters and executing it again, all from within the ClearML UI.
