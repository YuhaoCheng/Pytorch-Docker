# PyTorch-Docker
The Docker file helps to build a docker containing the PyTorch environment

## Introduction

- In order to make it easy to use, we create the docker image file
- `.condarc` is the channels of `conda`, we choose `tuna` source. Users can change it. 
- All the images are using `ubuntu`  and `miniconda`

## Requirements

- `docker`
- `nvidia-docker`



## To-do List
- [x] Make the general docker file
- [x] Change the way to determine the version of packages
- [ ] Improve the methods to run the docker
- [ ] Add the Produce environment Docker
  - [x] Make the general environment
  - [ ] Add `Horovod` 
- [x] Make be able to use the `tmux` in develop docker
- [ ] Change the general mount methods, which will mount the whole host drives to the container
- [ ] Make the ssh link


## Structure
The structure of the folders are as following:

```shell
---ROOT
 |--Dockerfiles
 	|--DockerBasePytorch
 	|--DockerExperiments
 	|--DockerInferace
 	|--DockerProduce
 |--shellTools
 |--pythonTools
```
- `DockerBasePyotrch` contains the fundamental environments
- `DockerExperiments` contains some really useful tools in doing the AI experiments
- `DockerInference` is basically same as the `base-pytorch`, while we remove some not used packages in testing process
- `DockerProduce` is used in the real applications 

## Image Name

The image is  named as the following rules:

- names are: `basepytorch`, `experiments`, `inferace`, `produce`

- tags are: `pytorchXX_cuXX`

  Bas


###  Usage:

##### Pull the image from docker hub

We provide some images on the docker hub, you can directly download these images. For example, you can pull the image such as :

```
docker pull roviocyh/pytorch16-cu101:latest
```

if you can download the image, you can skip the building part. If not, you should build the image by yourself. 

**Note:** The dockerfile in the github is always the latest version, if you want to use the previous version, you should download from the docker hub. 

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