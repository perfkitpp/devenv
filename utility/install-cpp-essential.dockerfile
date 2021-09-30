RUN apt-get update &&\
    apt-get -y install\
        gcc g++ gdb gdbserver\
        build-essential cmake ninja-build
