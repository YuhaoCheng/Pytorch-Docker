# PyTorch-Docker
The Docker file helps to build a docker containing the PyTorch environment

## Docker 

### Introduction

- In order to make it easy to use, we create the docker image file
- `.condarc` is the channels of `conda`, we choose `tuna` source. Users can change it. 

### To-do List
- [x] Make the general docker file
- [x] Change the way to determine the version of packages
- [ ] Improve the methods to run the docker
- [ ] Add the Produce environment Docker
  - [x] Make the general environment
  - [ ] Add `Horovod` 
- [x] Make be able to use the `tmux` in develop docker
- [ ] Change the general mount methods, which will mount the whole host drives to the container
- [ ] Make the ssh link

### Usage:

We provide the multi steps to create the docker images. The structure of the folders are as following:

```shell
---ROOT
 |--base-pytorch
 |--experiments
 |--produce
 |--inferace
```

- `base-pyotrch` contains the fundamental environments
- 

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