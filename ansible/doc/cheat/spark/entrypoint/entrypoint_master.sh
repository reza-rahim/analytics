#!/bin/bash

/opt/spark/sbin/start-master.sh -h spark; 

export SPARK_HISTORY_OPTS="$SPARK_HISTORY_OPTS  \
-Dspark.hadoop.fs.s3a.attempts.maximum=1  \
-Dspark.hadoop.fs.s3a.connection.establish.timeout=500  \
-Dspark.hadoop.fs.s3a.connection.ssl.enabled=false \
-Dspark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
-Dspark.hadoop.fs.s3a.endpoint=http://172.18.0.12:9000 \
-Dspark.hadoop.fs.s3a.access.key=demo \
-Dspark.hadoop.fs.s3a.secret.key=demo1234 \
-Dspark.eventLog.enabled=true \
-Dspark.eventLog.dir=s3a://spark/logs/ \
-Dspark.history.fs.logDirectory=s3a://spark/logs/ "

#$SPARK_HOME/sbin/start-history-server.sh

while true
do
   echo Keep running
   sleep 3600
 done
