# syntax = edrevo/dockerfile-plus
INCLUDE+ ./utility/devenv-common.dockerfile

INCLUDE+ ./utility/install-cpp-essential.dockerfile
INCLUDE+ ./utility/install-spdlog.dockerfile

## C++ Crow ##
WORKDIR /tmp
RUN wget https://github.com/CrowCpp/Crow/releases/download/v0.3%2B2/crow-v0.3+2.deb &&\
    apt-get -y install ./crow-v0.3+2.deb

EXPOSE  \
#       gdbserver
        5050\
#       API server
        15572\
#       Perfkit Instance Connection
        25572

