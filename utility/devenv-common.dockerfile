FROM ubuntu:20.04
ARG MIRROR=archive.ubuntu.com
ARG ROOTPW=1234

# 22        ssh
EXPOSE 22

# configure apt
RUN apt-get update &&\
    sed s@archive.ubuntu.com@${MIRROR}@g /etc/apt/sources.list -i &&\
    apt-get update

# install essential
RUN echo ">> installing packages ...";\
    # install required packages
    DEBIAN_FRONTEND="noninteractive" apt-get install -y\
    iputils-ping net-tools wget curl\
    vim tmux git\
    openssh-server openssh-client

# configure ssh
RUN echo ">> configuring ssh ...";\
    echo "Port 22" >> /etc/ssh/sshd_config &&\
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config &&\
    echo "root:${ROOTPW}" | chpasswd

# setup startup command
WORKDIR /root
RUN echo "#!/usr/bin/env bash" > .entry.sh &&\
    chmod +x .entry.sh &&\
    echo   "service ssh start &&\
    /bin/bash $@" > .entry.sh

# docker run -dt -p<SSH>:22 -p<GDBSERV>:5050 <IMG>
CMD [ "/bin/bash", "/root/.entry.sh" ]
