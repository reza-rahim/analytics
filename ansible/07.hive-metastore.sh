ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
hive-metastore.yaml
