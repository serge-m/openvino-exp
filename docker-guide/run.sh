#!/bin/sh
docker run -it --rm -p 10003:8888 --user `id -u`:`id -g` -v `realpath app`:/app openvino-jup:latest /app/start_jup.sh

