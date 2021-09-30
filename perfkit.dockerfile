# syntax = edrevo/dockerfile-plus
INCLUDE+ utility/devenv-common.dockerfile

INCLUDE+ ./utility/install-cpp-essential.dockerfile
INCLUDE+ ./utility/install-spdlog.dockerfile

# gdbserver access
EXPOSE 5050

