FROM ubuntu:20.04

LABEL maintainer="anton.indrawan@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    apt-transport-https \
    autoconf \
    curl \
    file \
    gcc-multilib \
    g++-multilib \
    gdb \
    git \
    graphviz \
    libboost-chrono-dev \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-log-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libwayland-dev \
    libwayland-egl1-mesa \
    libwayland-server0 \
    libgles2-mesa-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    make \
    ninja-build \
    rsync \
    python3 \
    python3-pip \
    software-properties-common \
    tree \
    valgrind \
    vim \
    weston \
    wget \
 && rm -rf /var/lib/apt/lists

COPY python-requirements.txt /tmp/

RUN pip3 install --upgrade pip \
 && pip3 install --no-cache-dir --upgrade setuptools \
 && pip3 install --no-cache-dir --upgrade -r /tmp/python-requirements.txt \
 && rm /tmp/python-requirements.txt

# Install cmake
ARG CMAKE_VERSION=3.18
ARG CMAKE_FULL_VERSION=3.18.2
RUN curl https://cmake.org/files/v${CMAKE_VERSION}/cmake-${CMAKE_FULL_VERSION}-Linux-x86_64.tar.gz | tar xzvf - -C /usr/local
ENV PATH="/usr/local/cmake-${CMAKE_FULL_VERSION}-Linux-x86_64/bin:${PATH}"
