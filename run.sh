#!/usr/bin/bash

./build.sh && ./clean.sh
qemu-system-x86_64 build/os
