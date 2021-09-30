WORKDIR /tmp
RUN wget https://github.com/gabime/spdlog/archive/refs/tags/v1.9.2.tar.gz &&\
    tar -xzvf v1.9.2.tar.gz && cd spdlog-1.9.2 &&\
    mkdir -p build && cd build &&\
    cmake ..\
    -DCMAKE_INSTALL_PREFIX=/\
    -DCMAKE_BUILD_TYPE=Debug\
    && make install -j$(lscpu -b -p=CPU | grep -v '^#' | wc -l) &&\
    cmake ..\
    -DCMAKE_BUILD_TYPE=Release\
    && make install -j$(lscpu -b -p=CPU | grep -v '^#' | wc -l) 
    