source env.sh ;
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
-e patroni_superuser_username=${DB_USER} \
-e patroni_superuser_password=${DB_PASSWORD} \
-e patroni_replication_username=${PATRONI_REPLICATION_USERNAME} \
-e patroni_replication_password=${PATRONI_REPLICATION_PASSWORD} \
-e keycloak_jupyter_client_secret=${KEYCLOAK_JUPYTER_CLIENT_SECRET} \
-e keycloak_trino_client_secret=${KEYCLOAK_TRINO_CLIENT_SECRET} \
-e keycloak_superset_client_secret=${KEYCLOAK_SUPERSET_CLIENT_SECRET} \
-e keycloak_airflow_client_secret=${KEYCLOAK_AIRFLOW_CLIENT_SECRET} \
-e trino_shared_secret=${TRINO_SHARED_SECRET} \
-e trino_password=${TRINO_PASSWORD} \
init.yaml
