
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

___

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_S3_ENDPOINT=https://127.0.0.1:9000
export AWS_REGION=us-east-1

export DEPENDENCIES="org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:0.13.2"

spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:0.13.2 \

spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:1.1.0 \
--conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
--conf spark.sql.catalog.my_catalog=org.apache.iceberg.spark.SparkCatalog \
--conf spark.sql.catalog.my_catalog.catalog-impl=org.apache.iceberg.jdbc.JdbcCatalog \
--conf spark.sql.catalog.my_catalog.uri=jdbc:postgresql://127.0.0.1:5000/iceberg \
--conf spark.sql.catalog.my_catalog.jdbc.user=postgres \
--conf spark.sql.catalog.my_catalog.jdbc.password=postgres \
--conf spark.sql.catalog.my_catalog.arehouse=s3://warehouse \
--conf spark.sql.catalog.my_catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO \
--conf spark.sql.catalog.my_catalog.s3.endpoint=http://127.0.0.1:9000 \
--conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
--conf spark.sql.defaultCatalog=my_catalog \
--conf spark.sql.catalogImplementation=in-memory

spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:1.1.0  \
    --conf spark.sql.catalog.my_catalog=org.apache.iceberg.spark.SparkCatalog \
    --conf spark.sql.catalog.jdbc.my_catalog.warehouse=s3://warehouse/ \
    --conf spark.sql.catalog.jdbc.my_catalog.catalog-impl=org.apache.iceberg.jdbc.JdbcCatalog \
    --conf spark.sql.catalog.jdbc.my_catalog.uri=jdbc:postgresql://127.0.0.1:5000/iceberg \
    --conf spark.sql.catalog.jdbc.my_catalog.jdbc.user=postgres \
    --conf spark.sql.catalog.jdbc.my_catalog.jdbc.password=postgres



CREATE TABLE my_table (
id bigint,
data string,
category string)
USING iceberg
PARTITIONED BY (category);

LOCATION 's3://warehouse'

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_S3_ENDPOINT=https://127.0.0.1:9000
export AWS_REGION=us-east-1
export MINIO_REGION=us-east-1
export DEPENDENCIES="org.apache.iceberg:iceberg-spark-runtime-3.3_2.13:1.1.0"
export AWS_SDK_VERSION=2.17.230
export AWS_MAVEN_GROUP=software.amazon.awssdk
export AWS_PACKAGES=(
"bundle"
"url-connection-client"
)
for pkg in "${AWS_PACKAGES[@]}"; do
export DEPENDENCIES+=",$AWS_MAVEN_GROUP:$pkg:$AWS_SDK_VERSION"
done


spark-sql --packages $DEPENDENCIES \
--conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
--conf spark.sql.catalog.my_catalog=org.apache.iceberg.spark.SparkCatalog \
--conf spark.sql.catalog.my_catalog.catalog-impl=org.apache.iceberg.jdbc.JdbcCatalog \
--conf spark.sql.catalog.my_catalog.uri=jdbc:postgresql://127.0.0.1:5000/iceberg \
--conf spark.sql.catalog.my_catalog.jdbc.user=postgres \
--conf spark.sql.catalog.my_catalog.jdbc.password=postgres \
--conf spark.sql.catalog.my_catalog.warehouse=s3://warehouse \
--conf spark.sql.catalog.my_catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO \
--conf spark.sql.catalog.my_catalog.s3.endpoint=https://127.0.0.1:9000 \
--conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
--conf spark.sql.defaultCatalog=my_catalog \
--conf spark.sql.catalogImplementation=in-memory

CREATE TABLE my_table ( id bigint ) USING iceberg;

CREATE TABLE my_table (
id bigint,
data string,
category string)
USING iceberg
PARTITIONED BY (category);
