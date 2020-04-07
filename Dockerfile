FROM ubuntu:18.04

LABEL maintainer="anton.indrawan@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    autoconf \
    curl \
    file \
    gcc-multilib \
    g++-multilib \
    gdb \
    git \
    graphviz \
    make \
    ninja-build \
    rsync \
    python3 \
    python3-pip \
    software-properties-common \
    tree \
    valgrind \
    vim \
    wget \
 && rm -rf /var/lib/apt/lists

COPY python-requirements.txt /tmp/

RUN pip3 install --upgrade pip \
 && pip3 install --no-cache-dir --upgrade setuptools \
 && pip3 install --no-cache-dir --upgrade -r /tmp/python-requirements.txt \
 && rm /tmp/python-requirements.txt

# Install wayland
RUN apt-get update && apt-get install -y --no-install-recommends \
    libwayland-dev \
    libwayland-egl1-mesa \
    libwayland-server0 \
    libgles2-mesa-dev \
    libxkbcommon-dev \
    ibxkbcommon-x11-dev \
    weston \
 && rm -rf /var/lib/apt/lists

# Install cmake
ARG CMAKE_VERSION=3.17.0
RUN curl https://cmake.org/files/v3.17/cmake-3.17.0-Linux-x86_64.tar.gz | tar xzvf - -C /usr/local
ENV PATH="/usr/local/cmake-3.17.0-Linux-x86_64/bin:${PATH}"

# Install boost
RUN apt-get update && apt-get install -y --no-install-recommends \
    libboost-chrono-dev \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-log-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev \
 && rm -rf /var/lib/apt/lists
