mc --insecure alias set s3   https://minio.mnbvcxz.com:9000  minioadmin minioadmin
mc mb s3/spark
mc mb s3/warehouse
mc cp 02.s3bucket.sh s3/spark/logs/init/02.s3bucket.sh
