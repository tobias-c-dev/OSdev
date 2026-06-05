FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    nasm \
    gcc \
    g++ \
    make \
    qemu-system-x86 \
    xorriso \
    mtools \
    gdb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /OSdev
