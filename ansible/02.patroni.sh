ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e db_password=${DB_PASSWORD}  \
-e replication_user=${REPLICATION_USER}  \
-e replication_password=${REPLICATION_PASSWORD}  \
patroni.yaml
