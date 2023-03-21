import findspark
findspark.init()

from pyspark import SparkConf
from pyspark.sql import SparkSession


conf = (SparkConf().set("fs.s3a.impl","org.apache.hadoop.fs.s3a.S3AFileSystem") \
      .set("fs.s3a.aws.credentials.provider","org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider") \
      .set("fs.s3a.endpoint","http://127.0.0.1:9000") \
      .set("fs.s3a.access.key","minioadmin") \
      .set("fs.s3a.secret.key","minioadmin") \
      .set("fs.s3a.connection.establish.timeout",50)\
      .set("spark.hadoop.fs.s3a.attempts.maximum",1)\
      .set("fs.s3a.impl","org.apache.hadoop.fs.s3a.S3AFileSystem"));

spark = SparkSession.builder.config(conf=conf).master("spark://minio-node-1:7077").getOrCreate()
spark = SparkSession.builder.config(conf=conf).getOrCreate()
df=spark.read.format("csv").option("header","true").load('s3a://spark/test.csv')

df.head(4)
