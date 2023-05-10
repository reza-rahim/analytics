####  build the docker container for ranger compilation
```
cd docker_ranger_compile

docker build -t ranger_build .

wget https://github.com/apache/ranger/archive/refs/tags/release-ranger-2.3.0.tar.gz

tar xvf release-ranger-2.3.0.tar.gz

cd ranger-release-ranger-2.3.0

add the following repo to pom.xml file
   <repository>
        <id>maven-restlet</id>
        <name>Public online Restlet repository</name>
        <url>https://maven.restlet.talend.com/</url>
   </repository>


docker run -it -v "${PWD}:/ranger" -v "${PWD}/.m2:/root/.m2"  ranger_build bash

cd /ranger/

mvn clean compile package install -Dmaven.test.skip=true -Drat.skip=true -Dpmd.skip=true 


mvn clean compile package install -P ranger-trino-plugin,'!linux' -am
```
#### build the docker container for ranger admin
```
cd docker_ranger_admin

docker build -t rahimre/ranger_admin .

docker push rahimre/ranger_admin:2.3.0

docker run -it -v "./install.properties:/ranger/install.properties" -p 6080:6080 rahimre/ranger_admin:2.3.0  bash

```

#### elastisearch
```
volume /usr/share/elasticsearch/data needs to be mounted

docker run -e discovery.type=single-node -e xpack.security.enabled=false -p 9200:9200 -d  docker.elastic.co/elasticsearch/elasticsearch:8.6.0 

```
