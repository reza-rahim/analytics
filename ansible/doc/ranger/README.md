```
# build the docker container for ranger compilation
cd docker_ranger_compile

docker build -t ranger_build .

wget https://github.com/apache/ranger/archive/refs/tags/release-ranger-2.3.0.tar.gz

tar xvf release-ranger-2.3.0.tar.gz

cd ranger-release-ranger-2.3.0

docker run -it -v "${PWD}:/ranger" -v "${PWD}/.m2:/root/.m2"  ranger_build bash

cd /ranger/distro

#mvn -Pall -DskipTests=true  -Drat.numUnapprovedLicenses=10000 clean compile package install
mvn -Pranger-jdk11 -DskipTests=true  -Drat.numUnapprovedLicenses=10000 clean compile package install

# create trino plugin
mvn clean compile package install -Dmaven.test.skip=true -Drat.skip=true -Dpmd.skip=true -Dfindbugs.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true

```
# build the docker container for ranger admin
cd docker_ranger_admin

docker build -t rahimre/ranger_admin .

```


```
#elastisearch
volume /usr/share/elasticsearch/data needs to be mounted

docker run -e discovery.type=single-node -e xpack.security.enabled=false -p 9200:9200 -d  docker.elastic.co/elasticsearch/elasticsearch:8.6.0 

```
