#! /bin/bash
# Make the docker image based on the docker file
DOCKERFILE_PATH='Docker'
DACKER_NAME='pose'
DOCKER_TAG='latest'
cd $DOCKERFILE_PATH
# if you use the other version of the docker, the command will be different
nvidia-docker build -t $DACKER_NAME:$DOCKER_TAG .