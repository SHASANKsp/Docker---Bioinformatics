#Linux base image
FROM ubuntu:20.04

#working directory
WORKDIR /app

#dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	wget \
	zlib1g-dev \
	liblzma-dev \
	libbz2-dev \
	python

#Download and install Bedtools
RUN wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz && \
	tar -zxvf bedtools-2.30.0.tar.gz && \
	rm bedtools-2.30.0.tar.gz && \
	cd bedtools2 && \
	make && \
	make install

#Set the PATH environment variable
ENV PATH="/app/bedtools2/bin:${PATH}"