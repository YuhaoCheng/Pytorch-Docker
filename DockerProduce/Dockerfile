# Base on the cuda101
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

# Make the vars
# user
ARG USER_ID=1000
ARG USER_NAME='appuser'
# conda name
ARG CONDA_NAME='pose'
# environment names
ARG PYTHON='3.7'
ARG PYTORCH='1.6'
ARG CUDATOOLKIT='10.1'

# Build the miniconda3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y software-properties-common && \
    add-apt-repository -r ppa:kirillshkrogalev/ffmpeg-next && \
    apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion ffmpeg vim tmux && \
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


RUN useradd -m --no-log-init --system  --uid ${USER_ID} ${USER_NAME} -g sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && groupadd -g ${USER_ID} ${USER_NAME} \
    && chown -R ${USER_NAME}:${USER_NAME} /opt/conda 

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
COPY .condarc /home/${USER_NAME}

# Create the environment and install the pytorch1.6
RUN conda create -n ${CONDA_NAME} python=${PYTHON} \
    && /bin/bash -c "source activate ${CONDA_NAME}" \
    && conda install pytorch==${PYTORCH} torchvision cudatoolkit=${CUDATOOLKIT} -c pytorch 

# Get the Github
# Follow  the instructions on the Readme

WORKDIR /home/${USER_NAME}
# Inital 
# CMD conda run -n pyanomaly
# ENTRYPOINT conda run -n pyanomaly
