
```
# build the docker container
docker build -t ranger_build .


wget https://github.com/apache/ranger/archive/refs/tags/release-ranger-2.3.0.tar.gz

tar xvf release-ranger-2.3.0.tar.gz

cd ranger-release-ranger-2.3.0

docker run -it -v "${PWD}:/ranger" -v "${PWD}/.m2:/root/.m2"  ranger_build bash

cd /ranger/distro

#mvn -Pall -DskipTests=true  -Drat.numUnapprovedLicenses=10000 clean compile package install
mvn -Pranger-jdk11 -DskipTests=true  -Drat.numUnapprovedLicenses=10000 clean compile package install


```
