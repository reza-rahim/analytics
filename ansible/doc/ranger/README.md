```
# build the docker container for ranger compilation
cd docker_ranger_compile

docker build -t ranger_build .

wget https://github.com/apache/ranger/archive/refs/tags/release-ranger-2.3.0.tar.gz

tar xvf release-ranger-2.3.0.tar.gz

cd ranger-release-ranger-2.3.0

docker run -it -v "${PWD}:/ranger" -v "${PWD}/.m2:/root/.m2"  ranger_build bash

cd /ranger/

#in pom.xml look for the profile ranger-admin and distro module
<profile>
   <id>ranger-admin</id>
       <modules>
          <module>agents-common</module>
          <module>security-admin</module>
          <module>ugsync-util</module>
          <module>distro</module>
       </modules>
</profile>

mvn clean compile package install -Dmaven.test.skip=true -Drat.skip=true -Dpmd.skip=true -Dfindbugs.skip=true -Dspotbugs.skip=true -Dcheckstyle.skip=true

#look for ranger-2.3.0-admin.tar.gz in the target directory

#  create trino plugin
 <profile>
            <id>ranger-trino-plugin</id>
            <modules>
                <module>agents-audit</module>
                <module>agents-common</module>
                <module>agents-cred</module>
                <module>agents-installer</module>
                <module>credentialbuilder</module>
                <module>ranger-plugin-classloader</module>
                <module>ranger-util</module>
                <module>plugin-trino</module>
                <module>ranger-trino-plugin-shim</module>
                <module>distro</module>
            </modules>
        </profile>

mvn clean compile package install -P ranger-trino-plugin,'!linux' -am
```
# build the docker container for ranger admin
cd docker_ranger_admin

docker build -t rahimre/ranger_admin .

docker push rahimre/ranger_admin 

```


```
#elastisearch
volume /usr/share/elasticsearch/data needs to be mounted

docker run -e discovery.type=single-node -e xpack.security.enabled=false -p 9200:9200 -d  docker.elastic.co/elasticsearch/elasticsearch:8.6.0 

```
