
### https://luminousmen.com/post/dive-into-spark-memory

## sparksql
/opt/spark/bin/spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:1.1.0 \
 --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
 --conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
 --conf spark.sql.catalog.spark_catalog.type=hive \
 --conf spark.hadoop.hive.metastore.uris=thrift://minio-node-2:9083 \
 --conf spark.hadoop.hive.metastore.warehouse.dir=s3a://warehouse/ \
 --conf spark.hadoop.fs.s3a.endpoint=http://127.0.0.1:9000 \
 --conf spark.hadoop.fs.s3a.access.key=minioadmin \
 --conf spark.hadoop.fs.s3a.attempts.maximum=1 \
 --conf spark.hadoop.datanucleus.autoCreateSchema=true \
 --conf spark.hadoop.datanucleus.fixedDatastore=false \
 --conf spark.hadoop.fs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider \
 --conf spark.hadoop.fs.s3a.secret.key=minioadmin 

