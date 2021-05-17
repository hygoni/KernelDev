FROM ubuntu:20.10
LABEL maintainer="Hyeonggon Yoo <42.hyeyoo@gmail.com>"

# Configuration

ENV LINUX_MAINLINE=n
ENV LINUX_STABLE=n
ENV LINUX_STABLE_RC=y
ENV LINUX_MM=y
ENV LINUX_NEXT=y

RUN apt-get update

# install minimal requirements for compile linux kernel
# See: https://www.kernel.org/doc/html/latest/process/changes.html
# See: https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html

RUN apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev

# install packages for development

RUN apt-get install -y git exuberant-ctags vim cscope mutt

# clone linux kernel repositories

RUN if [ "$LINUX_MAINLINE" = "y" ]; then git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git; fi
RUN if [ "$LINUX_STABLE" = "y" ]; then git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git; fi
RUN if [ "$LINUX_STABLE_RC" = "y" ]; then git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git; fi
RUN if [ "$LINUX_MM" = "y" ]; then git clone https://github.com/hnaz/linux-mm.git; fi
RUN if [ "$LINUX_NEXT" = "y" ]; then git clone https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git; fi
