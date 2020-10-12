#! /bin/bash
# Activate a container
CONTAINER_NAME='kdpose'
nvidia-docker exec -ti $CONTAINER_NAME /bin/bash