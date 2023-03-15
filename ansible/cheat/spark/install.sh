apt update
apt install default-jre

useradd spark
chown -R spark:spark /opt/spark

wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3-scala2.13.tgz
tar xvf spark-3.3.2-bin-hadoop3-scala2.13.tgz
mv spark-3.3.2-bin-hadoop3-scala2.13.tgz /opt/spark 


wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar -O /opt/spark/jars/hadoop-aws-3.2.2.jar
wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.99/aws-java-sdk-bundle-1.12.99.jar -O /opt/spark/jars/aws-java-sdk-bundle-1.12.99.jar
wget https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.3_2.13/1.1.0/iceberg-spark-runtime-3.3_2.13-1.1.0.jar -O /opt/spark/jars/iceberg-spark-runtime-3.2_2.12-0.13.1.jar 

#service file location
/etc/systemd/system/spark-master.service
/etc/systemd/system/spark-worker.service


SPARK_NO_DAEMONIZE=true

systemctl daemon-reload
systemctl restart   spark-master
systemctl restart   spark-worker

systemctl status   spark-master 
systemctl status   spark-worker 



export SPARK_HOME=/opt/spark/

$SPARK_HOME/bin/spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.3_2.13:1.1.0 \
    --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
    --conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
    --conf spark.sql.catalog.spark_catalog.type=hive \
    --conf spark.hadoop.hive.metastore.uris=thrift://minio-node-2:9083 \
    --conf spark.hadoop.fs.s3a.endpoint=http://minio-node-1:9000 \
    --conf spark.hadoop.fs.s3a.access.key=minioadmin \
    --conf spark.hadoop.fs.s3a.secret.key=minioadmin \
    --conf spark.hadoop.path.style.access=true \
    --conf spark.hadoop.fs.s3a.connection.ssl.enabled=false \
    --conf spark.hadoop.fs.s3a.attempts.maximum=1 \
    --conf spark.hadoop.datanucleus.autoCreateSchema=true \
    --conf spark.hadoop.datanucleus.fixedDatastore=false \
    --conf spark.hadoop.fs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider \
    --conf spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem \
    --conf fs.s3a.connection.establish.timeout=500

#--conf spark.hadoop.fs.s3a.endpoint=http://192.168.1.4:9000 \
