#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader:/opt/intel/openvino/deployment_tools/model_optimizer:~/.local/bin
export PYTHONPATH=/opt/intel/openvino/data_processing/dl_streamer/python:/opt/intel/openvino/deployment_tools/model_optimizer:/opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader:/opt/intel/openvino/deployment_tools/open_model_zoo/tools/accuracy_checker:/opt/intel/openvino/python/python3:/opt/intel/openvino/python/python3.6:
source /opt/intel/openvino/bin/setupvars.sh
jupyter notebook --ip 0.0.0.0 --NotebookApp.password='sha1:618eee37fb55:6ba6f498317acdcd8657cf2c78116d2ec293795d' --no-browser
