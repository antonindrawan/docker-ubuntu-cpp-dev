#! /usr/bin/env bash

set -e
set -u

# Look behind (?<= ) to ignore the 'version=' part
version=$(grep -oP '(?<=version=).*' version.txt)

git tag ${version}
git push origin master --tag ${version}
