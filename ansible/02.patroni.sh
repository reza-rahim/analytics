ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e db_password=${DB_PASSWORD}  \
patroni.yaml
