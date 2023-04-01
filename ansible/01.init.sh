ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e db_password=${DB_PASSWORD}  \
-e fs_s3a_secret_key=${FS_S3A_SECRET_KEY} \
-e fs_s3a_access_key=${FS_S3A_ACCESS_KEY} \
-e keycloak_admin=${KEYCLOAK_ADMIN} \
-e keycloak_admin_password=${KEYCLOAK_ADMIN_PASSWORD} \
-e minio_root_user=${MINIO_ROOT_USER} \
-e minio_root_password=${MINIO_ROOT_PASSWORD} \
-e airflow_admin_username=${AIRFLOW_ADMIN_USERNAME} \
-e airflow_admin_password=${AIRFLOW_ADMIN_PASSWORD} \
-e aws_access_key_id=$AWS_ACCESS_KEY_ID \
-e aws_secret_access_key=$AWS_SECRET_ACCESS_KEY \
init.yaml
