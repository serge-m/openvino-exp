FROM ubuntu:bionic
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"

# Arguments
ARG OPENVINO_VERSION=2020.2.120

# Environments
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV PIP_DEFAULT_TIMEOUT=100

# OpenVINO Directories
ENV OPENVINO_DIR=/openvino
ENV INSTALL_DIR=/opt/intel

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash-completion \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    dbus-x11 \
    g++ \
    gcc \
    gconf-service \
    gconf2 \
    git \
    gnupg \
    gvfs-bin \
    libasound2 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libcap2 \
    libgconf-2-4 \
    libgtk2.0-0 \
    libnotify4 \
    libnss3 \
    libx11-xcb-dev \
    libxkbfile1 \
    libxss1 \
    libxtst6 \
    make \
    mpg123 \
    nano \
    python3-dev \
    python3-tk \
    software-properties-common \
    sudo \
    vim \
    wget \
    x11-apps \
    xdg-utils \
    && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/

# Video Libraries Dependencies
# hadolint ignore=DL3008,DL3015
RUN apt-get update && apt-get install -y \
    fswebcam \
    libavcodec-dev \
    libavformat-dev \
    libjpeg-dev \
    libpng-dev \
    libswscale-dev \
    libtiff-dev \
    libv4l-dev \
    v4l-utils \
    && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y install --no-install-recommends \
    libkrb5-dev \
    libprotobuf-dev \
    libzmq3-dev \
    protobuf-compiler \
    && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/

# Other dependencies
RUN python3 -m pip install \
    ipython['all'] \
    loguru \
    matplotlib \
    numpy \
    pyyaml \
    scikit-image \
    scikit-learn \
    tqdm

RUN rm -rf /usr/bin/python && \
    ln -s /usr/bin/python3 /usr/bin/python

WORKDIR ${OPENVINO_DIR}

RUN wget -P /tmp "http://registrationcenter-download.intel.com/akdlm/irc_nas/16612/l_openvino_toolkit_p_${OPENVINO_VERSION}.tgz"  && \
    mv /tmp/l_openvino_toolkit_p_*.tgz . && \
    tar zxvf l_openvino_toolkit_p_*.tgz --strip-components=1 && \
    rm -rf l_openvino_toolkit_p_*.tgz

# installing OpenVINO dependencies
RUN ./install_openvino_dependencies.sh
# installing OpenVINO itself
RUN sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh --silent silent.cfg

# Install Model Optimizer prerequisites
ENV OPEN_MODEL_ZOO=${INSTALL_DIR}${OPENVINO_DIR}/deployment_tools
RUN ${OPEN_MODEL_ZOO}/model_optimizer/install_prerequisites/install_prerequisites.sh

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf \
        /var/lib/apt/lists/* \
        /var/cache/apt/archives


