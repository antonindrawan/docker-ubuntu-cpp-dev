docker run -it --rm --net=host -u $(id -g):$(id -u) -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v $HOME:$HOME -w $HOME antonindrawan/ubuntu-cpp-dev:latest
