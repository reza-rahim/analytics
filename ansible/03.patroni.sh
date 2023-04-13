source env.sh ;
ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e patroni_superuser_username=${DB_USER}  \
-e patroni_superuser_password=${DB_PASSWORD}  \
-e patroni_replication_user=${PATRONI_REPLICATION_USER}  \
-e patroni_replication_password=${PATRONI_REPLICATION_PASSWORD}  \
patroni.yaml
