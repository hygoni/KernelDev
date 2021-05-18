FROM ubuntu:20.10
LABEL maintainer="Hyeonggon Yoo <42.hyeyoo@gmail.com>"

# Configuration

ENV WORKDIR=/root

ENV LINUX_MAINLINE=n
ENV LINUX_MAINLINE_GIT=https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

ENV LINUX_STABLE=n
ENV LINUX_STABLE_GIT=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

ENV LINUX_STABLE_RC=y
ENV LINUX_STABLE_RC_GIT=https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git

ENV LINUX_MM=y
ENV LINUX_MM_GIT=https://github.com/hnaz/linux-mm.git

ENV LINUX_NEXT=y
ENV LINUX_NEXT_GIT=https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

ENV N_JOBS=6

RUN apt-get update

# install minimal requirements for compile linux kernel
# See: https://www.kernel.org/doc/html/latest/process/changes.html
# See: https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html

RUN apt-get install -y bc build-essential libncurses-dev bison flex libssl-dev libelf-dev

# install packages for development

RUN apt-get install -y git exuberant-ctags vim cscope mutt

# clone linux kernel repositories

RUN if [ "$LINUX_MAINLINE" = "y" ]; then git clone $LINUX_MAINLINE_GIT $WORKDIR/linux; fi
RUN if [ "$LINUX_STABLE" = "y" ]; then git clone $LINUX_STABLE_GIT $WORKDIR/linux-stable; fi
RUN if [ "$LINUX_STABLE_RC" = "y" ]; then git clone $LINUX_STABLE_RC_GIT $WORKDIR/linux-stable-rc; fi
RUN if [ "$LINUX_MM" = "y" ]; then git clone $LINUX_MM_GIT $WORKDIR/linux-mm; fi
RUN if [ "$LINUX_NEXT" = "y" ]; then git clone $LINUX_MM_GIT $WORKDIR/linux-next; fi

# install qemu and buildroot for testing

RUN apt-get install -y qemu-system
RUN git clone git://git.buildroot.net/buildroot $WORKDIR/buildroot

# build buildroot

RUN apt-get install -y cpio unzip wget rsync
COPY ./srcs/buildroot_config_x86_64 $WORKDIR/buildroot/.config
RUN cd $WORKDIR/buildroot && \
	make -j$N_JOBS

COPY ./scrcs/qemu.sh $WORKDIR/buildroot
