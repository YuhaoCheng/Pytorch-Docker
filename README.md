# PyTorch-Docker
The Docker file helps to build a docker containing the PyTorch environment

## Docker 

### Introduction

- In order to make it easy to use, we create the docker image file

- `.condarc` is the channels of `conda`, we choose `tuna` source. Users can change it. 

### Usage

##### Build the docker image

```shell
sh build_docker.sh
```

##### Start the docker container

```
sh run_docker.sh
```

- change the config in `run_docker.sh`

##### Execute the docker image

```
sh exec_docker.sh
```

#### Note

- Changes in docker container can't be saved, expect users commit them
- We not suggest users to make changes in Docker, which will make the Docker image larger and break the rules of building good images

## Change the source of the PyPi

```dockerfile
RUN pip install pqi \
	&& pqi use tuna 
```



## Get the GitHub repo

`GITHIUB_TOKEN`

`GITHUB_REPO_NAME`

```dockerfile
RUN git clone  $GITHUB_TOKEN $GITHUB_REPO_NAME
```