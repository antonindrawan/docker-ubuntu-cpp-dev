#! /usr/bin/env bash

set -e
set -u

# Look behind (?<= ) to ignore the 'version=' part
version=$(grep -oP '(?<=version=).*' version.txt)
docker build . --network=host -t antonindrawan/ubuntu-cpp-dev:${version}
