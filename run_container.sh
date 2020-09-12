#! /usr/bin/env bash
docker run -it --rm --net=host -u $(id -u):$(id -g) -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v $HOME:$HOME -w $HOME antonindrawan/ubuntu-cpp-dev:latest
