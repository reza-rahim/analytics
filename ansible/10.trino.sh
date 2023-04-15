source env.sh
ansible-playbook -i inventory.ini \
-e keycloak_trino_client_id=$KEYCLOAK_TRINO_CLIENT_ID \
-e keycloak_trino_client_secret=$KEYCLOAK_TRINO_CLIENT_SECRET \
-e keycloak_bi_realm=$KEYCLOAK_BI_REALM \
-e fs_s3a_access_key=$FS_S3A_ACCESS_KEY \
-e fs_s3a_secret_key=$FS_S3A_SECRET_KEY \
trino.yaml
