source env.sh
ansible-playbook -i inventory.ini -e db_user=${DB_USER}   spark.yaml
