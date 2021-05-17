FROM ubuntu:20.10
LABEL maintainer="Hyeonggon Yoo <42.hyeyoo@gmail.com>"

RUN apt-get update

# install minimum requirements for building linux kernel

RUN apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev
