FROM ubuntu:20.10
LABEL maintainer="Hyeonggon Yoo <42.hyeyoo@gmail.com>"

RUN apt-get update

# install minimal requirements for compile linux kernel
# See: https://www.kernel.org/doc/html/latest/process/changes.html
# See: https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html

RUN apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev

# install packages for development

RUN apt-get install -y git exuberant-ctags vim cscope mutt
