#! /bin/bash
# Make the docker image based on the docker file
DOCKERFILE_PATH='Docker'
DACKER_NAME='pose'
DOCKER_TAG='latest'
cd $DOCKERFILE_PATH
nvidia-docker build -t $DACKER_NAME:$DOCKER_TAG .