#!/bin/sh
docker run --rm -p 10003:8888 --user `id -u`:`id -g` -v `realpath app`:/app --name openvino_jup openvino-jup:latest /app/start_jup.sh

