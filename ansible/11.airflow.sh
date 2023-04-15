source env.sh ;
ansible-playbook -i inventory.ini \
-e db_user=${DB_USER}  \
-e db_password=${DB_PASSWORD}  \
-e airflow_admin_username=$AIRFLOW_ADMIN_USERNAME \
-e airflow_admin_password=$AIRFLOW_ADMIN_PASSWORD \
airflow.yaml
