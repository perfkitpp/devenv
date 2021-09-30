# syntax = edrevo/dockerfile-plus
INCLUDE+ ./utility/devenv-common.dockerfile

INCLUDE+ ./utility/install-cpp-essential.dockerfile
INCLUDE+ ./utility/install-spdlog.dockerfile

## C++ Crow ##
WORKDIR /tmp
RUN apt-get -y install libboost-all-dev

EXPOSE  \
#       gdbserver
        5050\
#       API server
        15572\
#       Perfkit Instance Connection
        25572

