FROM  centos:centos7
  
RUN yum clean all
RUN yum install -y wget
RUN yum install -y git
RUN yum install -y gcc
RUN yum install -y bzip2 fontconfig
RUN yum install -y diffutils
RUN yum install -y python3

#RUN ln -s /usr/bin/python3 /usr/bin/python

RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
#ENV JAVA_HOME /etc/alternatives/jre
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
ENV PATH $JAVA_HOME/bin:$PATH

ADD https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz /tools/


WORKDIR /tools
RUN tar xvf /tools/apache-maven-3.6.3-bin.tar.gz
RUN ln -sf /tools/apache-maven-3.6.3 /tools/maven

ENV  PATH /tools/maven/bin:$PATH
ENV MAVEN_OPTS "-Xmx2048m -XX:MaxPermSize=512m"
