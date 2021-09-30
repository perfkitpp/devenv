# syntax = edrevo/dockerfile-plus
INCLUDE+ utility/devenv-common.dockerfile

RUN apt-get update &&\
    apt-get install -y nodejs npm
