# Base on the cuda101
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

# Make the vars
# environment names
ARG PYTHON='3.7'
ARG PYTORCH='1.6'
ARG CONDA_VERSION='4.8.5'
ARG CUDATOOLKIT='10.1'

# Build the miniconda3
# change the source of the packages
# RUN echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 ./" >> /etc/apt/sources.list.d/cuda.list && \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list&& \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list&& \
#     echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
#     echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list 
# RUN apt-get clean

RUN apt-get update --fix-missing && \
    apt-get install -y software-properties-common && \
    add-apt-repository -r ppa:kirillshkrogalev/ffmpeg-next && \
    apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion ffmpeg vim curl cmake && \
    apt-get install -y tmux && \
    apt-get install -y sudo && \
    apt-get clean 

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

# add the user
# RUN useradd -m --no-log-init --system  --uid ${USER_ID} ${USER_NAME} -g sudo \
#     && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
#     && groupadd -g ${USER_ID} ${USER_NAME} \
#     && chown -R ${USER_NAME}:${USER_NAME} /opt/conda 

ENV PATH /opt/conda/bin:$PATH

# USER ${USER_NAME}
WORKDIR /root/
COPY .condarc /root/

# Create the environment and install the pytorch1.6
RUN conda create -n ${CONDA_NAME} python=${PYTHON} \
    && /bin/bash -c "source activate $CONDA_NAME" \
    && conda install pytorch==${PYTORCH} torchvision cudatoolkit=${CUDATOOLKIT} -c pytorch 

# # Get the Github
# # Follow  the instructions on the Readme

