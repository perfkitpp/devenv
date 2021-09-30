FROM ubuntu:20.04
ARG MIRROR=archive.ubuntu.com
ARG ROOTPW=1234

# 22        ssh
# 5050      gdbserver   
EXPOSE 22 5050

# configure apt
RUN apt-get update &&\
    sed s@archive.ubuntu.com@${MIRROR}@g /etc/apt/sources.list -i &&\
    apt-get update

RUN echo ">> installing packages ...";\
    # install required packages
    DEBIAN_FRONTEND="noninteractive" apt-get install -y\
    iputils-ping net-tools wget curl\
    vim tmux git\
    openssh-server openssh-client
    
RUN apt-get install -y nodejs npm

# configure ssh
RUN echo ">> configuring ssh ...";\
    echo "Port 22" >> /etc/ssh/sshd_config &&\
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config &&\
    echo "root:${ROOTPW}" | chpasswd
    