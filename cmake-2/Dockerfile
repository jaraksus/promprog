FROM ubuntu:20.04

WORKDIR /work

RUN apt-get update

RUN apt-get install -y build-essential

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y cmake

RUN apt-get install -y mcedit

RUN apt-get install -y wget

RUN apt-get install -y libssl-dev
RUN apt-get install -y libboost-all-dev

RUN apt-get install -y curl git pkg-config gnutls-bin libcurl4-openssl-dev libgsasl7 libgsasl7-dev libgnutls28-dev doxygen sendmail

COPY PatternsCollection /work/PatternsCollection