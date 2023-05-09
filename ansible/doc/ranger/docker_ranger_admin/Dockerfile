FROM ubuntu:latest

ENV RANGER_VERSION=2.3.0

RUN apt update

RUN apt install -y openjdk-8-jdk

ENV JAVA_HOME /usr/lib/jvm/java-1..0-openjdk-amd64

RUN mkdir /ranger

WORKDIR /ranger

ADD https://jdbc.postgresql.org/download/postgresql-42.2.23.jar /ranger/postgresql.jar 

ADD https://github.com/reza-rahim/ranger/raw/main/ranger-${RANGER_VERSION}-admin.tar.gz /ranger

RUN tar xvf  ranger-${RANGER_VERSION}-admin.tar.gz 

WORKDIR /ranger/ranger-${RANGER_VERSION}-admin

