#!/bin/bash

qemu-system-x86_64 \
    -drive format=raw,file=build/boot.bin \
    -monitor stdio