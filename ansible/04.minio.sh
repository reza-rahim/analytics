source env.sh
ansible-playbook -i inventory.ini   minio.yaml
echo "sleeping..."
sleep 15
mc  alias set s3   https://minio.mnbvcxz.com:9000  $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc mb s3/spark
mc mb s3/warehouse
mc mb s3/airflow
mc mb s3/jupyterhub
touch init
mc cp init s3/spark/logs/init/init
mc cp init s3/airflow/init
mc cp example/simple_iceberg_demo_v4.ipynb  s3/jupyterhub/simple_iceberg_demo_v4.ipynb
