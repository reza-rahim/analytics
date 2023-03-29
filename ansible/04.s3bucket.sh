mc  alias set s3   https://minio.mnbvcxz.com:9000  minioadmin minioadmin
mc mb s3/spark
mc mb s3/warehouse
mc cp *.s3bucket.sh s3/spark/logs/init/s3bucket.sh
