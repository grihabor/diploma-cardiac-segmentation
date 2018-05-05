FROM ubuntu:18.04
MAINTAINER Borodin Gregory <grihabor@gmail.com>

RUN apt update \
 && apt install make

WORKDIR /project
ADD . .

RUN apt install
