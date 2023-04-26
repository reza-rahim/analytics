source env.sh
ansible-playbook -i inventory.ini   minio.yaml
echo "sleeping..."
sleep 15
#mc  alias set s3   https://minio.mnbvcxz.com:9000  $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc  alias set s3   http://minio.mnbvcxz.com:9000  $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc mb s3/spark
mc mb s3/warehouse
mc mb s3/airflow
mc mb s3/airflow-log
mc mb s3/jupyterhub
mc mb s3/spark-app
mc mb s3/spark-data
touch init
mc cp init s3/spark/logs/init/init
mc cp init s3/airflow/init
mc cp example/simple_iceberg_demo_v4.ipynb  s3/jupyterhub/simple_iceberg_demo_v4.ipynb
mc cp example/01.hello_world_dag.py  s3/airflow/01.hello_world_dag.py
mc cp example/02.spark.py  s3/airflow/02.spark.py
