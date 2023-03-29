ansible-playbook -i inventory.ini \
-e s3_protocol=$S3_PROTOCOL  \
-e db_user=${DB_USER}  \
hive-metastore.yaml
