https://blog.min.io/lakehouse-architecture-iceberg-minio/


https://tabular.io/blog/rest-catalog-docker/
https://github.com/tabular-io/iceberg-rest-image
export CATALOG_JDBC_PASSWORD=postgres
export CATALOG_JDBC_USER=postgres
export CATALOG_URI=jdbc:postgresql://127.0.0.1:5000/iceberg 
export CATALOG_WAREHOUSE=s3a://warehouse/wh/
export CATALOG_S3_ENDPOINT=http://minio:9000

java -cp ".;/usr/lib/iceberg-rest/aws-java-sdk-bundle-1.12.99.jar:/usr/lib/iceberg-rest/hadoop-aws-3.3.2.jar:iceberg-rest-image-all.jar:" org.apache.iceberg.rest.RESTCatalogServer  
