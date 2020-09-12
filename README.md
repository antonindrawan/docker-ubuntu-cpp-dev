# docker-ubuntu-cpp-dev

A docker image with various packages for C++ development on Ubuntu 20.04.

To create a container and enter the container's shell, run the following command as an example:

    docker run -it --rm --net=host -u $(id -u):$(id -g) -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v $HOME:$HOME -w $HOME antonindrawan/ubuntu-cpp-dev:<version> bash
