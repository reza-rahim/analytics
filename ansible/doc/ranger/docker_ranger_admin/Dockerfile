FROM  centos:centos7
ENV RANGER_VERSION=2.3.0
  
RUN yum clean all
RUN yum install -y wget
RUN yum install -y python3 


RUN yum install -y java-1.8.0-openjdk 
#ENV JAVA_HOME /etc/alternatives/jre
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV PATH $JAVA_HOME/bin:$PATH


RUN mkdir ranger
WORKDIR /ranger

ADD https://jdbc.postgresql.org/download/postgresql-42.2.23.jar /ranger/postgresql.jar 

COPY ranger-${RANGER_VERSION}-admin.tar.gz /ranger/
