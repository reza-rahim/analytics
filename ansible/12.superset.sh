source env.sh
ansible-playbook -i inventory.ini \
-e superset_secret_key=$SUPERSET_SECRET_KEY \
-e superset_admin_user=$SUPERSET_ADMIN_USER \
-e superset_admin_password=$SUPERSET_ADMIN_PASSWORD \
-e superset_admin_email=$SUPERSET_ADMIN_EMAIL \
-e trino_password=${TRINO_PASSWORD} \
-e db_user=$DB_USER \
-e db_password=$DB_PASSWORD \
superset.yaml
