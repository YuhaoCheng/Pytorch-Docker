#! /bin/bash
# Create a container based on a docker image

container_name='kdpose2'
image_name='pose:test'
data='/export/home/chengyh/data'
log='/export/home/chengyh/pose-estimation/log'
output='/export/home/chengyh/pose-estimation/output'
models='/export/home/chengyh/pose-estimation/models'

nvidia-docker run -d -ti --ipc=host --name $name -v $data:/home/appuser/data -v $models:/home/appuser/pose-estimation/models \
                                      -v $log:/home/appuser/pose-estimation/log \
                                      -v $output:/home/appuser/pose-estimation/output \
                                       $image_name /bin/bash