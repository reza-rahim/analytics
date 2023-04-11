from pyspark.sql import SparkSession
from pyspark.conf import SparkConf
import os

#conf = (SparkConf())
conf = (SparkConf().set("spark.sql.catalog.my_catalog.jdbc.user",os.environ.get('PGUSER')) \
       .set("spark.sql.catalog.my_catalog.jdbc.password",os.environ.get('PGPASSWORD')));         
            
spark = SparkSession.builder.config(conf=conf).master("spark://node-1:7077,node-2:7077").getOrCreate()



