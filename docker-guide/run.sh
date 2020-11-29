#!/bin/sh
#docker run -it --rm -p 10003:8888 -v `realpath app`:/app openvino-jup:latest jupyter notebook --ip 0.0.0.0 --NotebookApp.password='sha1:618eee37fb55:6ba6f498317acdcd8657cf2c78116d2ec293795d' --no-browser
docker run -it --rm -p 10003:8888 -v `realpath app`:/app --name jup openvino-jup:latest sh /app/start_jup.sh

