#!/bin/sh
docker build . -f Dockerfile -t openvino-guide
docker build . -f Dockerfile.jupyter --build-arg GID=`id -g` --build-arg UID=`id -u` -t openvino-jup
