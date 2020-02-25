#!/bin/bash

# check if the DOCKER_HOST paramater is provided
if [ -z "$1" ]; then
  echo "Please provide docker host/ip address as parameter"
  exit 1
fi

# check if docker cli is insalled
if ! which docker &> /dev/null; then
  echo "Downloading docker cli and docker-compose cli"
  cd ~
  wget -q -O docker-cli.tar.gz https://download.docker.com/mac/static/stable/x86_64/docker-18.09.9.tgz && \
  tar -xzf docker-cli.tar.gz && \
  mv docker/docker /usr/local/bin/ && \
  rm -rf docker-cli.tar.gz docker
fi

# check if DOCKER_HOST is set
if [[ -z "${DOCKER_HOST}" ]]; then
  #DOCKER_HOST is not set
  echo "Setting DOCKER_HOST to "$1
  echo "export DOCKER_HOST="$1 >> ~/.bashrc
  source ~/.bashrc
else
  echo "WARNING! DOCKER_HOST is already set!"
fi
