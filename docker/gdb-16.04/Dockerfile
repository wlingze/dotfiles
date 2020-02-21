FROM ubuntu:16.04

COPY sources.list /etc/apt/sources.list

RUN apt-get -y update && \
    apt install -y \
    libc6-dbg\
    git \
    gdb && \
    rm -rf /var/lib/apt/list/*

RUN pip install \
    ropgadget\
    uncorn\
    capstone\
    angr\
    pwntools

RUN mkdir pwn &&\
    cd pwn 

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

WORKDIR /work/
