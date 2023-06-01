#Linux base image
FROM ubuntu:20.04

#working directory
WORKDIR /app

#dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    wget \
    gromacs \
    libgromacs-dev \
    libgomp1


#Download and install gromacs
RUN wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2021.2.tar.gz && \
    tar -zxvf gromacs-2021.2.tar.gz && \
    rm gromacs-2021.2.tar.gz && \
    cd gromacs-2021.2 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j4 && \
    make install && \
    cd ../.. && \
    rm -rf gromacs-2021.2


# Uncomment if building from source
# RUN wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2021.2.tar.gz && \
#     tar -zxvf gromacs-2021.2.tar.gz && \
#     rm gromacs-2021.2.tar.gz && \
#     mkdir build && \
#     cd build && \
#     cmake ../gromacs-2021.2 && \
#     make -j4 && \
#     make install && \
#     cd .. && \
#     rm -rf gromacs-2021.2 build


#Set the PATH environment variable
ENV LD_LIBRARY_PATH="/app/gromacs-2021.2/bin:${PATH}"
