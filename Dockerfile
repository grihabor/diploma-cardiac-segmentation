FROM ubuntu:18.04
MAINTAINER Borodin Gregory <grihabor@gmail.com>

RUN apt update \
 && apt install make tzdata

RUN echo "Europe/Moscow" > /etc/timezone \
 && dpkg-reconfigure tzdata

WORKDIR /project
ADD Makefile Makefile

RUN make install
