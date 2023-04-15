source env.sh ;
ansible-playbook -i inventory.ini \
-e keycloak_minio_id=$KEYCLOAK_MINIO_ID \
-e keycloak_minio_client_id=$KEYCLOAK_MINIO_CLIENT_ID \
-e keycloak_minio_client_secret=$KEYCLOAK_MINIO_CLIENT_SECRET \
-e keycloak_jupyter_id=$KEYCLOAK_JUPYTER_ID \
-e keycloak_jupyter_client_id=$KEYCLOAK_JUPYTER_CLIENT_ID \
-e keycloak_jupyter_client_secret=$KEYCLOAK_JUPYTER_CLIENT_SECRET \
-e keycloak_trino_id=$KEYCLOAK_TRINO_ID \
-e keycloak_trino_client_id=$KEYCLOAK_TRINO_CLIENT_ID \
-e keycloak_trino_client_secret=$KEYCLOAK_TRINO_CLIENT_SECRET \
-e keycloak_superset_id=$KEYCLOAK_SUPERSET_ID \
-e keycloak_superset_client_id=$KEYCLOAK_SUPERSET_CLIENT_ID \
-e keycloak_superset_client_secret=$KEYCLOAK_SUPERSET_CLIENT_SECREt \
-e keycloak_airflow_id=$KEYCLOAK_AIRFLOW_ID \
-e keycloak_airflow_client_id=$KEYCLOAK_AIRFLOW_CLIENT_ID \
-e keycloak_airflow_client_secret=$KEYCLOAK_AIRFLOW_CLIENT_SECRET \
-e Keycloak_admin=$KEYCLOAK_ADMIN \
-e keycloak_admin_psassword=$KEYCLOAK_ADMIN_PSASSWORD \
-e keycloak_devel_user=$KEYCLOAK_DEVEL_USER \
-e keycloak_devel_password=$KEYCLOAK_DEVEL_PASSWORD \
-e keycloak_bi_user=$KEYCLOAK_BI_USER \
-e keycloak_bi_password=$KEYCLOAK_BI_PASSWORD \
keycloak.yaml;


