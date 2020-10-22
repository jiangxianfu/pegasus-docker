#!/bin/bash
# This script runs build pegasus images.
os=${1:-'centos7'}
tag=${2:-'latest'}
echo os=${os}
echo tag=${tag}
docker build -t pegasus:${tag} images/${os}
