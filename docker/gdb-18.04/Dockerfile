FROM ubuntu:18.04

COPY sources.list /etc/apt/sources.list

RUN apt-get -y update && \
    apt install -y \
    python3\
    python3-pip\
    gdb


RUN python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    ropgadget \
    pwntools 

RUN mkdir pwn &&\
    cd pwn 

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

WORKDIR /work/
