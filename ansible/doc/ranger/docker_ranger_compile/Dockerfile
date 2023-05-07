FROM ubuntu:latest

RUN apt update
RUN apt install -y wget
RUN apt install -y git
RUN apt install -y gcc
RUN apt install -y bzip2 fontconfig

RUN apt install -y openjdk-11-jdk

ENV JAVA_HOME /usr/lib/jvm/java-1.11.0-openjdk-amd64

ADD https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz /tools/

WORKDIR /tools
RUN tar xvf /tools/apache-maven-3.6.3-bin.tar.gz 
RUN ln -sf /tools/apache-maven-3.6.3 /tools/maven

ENV  PATH /tools/maven/bin:$PATH
ENV MAVEN_OPTS "-Xmx2048m -XX:MaxPermSize=512m"

